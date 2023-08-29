package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.Cv;
import com.example.recruitment2.Entity.Employee;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface CvRepository extends MongoRepository<Cv, ObjectId>{
    public List<Cv> findCvsByEmployee__id(ObjectId id);
    public List<Cv> findCvsByEmployee(Employee employee);
}
