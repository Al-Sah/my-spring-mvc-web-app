package my_app.controllers;

import my_app.entities.Role;
import my_app.entities.User;
import my_app.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/userControl")
@PreAuthorize("hasAuthority('ADMIN')")
/*@PreAuthorize("hasRole('ROLE_ADMIN')")*/
public class UserController {

    @Autowired
    private UserRepository userRepository;


    @GetMapping("/uL")
    public String usersList(Model model){
       Iterable<User> users = userRepository.findAll();
       model.addAttribute("users", users);

       return "usersList";
    }
    @GetMapping("{user}")
    public String usersList(@PathVariable User user, Model model){

        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping("edited")
    public String editUser(
            @RequestParam String username,
            @RequestParam Map<String,String> myForm,
            @RequestParam("userID") User user){

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

        return "redirect:/userControl/uL";
    }
}
