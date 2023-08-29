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


search_vector_file = open("C:/Users/nguye/Documents/Java_project/Recruitment2/src/main/python/cvSearchVector.txt", "r", encoding='utf-8')
search_vector = search_vector_file.read().strip()[1:-1].split(",")
search_vector = [int(i) for i in search_vector]
cvs = list(db["cv"].find({"privacy": "public"}, {"featureVector": 1}))
if len(cvs) > 0:
    cv_feature_matrix = create_feature_matrix(cvs)
    temp_matrix = cv_feature_matrix - search_vector
    euclid_vector = [np.linalg.norm(vector) for vector in temp_matrix]
    distances = {}
    for i in range(len(cvs)):
        distances[cvs[i]["_id"]] = euclid_vector[i]
    sorted_distances = sorted(distances.items(), key=lambda item: item[1])
    cv_ids = ""
    for item in sorted_distances:
        cv_ids += str(item[0]) + ","
    print("cv_ids:" + cv_ids)