package com.example.studentmanagement.controller;

import com.example.studentmanagement.dtos.SectionDTO;
import com.example.studentmanagement.service.SectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/section")
public class SectionController {
    @Autowired private SectionService sectionService;

    @GetMapping
    public String handleActions(
            @RequestParam(required = false, defaultValue = "list") String action,
            @RequestParam(required = false) String id,
            @RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "asc") String order,
            Model model) {

        if ("new".equals(action)) {
            model.addAttribute("section", new SectionDTO());
            return "form_section";
        }

        if ("edit".equals(action)) {
            model.addAttribute("section", sectionService.getById(id));
            return "form_section";
        }

        if ("delete".equals(action)) {
            sectionService.delete(id);
            return "redirect:/section?message=Deleted Successfully";
        }

        Page<SectionDTO> sectionPage;
        if ("search".equals(action) && keyword != null) {
            sectionPage = sectionService.search(keyword, page - 1, 10);
            model.addAttribute("keyword", keyword);
        } else {
            sectionPage = sectionService.getPaginated(page - 1, 10, sortBy, order);
        }

        model.addAttribute("section", sectionPage.getContent());
        model.addAttribute("totalPages", sectionPage.getTotalPages());
        model.addAttribute("currentPage", page);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("order", order);

        return "list_section";
    }

    @PostMapping
    public String handlePost(@ModelAttribute SectionDTO dto, @RequestParam String action) {
        sectionService.save(dto);
        return "redirect:/section?message=Saved Successfully";
    }
}
