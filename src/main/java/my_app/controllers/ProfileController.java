package my_app.controllers;

import my_app.entities.User;
import my_app.services.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    private final UserService userService;
    public ProfileController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("seeProfile")
    public String profile(@AuthenticationPrincipal User user, Model model){
        model.addAttribute("user", user);
        return "editProfile";
    }

    @GetMapping("{user}")
    public String someProfile(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        return "personProfile";
    }
    @PostMapping("edit")
    public String editProfile(@AuthenticationPrincipal User user, @Valid User checkUser, BindingResult bindingResult, Model model,
                              @RequestParam String password,
                              @RequestParam String email){

        if(bindingResult.hasErrors()){
            Map<String, String> errors = Utils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.addAttribute("user", user);
            return "editProfile";
        }else {
            userService.updateProfile(user, password, email);
        }

        return "redirect:/profile/seeProfile";
    }

}
