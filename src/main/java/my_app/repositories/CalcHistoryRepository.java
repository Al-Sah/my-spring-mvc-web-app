package my_app.repositories;


import my_app.entities.CalcHistoryMessage;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CalcHistoryRepository extends CrudRepository<CalcHistoryMessage, Long> {
}
