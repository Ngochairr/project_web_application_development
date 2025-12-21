package com.example.studentmanagement.controller;

import com.example.studentmanagement.dtos.TimetableDTO;
import com.example.studentmanagement.repository.AssignmentRepository;
import com.example.studentmanagement.service.FeeService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class TimetableController {

    @Autowired private FeeService feeService;
    @Autowired private AssignmentRepository assignmentRepository;

    @GetMapping("/timetable")
    public String showTimetable(HttpSession session, Model model) {
        String role = (String) session.getAttribute("role");
        String username = (String) session.getAttribute("username");

        if (username == null) return "redirect:/login";

        if ("student".equals(role)) {
            int rollNo = Integer.parseInt(username);
            boolean isPaid = feeService.isStudentPaid(rollNo);
            model.addAttribute("fee", new FeeStatus(String.valueOf(isPaid)));

            if (isPaid) {
                List<TimetableDTO> timetable = assignmentRepository.getTimetableForStudent(rollNo);
                model.addAttribute("timetableList", timetable);
            }
        } else {
            model.addAttribute("fee", new FeeStatus("true"));
        }

        return "timetable";
    }

    public static class FeeStatus {
        private String paid;
        public FeeStatus(String paid) { this.paid = paid; }
        public String getPaid() { return paid; }
    }
}
