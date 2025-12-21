package com.example.studentmanagement.service;

import com.example.studentmanagement.dtos.SalaryDTO;
import com.example.studentmanagement.dtos.StaffDTO;
import com.example.studentmanagement.entity.Salary;
import com.example.studentmanagement.entity.Staff;
import com.example.studentmanagement.repository.SalaryRepository;
import com.example.studentmanagement.repository.StaffRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
@Service
public class StaffService {
    @Autowired private StaffRepository staffRepo;
    @Autowired private SalaryRepository salaryRepo;

    public StaffDTO getById(String id) {
        Staff s = staffRepo.findById(id).orElseThrow(() -> new RuntimeException("Staff not found"));
        return mapToDTO(s);
    }

    public Page<StaffDTO> getPaginatedStaff(int page, int size, String sortBy, String order) {
        String sortField = sortBy.equals("staff_name") ? "staff_name" : "id";
        Sort sort = order.equalsIgnoreCase("desc") ? Sort.by(sortField).descending() : Sort.by(sortField).ascending();
        return staffRepo.findAll(PageRequest.of(page, size, sort)).map(this::mapToDTO);
    }

    @Transactional
    public void saveStaff(StaffDTO dto) {
        Staff staff = staffRepo.findById(dto.getId()).orElse(new Staff());
        staff.setId(dto.getId());
        staff.setStaff_name(dto.getStaff_name());
        staffRepo.save(staff);
        Salary salary = salaryRepo.findByStaffId(staff.getId())
                .stream().findFirst().orElse(new Salary());
        if (salary.getIdsalary() == null) {
            salary.setIdsalary((int)(System.currentTimeMillis() % 1000000));
        }

        salary.setStaff(staff);
        salary.setAmount(dto.getStaff_salary().intValue());
        int dateAsInt = Integer.parseInt(LocalDate.now().toString().replace("-", ""));
        salary.setPaymentDate(dateAsInt);

        salaryRepo.save(salary);
    }

    private StaffDTO mapToDTO(Staff s) {
        StaffDTO dto = new StaffDTO();
        dto.setId(s.getId());
        dto.setStaff_name(s.getStaff_name());

        List<Salary> salaries = s.getSalaries();
        if (salaries != null && !salaries.isEmpty()) {
            // Get most recent record
            Salary latest = salaries.get(salaries.size() - 1);
            // Matches entity field: amount
            dto.setStaff_salary(latest.getAmount().doubleValue());
        } else {
            dto.setStaff_salary(0.0);
        }
        return dto;
    }

    public void deleteStaff(String id) {
        // Due to the SQL CONSTRAINT staff_id, you MUST delete salaries first
        salaryRepo.findByStaffId(id).forEach(sal -> salaryRepo.delete(sal));
        staffRepo.deleteById(id);
    }
}
