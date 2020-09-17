package my_app.controllers;

import my_app.entities.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProfileController {

    @GetMapping("/profile")
    public String profile(@AuthenticationPrincipal User user, Model model){
        model.addAttribute("user", user);
        return "personProfile";
    }

    @PostMapping("/profile/edit")
    public String editProfile(@AuthenticationPrincipal User user,
                              @RequestParam String password,
                              @RequestParam String mail){

        return "redirect:/profile";
    }

}
