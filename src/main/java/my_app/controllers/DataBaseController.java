package my_app.controllers;

import my_app.entities.Message;
import my_app.entities.User;
import my_app.services.MessagesService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/DataBase")
public class DataBaseController {



    private final MessagesService messagesService;
    public DataBaseController(MessagesService messagesService) {
        this.messagesService = messagesService;
    }

    @GetMapping("/messages")
    public String showMessages(@RequestParam(name="filter", required = false, defaultValue="") String filter, Map<String, Object> model){
        model.put("messages", messagesService.findMessages(filter));
        return "MyDB";
    }

    @PostMapping("addMessage")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Message message, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){

            Map<String, String> errors = Utils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.addAttribute("message", message);
            return "MyDB";
        } else {
            messagesService.addMessage(user, message.getText(), message.getTag());
        }
        return "redirect:/DataBase/messages";
    }

    @PostMapping("deleteMessage")
    public String deleteUser(@RequestParam Long id){
        messagesService.deleteMessage(id);
        return "redirect:/DataBase/messages";
    }


}
