package com.example.studentmanagement.controller;

import com.example.studentmanagement.dtos.FeeDTO;
import com.example.studentmanagement.dtos.SalaryDTO;
import com.example.studentmanagement.entity.User;
import com.example.studentmanagement.service.FeeService;
import com.example.studentmanagement.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/finance")
public class FinanceController {

    @Autowired private FeeService feeService;
    @Autowired private SalaryService salaryService;

    @GetMapping("/fee")
    public String handleFeeActions(
            @RequestParam(required = false, defaultValue = "list") String action,
            @RequestParam(required = false) String id,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "expiration") String sortBy,
            @RequestParam(defaultValue = "asc") String order,
            Model model) {

        if ("new".equals(action)) {
            model.addAttribute("fee", new FeeDTO());
            return "form_fee";
        }

        if ("delete".equals(action)) {
            feeService.deleteFee(id);
            return "redirect:/finance/fee?action=list";
        }

        if ("edit".equals(action)) {
            model.addAttribute("fee", feeService.getById(id));
            return "form_fee";
        }

        Page<FeeDTO> feePage = feeService.getPaginated(page - 1, 10, sortBy, order);

        model.addAttribute("fee", feePage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", feePage.getTotalPages());
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("order", order);

        return "list_fee";
    }

    @PostMapping("/fee")
    public String saveOrUpdateFee(@ModelAttribute FeeDTO dto) {
        feeService.saveFee(dto);
        return "redirect:/finance/fee?action=list&message=Success";
    }

    @PostMapping("/salary/pay")
    public String paySalary(@ModelAttribute SalaryDTO dto, HttpSession session, Model model) {
        String role = (String) session.getAttribute("role");

        if (role == null || !role.equalsIgnoreCase("admin")) {
            model.addAttribute("error", "Admin access required for payments.");
            return "dashboard";
        }

        salaryService.saveSalary(dto);
        return "redirect:/salary?id=" + dto.getSalary_staff();
    }
}
