package com.example.studentmanagement.controller;

import org.springframework.data.domain.Page;
import org.springframework.ui.Model;
import com.example.studentmanagement.dtos.StudentDTO;
import com.example.studentmanagement.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class StudentController {

    @Autowired private StudentService studentService;

    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping("/student")
    public String handleStudentActions(
            @RequestParam(required = false, defaultValue = "list") String action,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) Long id,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "roll") String sortBy,
            @RequestParam(defaultValue = "asc") String order,
            Model model) {

        if ("new".equals(action)) {
            model.addAttribute("student", new StudentDTO());
            return "form_student";
        }

        if ("edit".equals(action)) {
            model.addAttribute("student", studentService.getById(Math.toIntExact(id)));
            return "form_student";
        }

        if ("delete".equals(action)) {
            studentService.deleteStudent(Math.toIntExact(id)); // Fixed name
            return "redirect:/student?action=list&message=Deleted successfully";
        }

        Page<StudentDTO> studentPage;
        if ("search".equals(action) && keyword != null && !keyword.isEmpty()) {
            studentPage = studentService.search(keyword, page - 1, 10);
            model.addAttribute("keyword", keyword);
        } else {
            studentPage = studentService.getPaginated(page - 1, 10, sortBy, order);
        }
        model.addAttribute("students", studentPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", studentPage.getTotalPages());
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("order", order);

        return "list_student";
    }

    @PostMapping("/student")
    public String saveOrUpdate(@ModelAttribute StudentDTO dto) {
        studentService.saveStudent(dto);
        return "redirect:/student?action=list&message=Operation successful";
    }
}
