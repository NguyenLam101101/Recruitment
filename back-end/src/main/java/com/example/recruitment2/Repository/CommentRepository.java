package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.Comment;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface CommentRepository extends MongoRepository<Comment, ObjectId> {
    public List<Comment> getCommentsByRecruitment__id(ObjectId id);
    public List<Comment> getCommentsByNews__id(ObjectId id);
}
