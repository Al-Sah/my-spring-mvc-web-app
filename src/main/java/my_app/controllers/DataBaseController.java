package my_app.controllers;

import my_app.entities.Message;
import my_app.entities.User;
import my_app.services.MessagesService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/DataBase")
public class DataBaseController {

    private final MessagesService messagesService;
    public DataBaseController(MessagesService messagesService) {
        this.messagesService = messagesService;
    }

    @RequestMapping(value = "messages", method = RequestMethod.GET)
    public String showMessages(@RequestParam(name="filter", required = false, defaultValue="") String filter, Model model){
        model.addAttribute("messages", messagesService.findMessages(filter));
        return "MyDB";
    }

    @RequestMapping(value = "addMessage", method = RequestMethod.POST)
    public String addMessage(
            @AuthenticationPrincipal User user,
            @Valid Message message, BindingResult bindingResult, Model model){

        if(bindingResult.hasErrors()){
            Map<String, String> errors = Utils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.addAttribute("message", message);
            return "MyDB";
        } else {
            messagesService.addMessage(user, message);
        }
        return "redirect:/DataBase/messages";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "editMessage/{message}", method = RequestMethod.GET)
    public String editMessagePage(@PathVariable Message message, Model model){
        model.addAttribute("message", message);
        return "editMessage";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "editMessage", method = RequestMethod.PUT)
    public String editMessage(@RequestParam Long id, @Valid Message message, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            Map<String, String> errors = Utils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.addAttribute("message", messagesService.getMessage(id));
            return "editMessage";
        } else {
            messagesService.editMessage(id,message);
        }
        return "redirect:/DataBase/messages";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "deleteMessage", method = RequestMethod.DELETE)
    public String deleteMessage(@RequestParam Long id){
        messagesService.deleteMessage(id);
        return "redirect:/DataBase/messages";
    }

}
