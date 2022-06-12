
# Tutorial
# nested_list = [['blue', 'green'], ['red', 'black'], ['blue', 'white']]
# print len(nested_list) > 3
# print nested_list[1] > ['red', 'black']
# print nested_list[1][0] > red

# Task
# Given the names and grades for each student in a class of N students, store them in a nested list and print the name(s) of any student(s) having the second lowest grade.

# Note: If there are multiple students with the second lowest grade, order their names alphabetically and print each name on a new line.

# Input Format
# The first line contains an integer, N, the number of students.
# The 2N subsequent lines describe each student over 2 lines.
# - The first line contains a student's name.
# - The second line contains their grade.

# Constraints
# 2 <= N <= 5
# There will always be one or more students having the second lowest grade.

# Output Format
# Print the name(s) of any student(s) having the second lowest grade in. If there are multiple students, order their names alphabetically and print each one on a new line.

# Sample Input
# 5
# Harry
# 37.21
# Berry
# 37.21
# Tina
# 37.2
# Akriti
# 41
# Harsh
# 39

# Sample Output
# Berry
# Harry

if __name__ == '__main__':
    n = int(input())

    students_scores = []
    for _ in range(n):
        name = input()
        score = float(input())
        students_scores.append([name, score])
        
    print (students_scores)
    scores = [i[1] for i in students_scores]
    scores_no_duplicated = list(set(scores))
    second_lowest = sorted(scores_no_duplicated)[1]

    second_lowest_students_scores = [item for item in students_scores if second_lowest in item]
    second_lowest_students = [i[0] for i in second_lowest_students_scores]

    for student in sorted(second_lowest_students):
        print (student)