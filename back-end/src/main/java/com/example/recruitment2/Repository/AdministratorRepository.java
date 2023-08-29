package com.example.recruitment2.Repository;
import com.example.recruitment2.Entity.Administrator;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface AdministratorRepository extends MongoRepository<Administrator, ObjectId>{
    public Administrator findAdministratorByAccount__id(ObjectId id);
}

