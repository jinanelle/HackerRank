
# Given the participants' score sheet for your University Sports Day, you are required to find the runner-up score. You are given n scores. Store them in a list and find the score of the runner-up. (second maximum)

#n = int(input())
arr = map(int, input().split())
    
# remove duplicated from list 
arr = list(set(arr)) 

print(sorted(arr)[-2])
