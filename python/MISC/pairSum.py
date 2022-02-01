
def pairSum(nums, sum):
    s = set()
    s.add(nums[0])
    for num in range(1, len(nums)):
        print("num: ", num)
        if sum - nums[num] in s:
            return (sum - nums[num], nums[num])
        s.add(nums[num])
    return None


nums = [1, 5, 3, 10, 8, 5]
print(pairSum(nums, 11))