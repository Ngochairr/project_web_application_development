package com.example.studentmanagement.service;

import com.example.studentmanagement.dtos.SectionDTO;
import com.example.studentmanagement.entity.Section;
import com.example.studentmanagement.repository.SectionRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class SectionService {
    @Autowired private SectionRepository sectionRepo;

    public Page<SectionDTO> getPaginated(int page, int size, String sortBy, String order) {
        String entityField = sortBy.equals("roll") ? "id" : sortBy;
        Sort sort = order.equalsIgnoreCase("desc") ? Sort.by(entityField).descending() : Sort.by(entityField).ascending();
        return sectionRepo.findAll(PageRequest.of(page, size, sort)).map(this::mapToDTO);
    }

    public Page<SectionDTO> search(String keyword, int page, int size) {
        return sectionRepo.findByNameContaining(keyword, PageRequest.of(page, size)).map(this::mapToDTO);
    }

    public SectionDTO getById(String id) {
        return sectionRepo.findById(id).map(this::mapToDTO).orElse(new SectionDTO());
    }

    @Transactional
    public void save(SectionDTO dto) {
        String id = (dto.getSec_id() != null && !dto.getSec_id().isEmpty()) ? dto.getSec_id() : dto.getId();
        Section s = sectionRepo.findById(id).orElse(new Section());

        s.setId(id);
        s.setName(dto.getSec_name());
        s.setRoomId(dto.getSec_room());
        s.setClassId(dto.getSec_class());
        s.setStartWeek(dto.getSec_sweek());
        s.setEndWeek(dto.getSec_eweek());
        s.setStartTime(dto.getSec_stime());
        s.setEndTime(dto.getSec_etime());
        s.setDay(dto.getSec_day());
        sectionRepo.save(s);
    }

    @Transactional
    public void delete(String id) {
        sectionRepo.deleteById(id);
    }

    private SectionDTO mapToDTO(Section s) {
        SectionDTO dto = new SectionDTO();
        dto.setId(s.getId());
        dto.setSec_id(s.getId());
        dto.setSec_name(s.getName());
        dto.setSec_room(s.getRoomId());
        dto.setSec_class(s.getClassId());
        dto.setSec_sweek(s.getStartWeek());
        dto.setSec_eweek(s.getEndWeek());
        dto.setSec_stime(s.getStartTime());
        dto.setSec_etime(s.getEndTime());
        dto.setSec_day(s.getDay());
        return dto;
    }
}
