package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.Recruitment;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface RecruitmentRepository extends MongoRepository<Recruitment, ObjectId>{
    public List<Recruitment> findRecruitmentsByEmployer__idOrderByTimeDesc(ObjectId id);
    public List<Recruitment> findRecruitmentsByEmployer__id(ObjectId id);
    public List<Recruitment> findRecruitmentsByStatus(String status);
}
