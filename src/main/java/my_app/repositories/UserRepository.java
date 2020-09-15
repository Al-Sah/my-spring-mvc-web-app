package my_app.repositories;

import my_app.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

    User findByActivateCode(String code);

    void deleteById(Long id);
}