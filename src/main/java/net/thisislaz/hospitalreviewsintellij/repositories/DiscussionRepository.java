package net.thisislaz.hospitalreviewsintellij.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import net.thisislaz.hospitalreviewsintellij.models.Discussion;
import net.thisislaz.hospitalreviewsintellij.models.User;
import net.thisislaz.hospitalreviewsintellij.models.Category;


public interface DiscussionRepository extends CrudRepository<Discussion, Long> {

    Optional<Discussion> findById(Long discussionId);

    List<Discussion> findTop5ByOrderByCreatedAtDesc();

    List<Discussion> findByTitle(String title);

    List<Discussion> findByTitleContainingIgnoreCase(String title);

    List<Discussion> findByDescriptionContainingIgnoreCase(String searchValue);

    List<Discussion> findByAuthorUsername(String authorUsername);

    List<Discussion> findByCategoryId(Long categoryId);

}
