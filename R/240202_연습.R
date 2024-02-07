#매개변수가 존재하지 않는 함수를 생성
func_1 <- function(){
  print('Hello R')
}

#생성된 함수를 호출
func_1()
func_2 <- function(){
  return ('Hello R')
}
func_2()

result1 <- func_1()
result2 <- func_2()
print(result1)

#매개변수가 존재하는 함수 생성
func_3 <- function(input_x, input_y) {
  result = input_x + input_y
  print(result)
  }
func_3(3, 5)

result3 = func_3(10, 3)

#변수의 종류
#전역 변수
#   함수 내부나 외부 어디서든 사용이 가능한 변수

#지역 변수
#   함수 내부에서 생성된 변수들은 함수 내부에서만 사용이 가능
#   함수의 외부에서 지역변수를 호출하면 호출이 되지 않는다.
#   휘발성 변수라고 부르기도 한다.

#매개 변수
#   함수를 생성할 때 인자 값(입력값)이 저장되는 공간
#   지역 변수와 마찬가지로 함수 내부에서만 사용이 가능


#매개변수의 개수와 인자의 개수를 다르게 호출하는 경우

func_3 (1)
func_3(1, 2, 3)

#인자의 개수가 가변인 경우

func_4 = function(...){
  print(c(...))
}

func_4(1,2,3,4,5,6,7,8,9,0)

func_4(10, 20, 30, 40, 50, 60, 70, 80, 90)

"%s%" = function(input_x, input_y){
  result = input_x ^ input_y
  return(result)
}

10 %s% -8

#매개변수의 기본값을 설정하여 함수를 생성

func_5 <- function(input_x, input_y = 2, input_z = 3){
  result <- input_x + input_y - input_z
  return (result)
}
func_5(5, 10, 3)
func_5(5)

func_5 (10, input_z = 1)

# 매개변수가 2개인 함수를 생성
# 매개변수 사이의 값들을 모두 합하여 되돌려주는 함수를 생성

func_6 = function(start, end){
  result = 0
  while (start <= end){
  result = result + start
  start = start + 1
  }
  return(result)
}

func_6(1, 100)

func_6_1 = function(start, end){
  result = 0
  for (i in start : end){
    result = result + i
  }
  return(result)
}
func_6_1 (1, 100)

min(5, 3, 8, 1, 19)

max(19, 3, 6, 11, 8)

# 함수를 생성
# 매개변수는 2개 생성
# 첫번째 매개변수는 데이터 하나를 저장
# 두번째 매개변수는 인자의 개수가 가변인 경우


func_7 = function(val , ...){
  #최소값을 되돌려주는 함수
  result = val
  
  #result와 두번째(n번째까지) 입력값을 비교하여 작은 값을 result에 담아준다.
  for (i in c(...)){
    if(result > i){
      result = i
    }
  }
  print(result)
}

func_7_1 = function(...){
  sum_f = 0
  cnt = 0
  for ( j in c(...)){
    sum_f = sum_f + j
    cnt = cnt + 1
  }
  avg_result = sum_f / cnt
  
  print(sum_f)
  print(avg_result)
  print(cnt)
}

func_8 = function(...){
  result1 = sum(...)
  result2 = length(c(...))
  result3 = result1/result2
  
  cat("총합",result1)
  cat("갯수",result2)
  cat("평균",result3)
}
func_8(1,2,3,4,1,2,3,4,5,1,2,34,1,2,3,4,4,1)


test_sum  = function(...) {
  result = 0
  for (i in c(...)){
    result = result + i
  }
  return(result)
}
test_sum()

test_len = function(value){
  cnt = 0
  for (i in value){
    cnt = cnt + 1
  }
  return (cnt)
}
test_len(c(1,5,3,2,1,5,6,1))

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
students

final_score_change = students$midterm - students$final
students <- cbind(students, final_score_change)
students

students$midterm >= 80
students[order(students$final_score_change),]
order(students$final, decreasing = TRUE)
students[order(students$final_score_change, decreasing = TRUE), ]

df_raw = data.frame(var1 = c(1,2,1),
                    var2 = c(2,3,2))
df_raw
df_raw$total = ifelse(df_raw$var1 + df_raw$var2 >= 4, 'pass', 'fail')
df_raw

name = c('A', 'B', 'C', 'D', 'E')
grade = c(1,3,2,2,1)
data.frame(name, grade)
student = data.frame(name, grade)
student

##행렬생성
##cbind() : 열을 추가하는 함수
midturm = c(70, 80, 75, 60, 90)
final = c(80, 90, 70, 75, 85)
scores = cbind(midturm, final)
scores

# 행렬과 데이터프레임 결합
data.frame(student,scores)
cbind(student, scores)

## 백터데이터를 생성
gender = c("M", "F", "F", "M", "F")

## 데이터프레임, 백터데이터, 행렬 결합
data.frame(student, gender, scores)

students = cbind(student, gender, scores)
students

test_vec = c(1,2,3,4)
cbind(students, test_vec)

data.frame(students, test_vec)


students
total = students$midturm + students[['final']]

#cbind,data.frame 이용한 파생변수 생성
data.frame(students, total)
cbind(students, total)

#$를 활용한 파생변수 생성
students$total = students$midturm + students$final
students

#student의 파생변수 생성 - 평균, 컬럼의 이름은 mean
students$mean = students$total / 2
students
students$mean = NULL
students$mean = (students$midturm + students$final)/2
students$grade == 1 = flag

#새로운 학생의 정보를 추가
new_students = data.frame(name = "F", grade=1, gender="M", midtrum = 80, final = 70, total = 150, mean = 75.0)
new_students

#리스트형태 데이터
list_a = list(name = 'test', age = 20)
list_a$loc = 'seoul'
list_a

#리스트 데이터에서 value가 벡터데이터인 경우
list_b = list(
  name = c('test', 'test2'),
  age = c(20,30)
)
list_b

list_b['name'][1]
list_b[['name']][1]
list_b$name[1]

#필터
#데이터프레임명[행의 조건, 열의 조건]
students[1,1:7]

#학년이 1학년인 학생의 정보만 출력
flag = students$grade == 1 
students[flag,]

students[!flag,]

#행과 열의 조건식을 모두 이용하여 데이터를 추출
#여학생의 중간, 기말 성적만 추출

flag2 = students$gender == 'F'
students[flag2, c('midturm', 'final')]

over_mid = students$midturm>=80
over_fin = students$final>=80
over_mid
over_fin
students[2|3]
students[over_mid & over_fin,]

flag3 = over_mid & over_fin
students[flag3,]
students

#데이터의 순서를 변경하는 함수
  #컬럼의 순서를 변경하는 방법
student
student = student[c("grade", "name")]
student

#인덱스의 순서를 변경
students[c(3,2,1,5,4),]

#order : 벡터데이터의 데이터들을 오름차순 정렬 순위 출력
students[order(students$grade),]
students[order(-students$final, decreasing = TRUE),]
students[order(students$name),]
students[order(students$mean_score,decreasing = TRUE),]

#외부 패키지 설치
install.packages('dplyr')
library(dplyr)

#컬럼의 이름을 변경
#rename('데이터프레임명', '새컬럼의 이름' = '변경할 컬럼의 이름')
rename(students, mean_score = mean)
students = rename(students, mean_score = mean)
students

#ifelse(조건식, 참인경우 데이터 출력값, 거짓인 경우 출력값)
res1 = ifelse(
  students$mean_score >= 75,
  "pass",
  "fail"
)
res1


res = 
ifelse(
  students$mean_score > 75, "pass",
  ifelse(students$mean_score == 75, 'hold', 'fail')
)
students$result = res
students

