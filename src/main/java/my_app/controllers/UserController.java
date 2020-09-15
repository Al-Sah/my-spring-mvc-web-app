package my_app.controllers;

import my_app.entities.Role;
import my_app.entities.User;
import my_app.services.UserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/userControl")
@PreAuthorize("hasAuthority('ADMIN')")

public class UserController {

    private final UserService userService;
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/uL")
    public String usersList(Model model){
       model.addAttribute("users", userService.getUsers());
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

        userService.saveUser(user, myForm, username);
        return "redirect:/userControl/uL";
    }
    @PostMapping("deleteUser")
    public String deleteUser(@RequestParam Long id){
        userService.deleteUser(id);

        return "redirect:/userControl/uL";
    }
}
