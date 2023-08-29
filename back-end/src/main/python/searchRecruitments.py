import numpy as np
from pymongo import MongoClient

connect = MongoClient("mongodb://localhost:27017")
db = connect["recruitment"]


def create_feature_matrix(profiles, normalize=True):
    if len(profiles) < 1:
        return np.array([[]])
    matrix = []
    for profile in profiles:
        matrix.append(profile["featureVector"])
    matrix = np.array(matrix)
    if (normalize):
        euclid_vector = [np.linalg.norm(matrix[:, i]) for i in range(matrix.shape[1])]
        matrix = matrix / euclid_vector
    matrix = np.nan_to_num(matrix, nan=0)
    return matrix


search_vector_file = open("C:/Users/nguye/Documents/Java_project/Recruitment2/src/main/python/recruitmentSearchVector.txt", "r", encoding='utf-8')
provinces, search_vector = search_vector_file.read().split("###")
provinces = provinces.strip()[1:-1].split(",")
provinces = [province.strip() for province in provinces if province.strip()]
search_vector = search_vector.strip()[1:-1].split(",")
search_vector = [int(i) for i in search_vector]
if len(provinces) > 0:
    jds = list(db["recruitment"].find({"status": "active", "address.province": {"$in": provinces}}, {"featureVector": 1}))
else:
    jds = list(db["recruitment"].find({"status": "active"}, {"featureVector": 1}))
if len(jds) > 0:
    jd_feature_matrix = create_feature_matrix(jds)
    temp_matrix = jd_feature_matrix - search_vector
    euclid_vector = [np.linalg.norm(vector) for vector in temp_matrix]
    distances = {}
    for i in range(len(jds)):
        distances[jds[i]["_id"]] = euclid_vector[i]
    sorted_distances = sorted(distances.items(), key=lambda item: item[1])
    recruitment_ids = ""
    for item in sorted_distances:
        recruitment_ids += str(item[0]) + ","
    print("recruitment_ids:" + recruitment_ids)