
# Tutorial
# [ x for x in range(10) ] # List of integers from 0 to 9 
# >> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
#
# [[x, y] for x in [1, 2, 3] for y in [4, 5, 6]]
# >> [[1, 4], [1, 5], [1, 6], [2, 4], [2, 5], [2, 6], [3, 4], [3, 5], [3, 6]]
#
# [x for x in range(10) if x % 3 == 0] # Multiples of 3 below 10
# >> [0, 3, 6, 9]

# Task
# Let's learn about list comprehensions! You are given three integers x, y and z representing the dimensions of a cuboid along with an integer n. 
# Print a list of all possible coordinates given by (i, j, k) on a 3D grid where the sum of i + j + k  is not equal to N. 
# Here, 

# Input Format
# Four integers X, Y, Z and N each on four separate lines, respectively.

# Constraints
# 0 <= i <= x
# 0 <= j <= y
# 0 <= k <= z 

# Output Format
# Print the list in lexicographic increasing order.

# Sample Input
# 1
# 1
# 1
# 2

# Sample Output
# [[0, 0, 0], [0, 0, 1], [0, 1, 0], [1, 0, 0], [1, 1, 1]]

x = int(input())
y = int(input())
z = int(input())
n = int(input())

matrix = [[i, j, k] 
         for i in range(x + 1) 
         for j in range(y + 1) 
         for k in range(z + 1) 
         if i + j + k != n]

print(matrix)