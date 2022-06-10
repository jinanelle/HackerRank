# Given the names and grades for each student in a class of n students, store them in a nested list and print the name(s) of any student(s) having the second lowest grade.

# Note: If there are multiple students with the second lowest grade, order their names alphabetically and print each name on a new line.

# Constraints
# 2 <= N <= 5

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
        
    scores = [i[1] for i in students_scores]
    scores_no_duplicated = list(set(scores))
    second_lowest = sorted(scores_no_duplicated)[1]

    second_lowest_students_scores = [item for item in students_scores if second_lowest in item]
    second_lowest_students = [i[0] for i in second_lowest_students_scores]

    for student in sorted(second_lowest_students):
        print (student)