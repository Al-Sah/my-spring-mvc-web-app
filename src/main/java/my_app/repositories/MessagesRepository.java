package my_app.repositories;

import my_app.entities.Message;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface MessagesRepository extends CrudRepository<Message, Long> {

    List<Message> findByTag(String tag);

    void deleteById(Long id);

}
