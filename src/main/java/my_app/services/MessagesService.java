package my_app.services;

import my_app.entities.Message;
import my_app.entities.User;
import my_app.repositories.MessagesRepository;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Service
public class MessagesService {

    private final MessagesRepository messagesRepository;
    public MessagesService(MessagesRepository messagesRepository) {
        this.messagesRepository = messagesRepository;
    }

    public Map<String, String> getErrors(BindingResult bindingResult) {
        Collector<FieldError, ?, Map<String, String>> collector = Collectors.toMap(
                fieldError -> fieldError.getField() + "Error",
                FieldError::getDefaultMessage
        );
        return bindingResult.getFieldErrors().stream().collect(collector);
    }

    public void addMessage(User user, String text,  String tag){
        if(!(text.isEmpty() || tag.isEmpty())){
            Message message = new Message(text, tag, user);
            messagesRepository.save(message);
        }
    }

    public Iterable<Message> findMessages(String filter){
        if (filter == null || filter.isEmpty()) {
            return messagesRepository.findAll();
        } else {
            return messagesRepository.findByTag(filter);
        }
    }

    public void deleteMessage(Long id) {
        try{
            messagesRepository.deleteById(id);
        } catch(Exception exception){
            System.out.println("[DELETE MESSAGE] " + exception.getMessage());
        }
    }

    public Iterable<Message> findAll() {
        return messagesRepository.findAll();
    }
}
