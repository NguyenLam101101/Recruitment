package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.CommentResponse;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface CommentResponseRepository extends MongoRepository<CommentResponse, ObjectId> {
    public List<CommentResponse> getCommentResponsesByComment__id(ObjectId id);
}
