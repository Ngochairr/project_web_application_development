package com.example.studentmanagement.service;

import com.example.studentmanagement.dtos.SalaryDTO;
import com.example.studentmanagement.entity.Salary;
import com.example.studentmanagement.entity.Staff;
import com.example.studentmanagement.repository.SalaryRepository;
import com.example.studentmanagement.repository.StaffRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SalaryService {
    @Autowired private SalaryRepository salaryRepo;
    @Autowired private StaffRepository staffRepo;

    public void saveSalary(SalaryDTO dto) {
        Salary s = salaryRepo.findById(dto.getId()).orElse(new Salary());
        s.setIdsalary(dto.getId());
        s.setAmount(dto.getSalary_amount().intValue());
        Staff staff = staffRepo.findById(dto.getSalary_staff()).orElseThrow();
        s.setStaff(staff);
        if(dto.getSalary_date() != null) {
            s.setPaymentDate(Integer.parseInt(dto.getSalary_date().replace("-", "")));
        }
        salaryRepo.save(s);
    }

    private SalaryDTO mapToDTO(Salary s) {
        SalaryDTO dto = new SalaryDTO();
        dto.setId(s.getIdsalary());
        dto.setSalary_id("SAL-" + s.getIdsalary());
        dto.setSalary_staff(s.getStaff().getId());
        dto.setSalary_amount(s.getAmount().doubleValue());
        dto.setSalary_date(String.valueOf(s.getPaymentDate()));
        return dto;
    }
}
