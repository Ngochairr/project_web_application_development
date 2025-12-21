package com.example.studentmanagement.controller;

import com.example.studentmanagement.entity.User;
import com.example.studentmanagement.repository.StaffRepository;
import com.example.studentmanagement.repository.StudentRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @Autowired private StudentRepository studentRepo;
    @Autowired private StaffRepository staffRepo;

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("welcomeMessage", "Welcome back, " + user.getUsername() + "!");
        model.addAttribute("totalStudents", studentRepo.count());
        if (session.getAttribute("fullName") == null) {
            session.setAttribute("fullName", user.getUsername());
        }

        return "dashboard";
    }
}
