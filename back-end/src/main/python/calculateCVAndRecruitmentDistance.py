# import pandas as pd
# import random as rd
from bson.dbref import DBRef
from bson import ObjectId
import numpy as np
from pymongo import MongoClient

connect = MongoClient("mongodb://localhost:27017")
db = connect["recruitment"]

# provinces = [province['name'] for province in db["province"].find({}, {"name": 1})]
# domains = [domain['name'] for domain in db["domain"].find({}, {"name": 1})]
# skills = [skill['name'] for skill in db["skill"].find({}, {"name": 1})]
# workType = ["Toàn thời gian", "Bán thời gian", "Thực tập", "Freelance"]


def get_jds():
    jds = list(db["recruitment"].find({"status": "active"}))
    return jds


def get_cvs():
    cvs = list(db["cv"].find())
    return cvs


def create_jd_vector(jd):
    vector = []

    # # lương
    # profile["wage"] = jd["wage"]

    # kinh nghiệm
    # profile["experience"] = jd["experience"]
    vector.append(jd["experience"])

    # province
    province_vector = []
    for province in provinces:
        if jd["address"]["province"] == province:
            province_vector.append(1)
        else:
            province_vector.append(0)
    # profile["province"] = province_vector
    vector.extend(province_vector)

    # domains
    domain_vector = []
    for domain in domains:
        if domain in jd["domains"]:
            domain_vector.append(1)
        else:
            domain_vector.append(0)
    # profile["domain"] = domain_vector
    vector.extend(domain_vector)

    # skills
    skill_vector = []
    for skill in skills:
        if skill in jd["skills"]:
            skill_vector.append(1)
        else:
            skill_vector.append(0)
    # profile["skill"] = skill_vector
    vector.extend(skill_vector)
    return vector



def create_cv_vector(cv):
    vector = []

    # # lương
    # profile["wage"] = jd["wage"]

    # kinh nghiệm
    # profile["experience"] = jd["experience"]
    vector.append(cv["experience"])

    # province
    province_vector = []
    for province in provinces:
        if province in cv["provinces"]:
            province_vector.append(1)
        else:
            province_vector.append(0)
    # profile["domain"] = domain_vector
    vector.extend(province_vector)

    # domains
    domain_vector = []
    for domain in domains:
        if domain in cv["domains"]:
            domain_vector.append(1)
        else:
            domain_vector.append(0)
    # profile["domain"] = domain_vector
    vector.extend(domain_vector)

    # skills
    skill_vector = []
    for skill in skills:
        if skill in cv["skills"]:
            skill_vector.append(1)
        else:
            skill_vector.append(0)
    # profile["skill"] = skill_vector
    vector.extend(skill_vector)
    return vector


def create_feature_matrix(profiles, normalize=True):
    matrix = []
    for profile in profiles:
        matrix.append(profile["featureVector"])
    matrix = np.array(matrix)
    if (normalize):
        euclid_vector = [np.linalg.norm(matrix[:, i]) for i in range(matrix.shape[1])]
        matrix = matrix / euclid_vector
    matrix = np.nan_to_num(matrix, nan=0)
    return matrix



def cosine_similarity(u1, u2):
    dot = u1.T.dot(u2)
    norm1 = np.linalg.norm(u1)
    norm2 = np.linalg.norm(u2)
    similarity = dot / (norm1 * norm2)
    return similarity

def calculate_distance():
    jd_profiles = list(db["recruitment"].find({"status": "active"}, {"featureVector": 1}))
    jd_feature_matrix = create_feature_matrix(jd_profiles)
    cv_profiles = list(db["cv"].find({}, {"featureVector": 1}))
    cv_feature_matrix = create_feature_matrix(cv_profiles)

    cosine_matrix = []
    for cv_vector in cv_feature_matrix:
        row = []
        for jd_vector in jd_feature_matrix:
            row.append(cosine_similarity(cv_vector, jd_vector))
        cosine_matrix.append(row)
    cosine_matrix = np.array(cosine_matrix)

    distance_records = []
    for i in range(cosine_matrix.shape[0]):
        cv_id = cv_profiles[i]["_id"]
        for j in range(cosine_matrix.shape[1]):
            jd_id = jd_profiles[j]["_id"]
            record = {"cv": DBRef(collection="cv", id=cv_id),
                      "recruitment": DBRef(collection="recruitment", id=jd_id),
                      "distance": cosine_matrix[i, j]}
            distance_records.append(record)
    return distance_records


db['cv_recruitment_distance'].drop()
db['cv_recruitment_distance'].insert_many(calculate_distance())
