package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.Cv;
import com.example.recruitment2.Entity.CvRecruitmentDistance;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface CvRecruitmentDistanceRepository extends MongoRepository<CvRecruitmentDistance, ObjectId>{
//    List<CvRecruitmentDistance> findFirst200ByCv__idOrderByDistanceAsc(ObjectId cvId);
    List<CvRecruitmentDistance> findCvRecruitmentDistancesByCvIn(List<Cv> cvs, Pageable pageable);
}
