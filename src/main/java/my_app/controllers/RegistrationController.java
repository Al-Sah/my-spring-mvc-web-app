package my_app.controllers;

import my_app.entities.User;
import my_app.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class RegistrationController {

    private final UserService userService;
    public RegistrationController(UserService userService) {
        this.userService = userService;
    }


    @GetMapping("/registration")
    public String reg(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@RequestParam(name = "username") String username,
                          @RequestParam(name = "password") String password,
                          @RequestParam(name = "email") String email,
                          @RequestParam(name = "confirmPassword") String confirmPassword, Map<String,Object> model){

        User DBUser = userService.getUserByUsername(username);
        if(DBUser != null){
            model.put("errorUserMessage", "User Exist(");
        }
        if(!password.equals(confirmPassword)){
            model.put("errorPswdMessage", "Wrong password!!!!! NOOB");
        }
        userService.addUser(username,password, email);
        return "login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code){
        boolean isActivated = userService.activateUser(code);

        if(isActivated){
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("message", "Activation code is not found");
        }

        return "login";
    }
}
