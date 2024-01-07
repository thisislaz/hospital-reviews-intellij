package net.thisislaz.hospitalreviewsintellij.repositories;

import org.springframework.data.repository.CrudRepository;

import net.thisislaz.hospitalreviewsintellij.models.Category;

public interface CategoryRepository extends CrudRepository<Category, Long> {

}
