package my_app.controllers;

import my_app.entities.User;
import my_app.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
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
    public String addUser(@RequestParam(name = "confirmPassword") String confirmPassword,
                          @Valid User user, BindingResult bindingResult, Model model){

        if(bindingResult.hasErrors()){
            Map<String, String> errors = Utils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.addAttribute("user", user);
            return "registration";
        }else if(!user.getPassword().equals(confirmPassword) && user.getPassword() != null){
            model.addAttribute("PasswordError", "Wrong password!!!!! NOOB");
            User DBUser = userService.getUserByUsername(user.getUsername());
            if(DBUser != null){
                model.addAttribute("UserError", "User Exist(");
            }
            return "registration";
        }else{
            userService.addUser(user);
        }
        return "redirect:/login";
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
