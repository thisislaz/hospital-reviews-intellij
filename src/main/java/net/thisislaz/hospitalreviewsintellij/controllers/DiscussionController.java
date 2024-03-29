package net.thisislaz.hospitalreviewsintellij.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.service.annotation.DeleteExchange;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import net.thisislaz.hospitalreviewsintellij.models.Category;
import net.thisislaz.hospitalreviewsintellij.models.Comment;
import net.thisislaz.hospitalreviewsintellij.models.Discussion;
import net.thisislaz.hospitalreviewsintellij.services.CategoryService;
import net.thisislaz.hospitalreviewsintellij.services.DiscussionService;
import net.thisislaz.hospitalreviewsintellij.utils.CommentDetails;
import net.thisislaz.hospitalreviewsintellij.utils.StringUtils;

@Controller
@RequestMapping("/discussion")
public class DiscussionController {

    private final DiscussionService discussionService;
    private final CategoryService categoryService;

    public DiscussionController(DiscussionService discussionService, CategoryService categoryService) {
        this.discussionService = discussionService;
        this.categoryService = categoryService;
    }

    @GetMapping("/allDiscussions")
    public String listDiscussions(@ModelAttribute("allDiscussions") Discussion discussionModel, Model model) {
        List<Discussion> discussions = discussionService.getAllDiscussions();
        List<Category> categories = categoryService.getAllCategories();
        Map<Long, CommentDetails> latestCommentDetails = discussionService.getLatestCommentDetails(discussions);
        Map<Long, String> discussionDateMap = discussionService.formatDiscussionCreatedAtDates(discussions) ;

        model.addAttribute("discussions", discussions);
        model.addAttribute("categoriesList", categories);
        model.addAttribute("latestCommentDetails", latestCommentDetails );
        model.addAttribute("discussionDateMap", discussionDateMap);

        return "views/discussions";
    }

    @PostMapping("/allDiscussions")
    public String createDiscussion(@Valid @ModelAttribute("allDiscussions") Discussion discussion, BindingResult result, HttpSession session, Model model) {

        if (result.hasErrors()) {
            List<Discussion> discussions = discussionService.getAllDiscussions();
            List<Category> categories = categoryService.getAllCategories();
            Map<Long, CommentDetails> latestCommentDetails = discussionService.getLatestCommentDetails(discussions);
            Map<Long, String> discussionDateMap = discussionService.formatDiscussionCreatedAtDates(discussions) ;

            model.addAttribute("discussions", discussions);
            model.addAttribute("categoriesList", categories);
            model.addAttribute("latestCommentDetails", latestCommentDetails );
            model.addAttribute("discussionDateMap", discussionDateMap);
            return "views/discussions";

        } else if(session.getAttribute("userId") == null) {

            List<Discussion> discussions = discussionService.getAllDiscussions();
            List<Category> categories = categoryService.getAllCategories();
            Map<Long, CommentDetails> latestCommentDetails = discussionService.getLatestCommentDetails(discussions);
            Map<Long, String> discussionDateMap = discussionService.formatDiscussionCreatedAtDates(discussions) ;

            model.addAttribute("discussions", discussions);
            model.addAttribute("categoriesList", categories);
            model.addAttribute("latestCommentDetails", latestCommentDetails );
            model.addAttribute("discussionDateMap", discussionDateMap);
            return "redirect:/discussion/allDiscussions";
        }
        discussionService.createDiscussion(discussion);

        return "redirect:/discussion/allDiscussions";
    }

    @GetMapping("/allDiscussions/{discussionId}")
    public String viewDiscussion(@PathVariable Long discussionId, @ModelAttribute("commented") Comment comment , Model model) {
        Optional<Discussion> discussion = discussionService.getDiscussionById(discussionId);
        List<Discussion> discussions = discussionService.getAllDiscussions();

        if(discussion.isPresent()) {
            List<Comment> comments = discussionService.getCommentsByDiscussion(discussion.get());
            List<String> fortmmatedDates = StringUtils.formattedCommentDates(comments);
            List<String> formattedCommentTimes = StringUtils.fortmattedCommentTimes(comments);
            String formattedDiscussionDate = StringUtils.fortmattedDiscussionCreateAtDate( discussion.get());
            Map<Long, String> discussionDateMap = discussionService.formatDiscussionCreatedAtDates(discussions) ;

            for (int i =0; i<comments.size();i++) {
                comments.get(i).setFortmattedDate(fortmmatedDates.get(i));
                comments.get(i).setFormattedCommentTime(formattedCommentTimes.get(i));
            }
            model.addAttribute("discussion", discussion.get());
            model.addAttribute("comments", comments);
            model.addAttribute("discussionObjectWithFormattedDate",formattedDiscussionDate);
            model.addAttribute("discussionDateMap", discussionDateMap);

            return "views/discussionDetails";
        } else {
            return "redirect:/discussions";
        }
    }

    @GetMapping("/newComment")
    public String newCommentPage(@ModelAttribute("comment") Comment comment, @RequestParam Long discussionId, Model model, HttpSession session) {
        Long loggedinUser = (Long) session.getAttribute("userId");
        if(loggedinUser == null) {
            return "redirect:/discussion/allDiscussions";
        }
        List<Discussion> discussions = discussionService.getAllDiscussions();
        Map<Long, String> discussionDateMap = discussionService.formatDiscussionCreatedAtDates(discussions) ;
        Optional<Discussion> optionalDiscussion = discussionService.getDiscussionById(discussionId);
        Discussion discussion = optionalDiscussion.get();

        model.addAttribute("discussion", discussion);
        model.addAttribute("discussionDateMap", discussionDateMap);

        return "views/createComment";
    }

    @PostMapping("/comment")
    public String createComment(@Valid @ModelAttribute("comment") Comment comment, BindingResult result, @RequestParam("discussionId") Long discussionId, Model model) {

        if(result.hasErrors()) {
            List<Discussion> discussions = discussionService.getAllDiscussions();
            Map<Long, String> discussionDateMap = discussionService.formatDiscussionCreatedAtDates(discussions) ;
            Optional<Discussion> optionalDiscussion = discussionService.getDiscussionById(discussionId);
            Discussion discussion = optionalDiscussion.get();
            // Handle the situation when there are errors
            model.addAttribute("discussion", discussion);
            model.addAttribute("discussionDateMap", discussionDateMap);
            model.addAttribute("discussionId", discussionId);
            return "views/createComment"; // Replace with your form view name
        }

        Optional<Discussion> optionalDiscussion = discussionService.getDiscussionById(discussionId);
        if(optionalDiscussion.isPresent()) {
            Discussion d = optionalDiscussion.get();
            comment.setDiscussion(d);
        }
        discussionService.createComment(comment);

        return "redirect:/discussion/allDiscussions/" + discussionId;
    }

    @GetMapping("/{discussionId}/comment/edit/{commentId}")
    public String editComment(@PathVariable("discussionId")Long discussionId,
                              @PathVariable("commentId")Long commentId,
                              HttpSession session, Model model) {
        Long loggedinUser = (Long) session.getAttribute("userId");
        if(loggedinUser == null) {
            return "redirect:/user/login";
        }
        Optional<Discussion> optionalDiscussion = discussionService.getDiscussionById(discussionId);
        if(!optionalDiscussion.isPresent()) {
            return "redirect:/discussion/allDiscussions";
        }

        Discussion discussion = optionalDiscussion.get();
        List<Comment> comments = discussionService.getCommentsByOptionalDiscussion(discussionService.getDiscussionById(discussionId));
        Comment commentToEdit = null;

        for (Comment comment : comments) {
            if(comment.getId().equals(commentId) && comment.getAuthor().getId().equals(loggedinUser)) {
                commentToEdit = comment;
                break;
            }
        }

        if(commentToEdit == null) {
            return "redirect:/discussion/allDiscussions/{discussionId}";
        }

        model.addAttribute("discussion", discussion);
        model.addAttribute("comment",commentToEdit);

        return "views/editComment";
    }

    @PutMapping("/{discussionId}/comment/edit/{commentId}")
    public String processEditComment(@PathVariable("discussionId")Long discussionId,
                                     @PathVariable("commentId")Long commentId,
                                     @Valid @ModelAttribute("comment")Comment comment,
                                     BindingResult result, HttpSession session, Model model) {
        if (result.hasErrors()) {
            List<Discussion> discussions = discussionService.getAllDiscussions();
            Map<Long, String> discussionDateMap = discussionService.formatDiscussionCreatedAtDates(discussions) ;
            Optional<Discussion> optionalDiscussion = discussionService.getDiscussionById(discussionId);
            Discussion discussion = optionalDiscussion.get();
            List<Comment> comments = discussionService.getCommentsByOptionalDiscussion(discussionService.getDiscussionById(discussionId));
            Long loggedinUser = (Long) session.getAttribute("userId");

            Comment commentToEdit = null;

            for (Comment c : comments) {
                if(c.getId().equals(commentId) && c.getAuthor().getId().equals(loggedinUser)) {
                    commentToEdit = c;
                    break;
                }
            }
            // Handle the situation when there are errors
            model.addAttribute("discussion", discussion);
            model.addAttribute("discussionDateMap", discussionDateMap);
            model.addAttribute("discussionId", discussionId);
            model.addAttribute("comment", commentToEdit);

            return "views/editComment";
        }

        Long loggedInUserUserId = (Long) session.getAttribute("userId");
        Optional<Comment> optionalCommentToEdit = discussionService.findByCommentId(commentId);

        if(loggedInUserUserId == null) {
            return "redirect:/user/login";
        } else if(!optionalCommentToEdit.isPresent() || loggedInUserUserId != optionalCommentToEdit.get().getAuthor().getId()) {

            return "redirect:/discussion/allDiscussions/{discussionId}";
        }
        Comment commentToEdit = optionalCommentToEdit.get();
        commentToEdit.setContent(comment.getContent());
        discussionService.updateComment(commentToEdit);

        return "redirect:/discussion/allDiscussions/"+discussionId;
    }

    @RequestMapping(value = "/{discussionId}/comment/delete/{commentId}", method = RequestMethod.DELETE)
    public String deleteComment(@PathVariable("discussionId")Long discussionId,
                                @PathVariable("commentId")Long commentId, HttpSession session) {

        if(!session.getAttribute("userId").equals(discussionService.findByCommentId(commentId).get().getAuthor().getId())) {
            return "redirect:/discussion/allDiscussions/{discussionId}";
        }
        Optional<Comment> commentToDelete = discussionService.findByCommentId(commentId);
        discussionService.deleteCommentFromDiscussion(commentToDelete);

        return "redirect:/discussion/allDiscussions/"+discussionId;
    }

    @RequestMapping(value ="/delete/{discussionId}", method = RequestMethod.DELETE)
    public String deleteDiscussion(@PathVariable("discussionId")Long discussionId, HttpSession session) {

        if(!session.getAttribute("userId").equals(discussionService.getDiscussionById(discussionId).get().getAuthor().getId())) {
            return "redirect:/discussion/allDiscussions";
        }

        Optional<Discussion> discussionToDelete = discussionService.getDiscussionById(discussionId);
        discussionService.deleteDiscussionAndComments(discussionToDelete);

        return "redirect:/discussion/allDiscussions";
    }

    @GetMapping("/searchedDiscussions")
    public String searchedDiscussions(@RequestParam(name = "searchType", required = false) String searchType,
                                      @RequestParam(name = "searchValue", required = false) String searchValue,
                                      @RequestParam(name = "id", required = false) Long categoryId ,
                                      @ModelAttribute("allDiscussions") Discussion discussionModel,
                                      Model model) {

        List<Discussion> discussions = new ArrayList<>();
        List<Discussion> oldDiscussions = discussionService.getAllDiscussions();
        List<Category> categories = categoryService.getAllCategories();
        Map<Long, CommentDetails> latestCommentDetails = discussionService.getLatestCommentDetails(oldDiscussions);

        model.addAttribute("oldDiscussions", oldDiscussions);
        model.addAttribute("categoriesList", categories);
        model.addAttribute("latestCommentDetails", latestCommentDetails );

        Category category = new Category();
        model.addAttribute("category",category);

        if((searchType != null && searchValue != null) || (searchType != null && categoryId != null)) {
            switch(searchType) {
                case "title":
                    discussions = discussionService.findByDiscussionTitleContaining(searchValue);
                    break;
                case "description":
                    discussions = discussionService.findByDiscussionDescriptionContaining(searchValue);
                    break;
                case "author":
                    discussions = discussionService.findByUsername(searchValue);
                    break;
                case "category":
                    discussions = discussionService.findByCategoryId(categoryId);
                    break;
                case "recent":
                    discussions = discussionService.getMostRecentDiscussions();
                    break;
            }
        }
        Map<Long, String> discussionDateMap = discussionService.formatDiscussionCreatedAtDates(discussions) ;

        model.addAttribute("searchedDiscussionsList", discussions);
        model.addAttribute("discussionDateMap", discussionDateMap);


        return "views/searchDiscussions" ;
    }


}

