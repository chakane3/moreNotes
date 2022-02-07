
def twoSum(arr, target):
    s = dict()
    for idx, value in enumerate(arr):
        res = target - arr[idx]

        if res in s:
            return [idx, s[res]]
        else:
            s[value] = idx

nums = [2, 7, 11, 15]
nums = [1, 2, 3, 4, -2, -3]
print(twoSum(nums, 1))
