package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.Province;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ProvinceRepository extends MongoRepository<Province, ObjectId>{
}
