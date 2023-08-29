package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.Domain;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface DomainRepository extends MongoRepository<Domain, ObjectId>{
}
