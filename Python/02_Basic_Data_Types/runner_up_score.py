
# Task
# Given the participants' score sheet for your University Sports Day, you are required to find the runner-up score. You are given n scores. Store them in a list and find the score of the runner-up. (second maximum)

# Input Format
# The first line contains n. 
# The second line contains an array A[] of n integers each separated by a space.

# Constraints
# 2 <= n <= 10
# -100 <= A[i] <= 100

# Output Format
# Print the runner-up score.

# Sample Input
# 5
# 2 3 6 6 5

# Sample Output
# 5

n = int(input())
arr = map(int, input().split())
    
# remove duplicated from list 
arr = list(set(arr)) 

print(sorted(arr)[-2])
