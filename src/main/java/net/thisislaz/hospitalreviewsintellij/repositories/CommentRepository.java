package net.thisislaz.hospitalreviewsintellij.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import net.thisislaz.hospitalreviewsintellij.models.Discussion;
import net.thisislaz.hospitalreviewsintellij.models.Comment;

public interface CommentRepository extends CrudRepository<Comment, Long> {

    List<Comment> findByDiscussionOrderByCreatedAt(Discussion discussion);

    List<Comment> findByDiscussionOrderByCreatedAt(Optional<Discussion> discussion);

    Optional<Comment> findById(Long id);

    Comment save(Optional<Comment> commentToEdit);

    void deleteById(Optional<Comment> commentToDelete);

}
