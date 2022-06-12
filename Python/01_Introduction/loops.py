# Tutorial
# range (5) > 0,1,2,3,4
# range (2,5) > 2,3,4
# range (0, 5, 2) > O,2,4
# range (5, -1, -1) > 5,4,3,2,1

# Task
# The provided code stub reads and integer, n, from STDIN. 
# For all non-negative integers i < n, print i^2

# Input
# The first and only line contains the integer n

# Output
# Print n lines, one corresponding to each i.

# Sample Input
# 5

# Sample Output
# 0
# 1
# 4
# 9
# 16

if __name__ == '__main__':
    n = int(input())
    for i in range(n):
        print(i ** 2)