package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.Employee;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface EmployeeRepository extends MongoRepository<Employee, ObjectId>{
    public Employee findEmployeeByAccount__id(ObjectId id);
}
