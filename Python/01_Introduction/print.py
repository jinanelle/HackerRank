
# Task
# The included code stub will read an integer, n, from STDIN.
# Without using any string methods, try to print the following: 123...n

# Input Format
# The first line contains an integer n.

# Constraints
# 1 <= n <= 150 

# Output Format
# Print the list of integers from 1 through n as a string, without spaces.

# Sample Input
# 3

# Sample Output
# 123

n = int(input())
for i in range(n):
    print(i+1, end ="")
