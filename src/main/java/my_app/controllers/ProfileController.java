package my_app.controllers;

import my_app.entities.User;
import my_app.services.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class ProfileController {

    private final UserService userService;
    public ProfileController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/profile")
    public String profile(@AuthenticationPrincipal User user, Model model){
        model.addAttribute("user", user);
        return "personProfile";
    }

    @PostMapping("/profile/edit")
    public String editProfile(@AuthenticationPrincipal User user, @Valid User checkUser, BindingResult bindingResult, Model model,
                              @RequestParam String password,
                              @RequestParam String email){

        if(bindingResult.hasErrors()){
            Map<String, String> errors = Utils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.addAttribute("user", user);
            return "personProfile";
        }else {
            userService.updateProfile(user, password, email);
        }

        return "redirect:/profile";
    }

}
