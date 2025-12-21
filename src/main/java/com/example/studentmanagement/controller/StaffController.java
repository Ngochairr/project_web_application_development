package com.example.studentmanagement.controller;

import com.example.studentmanagement.dtos.StaffDTO;
import com.example.studentmanagement.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class StaffController {
    @Autowired private StaffService staffService;

    @GetMapping("/staff")
    public String handleStaffActions(
            @RequestParam(required = false, defaultValue = "list") String action,
            @RequestParam(required = false) Long id,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "staff_name") String sortBy,
            @RequestParam(defaultValue = "asc") String order,
            Model model) {

        if ("delete".equals(action)) {
            staffService.deleteStaff(String.valueOf(id));
            return "redirect:/staff?action=list&message=Staff deleted";
        }

        if ("edit".equals(action)) {
            model.addAttribute("staff", staffService.getById(String.valueOf(id)));
            return "form_staff";
        }

        if ("new".equals(action)) {
            model.addAttribute("staff", new StaffDTO());
            return "form_staff";
        }

        Page<StaffDTO> staffPage = staffService.getPaginatedStaff(page - 1, 10, sortBy, order);

        model.addAttribute("staffs", staffPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", staffPage.getTotalPages());
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("order", order);

        return "list_staff";
    }

    @PostMapping("/staff")
    public String saveOrUpdate(@ModelAttribute StaffDTO dto) {
        staffService.saveStaff(dto);
        return "redirect:/staff?action=list&message=Success";
    }
}
