
def twoSum(arr, target):
    s = dict()
    for idx, value in enumerate(arr):
        res = target//arr[idx] 
        
        if res in s:
            return [idx, s[res]]
        else:
            s[value] = idx
            
    

# nums = [2, 7, 11, 15]
nums = [2, 5, 6, 8, 1, 3]
print(twoSum(nums, 18))

