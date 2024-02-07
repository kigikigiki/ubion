sum <- function(x,y) {
  return(x + y)
}

sum(2,3)

sum_2 <- function(x, y=5){
  return(x+y)
}

sum_2(5)

myfunc <- function(x, ...) {
  print(x)
  summary(...)
}

v <- 1:10

myfunc("Summary of v :",v)

name = c("A", "B", "C", "D", "E")
grade = c(1,3,2,1,2)
student = data.frame(name, grade)
student

midterm = c(80, 70, 90, 60, 80)
final = c(70, 90, 80, 80, 80)
scores = cbind(midterm, final)
scores

gender = c("M", "F", "F", "F", "M")
students = data.frame(student, gender, scores)
students

total_score = midterm + final
cbind(students, total_score)

new_student = data.frame(name="F", grade = 2 , gender = "M", midterm = 90, final = 80)
new_student

students <- rbind(students, new_student)



students$name
students[["grade"]]
students[[3]]

rbind(students, new_student)[["grade"]]
