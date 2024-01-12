import csv

def analyze_data(data, grade_threshold):
  qualified_students = []

  for student in data:
    name = student[0]
    grades = [float(grade) for grade in student[2:]]  # Convert grades to numbers
    average_grade = sum(grades) / len(grades)

    if average_grade > grade_threshold:
      qualified_students.append(name)

  print("Students with average grades above {}:".format(grade_threshold))
  for student in qualified_students:
    print(student)

# Load your student data from a CSV file (example shown)
with open("students.csv", 'r') as csvfile:  # Replace "students.csv" with your actual file path
    reader = csv.reader(csvfile)
    next(reader)  # Skip the header row
    student_data = list(reader)  # Load data into a list

grade_threshold = 70
analyze_data(student_data, grade_threshold)
