package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.Employer;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface EmployerRepository extends MongoRepository<Employer, ObjectId>{
    public Employer findEmployerByAccount__id(ObjectId id);
}
