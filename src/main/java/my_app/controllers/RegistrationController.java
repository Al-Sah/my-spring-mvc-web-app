package my_app.controllers;

import my_app.entities.Role;
import my_app.entities.User;
import my_app.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/registration")
    public String reg(){
        return "registration";
    }

    @PostMapping("/registration")
    public String add(@RequestParam(name = "username") String username,
                      @RequestParam(name = "password") String password,
                      @RequestParam(name = "confirmPassword") String confirmPassword, Map<String,Object> model){

        User DBUser = userRepository.findByUsername(username);

        if(DBUser != null){
            model.put("errorUserMessage", "User Exist(");
        }
        if(!password.equals(confirmPassword)){
            model.put("errorPswdMessage", "Wrong password!!!!! NOOB");
        }

        User newUser = new User(username, password,"",true);
        newUser.setRoles(Collections.singleton(Role.USER));
        userRepository.save(newUser);

        return "login";
    }
}
