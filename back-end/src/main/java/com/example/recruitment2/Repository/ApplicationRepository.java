package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.Application;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import java.util.List;

public interface ApplicationRepository extends MongoRepository<Application, ObjectId>{
    public List<Application> findApplicationsByRecruitment__id(ObjectId id);
    public List<Application> findApplicationByCv__id(ObjectId id);
    public List<Application> findApplicationsByCv_Employee__id(ObjectId id);
    public List<Application> findApplicationsByRecruitment_Employer__id(ObjectId id);
    public List<Application> findApplicationsByCv_Employee__id(ObjectId id, Pageable pageable);
    public List<Application> findApplicationsByRecruitment_Employer__id(ObjectId id, Pageable pageable);
}
