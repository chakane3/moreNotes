# def findMedianValue(A, B):
#     result = []
#     indexB = 0
#     indexA = 0
#     for i in range(0,len(A) + len(B)):
        
#         if indexA >= len(A):
#             result.append(B[indexB])
#             indexB += 1
            
#         elif indexB >= len(B):
#             result.append(A[indexA])
#             indexA += 1
            
#         else:
#             if A[indexA] > B[indexB]:
#                 result.append(B[indexB])
#                 indexB += 1
#             else:
#                 result.append(A[indexA])
#                 indexA += 1

#     return result

def findMedianValue(A, B):
    indexA = 0
    indexB = 0
    medianIndex = len(A) + len(B) // 2
    for i in range(0, medianIndex-1):
        res = 0
        if indexA >= len(A):
            res = B[indexB]
            indexA += 1

        elif indexB >= len(B):
            res = A[indexA]
            indexB += 1

        else:
            if A[indexA] > B[indexB]:
                res = B[indexB]
                indexB += 1

            else:
                res = A[indexA]
                indexA += 1
    return res



            
            
# A =[2, 4, 5] 
# B = [1, 3]

# A = [5, 6, 7, 8]
# B = [7, 8, 9, 10 , 11]

A = [1, 3, 9]
B = [2, 5, 7, 8]
# 1, 2, 3, 5, 7, 8, 9
# 5, 6, 7, 7, 8, 8, 9, 10, 11

result = findMedianValue(A, B)
print(result)

"""
Since we know where the medain index is supposed to be before merging the two arrays,
we would only need to loop from 0 to medianIndex and therefore not actually have to merge the arrays into one.

We can still check in each array to see what the smallest element is, and store that as the value for our medianValue
by the time we iterate to medianIndex we would have found the value at the medain index as if we had merged these two arrays together. 

"""
