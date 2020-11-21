'''33. Search in Rotated Sorted Array

You are given an integer array nums sorted in ascending order, and an integer target.
Suppose that nums is rotated at some pivot unknown to you beforehand 
(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
If target is found in the array return its index, otherwise, return -1. '''

class Solution:
    def search(self, nums: List[int], target: int) -> int:
        counter = 0
        for i in nums:
            if i == target:
                return counter
            else:
                counter+= 1
                if counter == len(nums):
                    return -1


'''1431. Kids With the Greatest Number of Candies
Given the array candies and the integer extraCandies, where candies[i] represents the number of candies that the ith kid has.
For each kid check if there is a way to distribute extraCandies among the kids such that he or she can have the greatest number of candies among them. 
Notice that multiple kids can have the greatest number of candies. '''

class Solution:
    def kidsWithCandies(self, candies: List[int], extraCandies: int) -> List[bool]:
        candies2 = []
        for c in candies:
            candies2.append(c+extraCandies >= max(candies))
        return candies2

''' 1480. Running Sum of 1d Array
Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
Return the running sum of nums.

Example 1:
Input: nums = [1,2,3,4]
Output: [1,3,6,10]
Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4]. '''

class Solution:
    def runningSum(self, nums: List[int]) -> List[int]:
        arr = []
        result =0

        for i in nums:
            result += i
            arr.append(result)
        return arr