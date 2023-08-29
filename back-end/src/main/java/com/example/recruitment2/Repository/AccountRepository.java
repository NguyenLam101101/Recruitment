package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.Account;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface AccountRepository extends MongoRepository<Account, ObjectId>{
    public Account findAccountByEmail(String email);
}
