package my_app.services;

import my_app.entities.Role;
import my_app.entities.User;
import my_app.repositories.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    private final UserRepository userRepository;
    private final MyMailSender mailSender;
    public UserService(UserRepository userRepository, MyMailSender mailSender) {
        this.userRepository = userRepository;
        this.mailSender = mailSender;
    }

    public Iterable<User> getUsers() {
        return userRepository.findAll();
    }

    public User getUserByUsername(String username){
        return userRepository.findByUsername(username);
    }

    public void saveUser(User user, Map<String,String> myForm, String username){
        user.setUsername(username);
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();

        for(String key : myForm.keySet()){
            if(roles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }

    public void addUser(String username, String password, String email){
            User newUser = new User(username, password,email,true);
            newUser.setRoles(Collections.singleton(Role.USER));
            newUser.setActivateCode(UUID.randomUUID().toString());
            userRepository.save(newUser);

            String message = String.format(
                    "Hello, %s ! \n" + "Welcome. Go this link: http://localhost:8080/activate/%s",
                    username, newUser.getActivateCode()
            );

            if(!StringUtils.isEmpty(newUser.getEmail())){
                mailSender.send(email, "Activation Code", message);
            }
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username);
    }

    public boolean activateUser(String code) {
        User user = userRepository.findByActivateCode(code);

        if (user == null) {
            return false;
        }
        user.setActivateCode(null);

        userRepository.save(user);

        return true;
    }
}
