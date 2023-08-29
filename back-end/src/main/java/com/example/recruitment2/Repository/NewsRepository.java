package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.News;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface NewsRepository extends MongoRepository<News, ObjectId>{
}
