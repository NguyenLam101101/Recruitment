package com.example.recruitment2.Repository;

import com.example.recruitment2.Entity.Notification;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface NotificationRepository extends MongoRepository<Notification, ObjectId> {
    public List<Notification> findNotificationsByEmployee__id(ObjectId id);
    public List<Notification> findNotificationsByEmployer__id(ObjectId id);
    public int countNotificationsByEmployee__idAndIsRead(ObjectId id, Boolean isRead);
    public int countNotificationsByEmployer__idAndIsRead(ObjectId id, Boolean isRead);
    public List<Notification> findNotificationsByEmployee__id(ObjectId id, Pageable pageable);
    public List<Notification> findNotificationsByEmployer__id(ObjectId id, Pageable pageable);
}
