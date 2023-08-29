package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.Skill;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface SkillRepository extends MongoRepository<Skill, ObjectId>{
}
