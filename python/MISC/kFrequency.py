# nums = [1, 2, 2, 1, 5, 6]
nums = [1, 2, 1]

def kFrequency(nums, k):
    aDict = {}
    for num in nums:
        if not num in aDict:
            aDict[num] = 1
        else:
            aDict[num] += 1

    results  = []
    for i,j in aDict.items():
        if k == j:
            results.append(i)

    if len(results) > 0:
        return results
    else:
        return None
            

print(kFrequency(nums, 2))