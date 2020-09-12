package my_app.controllers;

import my_app.entities.Message;
import my_app.entities.User;
import my_app.repositories.MessagesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/home")
public class DataBaseController {

    @Autowired
    private MessagesRepository messagesRepository;



    @GetMapping("/MyDB")
    public String GoToDB(@RequestParam(name="filter", required = false, defaultValue="") String filter, Map<String, Object> model){ //Map <String, Object> model

        Iterable<Message> messages;

        if (filter == null || filter.isEmpty()) {
            messages = messagesRepository.findAll();
        } else {
            messages = messagesRepository.findByTag(filter);
        }

        model.put("messages", messages);

        return "MyDB";
    }

    @PostMapping("add-message")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag, Map <String,Object> model){

        if(!(text.isEmpty() || tag.isEmpty())){
            Message message = new Message(text, tag, user);
            messagesRepository.save(message);
        }

        Iterable<Message> messages = messagesRepository.findAll();
        model.put("messages", messages);

        return "MyDB";
    }


}
