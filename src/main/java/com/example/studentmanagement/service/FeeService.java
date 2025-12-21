package com.example.studentmanagement.service;

import com.example.studentmanagement.dtos.FeeDTO;
import com.example.studentmanagement.entity.Fee;
import com.example.studentmanagement.entity.Student;
import com.example.studentmanagement.repository.FeeRepository;
import com.example.studentmanagement.repository.StudentRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
public class FeeService {
    @Autowired private FeeRepository feeRepo;
    @Autowired private StudentRepository studentRepo;

    public Page<FeeDTO> getPaginated(int page, int size, String sortBy, String order) {
        String sortField = sortBy.equals("id") ? "feeId" : sortBy;
        Sort sort = order.equalsIgnoreCase("desc") ? Sort.by(sortField).descending() : Sort.by(sortField).ascending();
        return feeRepo.findAll(PageRequest.of(page, size, sort)).map(this::mapToDTO);
    }

    @Transactional
    public void saveFee(FeeDTO dto) {
        Fee fee = feeRepo.findById(dto.getFeeID()).orElse(new Fee());

        fee.setFeeId(dto.getFeeID());
        fee.setName(dto.getFee_name());

        Student s = studentRepo.findById(Integer.parseInt(dto.getFeeStudent()))
                .orElseThrow(() -> new RuntimeException("Student not found"));
        fee.setStudent(s);

        if(dto.getFee_expiration() != null) {
            fee.setExpiration(LocalDate.parse(dto.getFee_expiration()).atStartOfDay());
        }

        fee.setPaid(dto.getFee_paid() != null && dto.getFee_paid() ? 1 : 0);

        feeRepo.save(fee);
    }

    private FeeDTO mapToDTO(Fee f) {
        FeeDTO dto = new FeeDTO();
        dto.setId(f.getFeeId());
        dto.setFeeID(f.getFeeId());
        dto.setFee_name(f.getName());

        if (f.getStudent() != null) {
            dto.setFee_student(f.getStudent().getFullName());
            dto.setFeeStudent(String.valueOf(f.getStudent().getRoll()));
        }

        dto.setFee_expiration(f.getExpiration().toString());
        dto.setFee_paid(f.getPaid() != null && f.getPaid() == 1);
        return dto;
    }
    public FeeDTO getById(String id) {
        Fee f = feeRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Fee record not found: " + id));
        return mapToDTO(f);
    }

    @Transactional
    public void deleteFee(String id) {
        if (!feeRepo.existsById(id)) {
            throw new RuntimeException("Cannot delete. Fee ID " + id + " does not exist.");
        }
        feeRepo.deleteById(id);
    }
    public boolean isStudentPaid(Integer rollNo) {
        return feeRepo.findByStudentRollAndPaid(rollNo, 0).isEmpty();
    }}