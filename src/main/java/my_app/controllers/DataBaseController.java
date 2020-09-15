package my_app.controllers;

import my_app.entities.User;
import my_app.services.MessagesService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/DataBase")
public class DataBaseController {

    private final MessagesService messagesService;
    public DataBaseController(MessagesService messagesService) {
        this.messagesService = messagesService;
    }

    @GetMapping("/MyDB")
    public String GoToDB(@RequestParam(name="filter", required = false, defaultValue="") String filter, Map<String, Object> model){ 
        model.put("messages", messagesService.findMessages(filter));
        return "MyDB";
    }

    @PostMapping("addMessage")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text, @RequestParam String tag){
        messagesService.addMessage(user, text, tag);
        return "redirect:/DataBase/MyDB";
    }

    @PostMapping("deleteMessage")
    public String deleteUser(@RequestParam Long id){
        messagesService.deleteMessage(id);
        return "redirect:/DataBase/MyDB";
    }


}
