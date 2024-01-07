package net.thisislaz.hospitalreviewsintellij.services;

import java.util.List;

import org.springframework.stereotype.Service;

import net.thisislaz.hospitalreviewsintellij.models.Category;
import net.thisislaz.hospitalreviewsintellij.repositories.CategoryRepository;

@Service
public class CategoryService {

    public final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> getAllCategories() {
        return (List<Category>) categoryRepository.findAll();
    }

}
