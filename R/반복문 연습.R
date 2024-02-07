# 주석 - 1)남들에게 해당하는 코드의 설명을 작성하기 위해
#        2)나에게
#        3)테스트 코드를 주석처리해서 잠시 꺼두는 느낌?

#변수를 생성
a = 10
b = "test"
TRUE -> c
d <- c(1,2,3,4,5)
e <- c("test1", "test2", "test3")
f <- 1:10
f

print(d[1])

arr_x = array(1:10, dim=c(10,10))
print(arr_x)

a = "test"
print(a)


#리스트 형태의 데이터 생성
#백터 데이터에서 index(위치)값 대신에 key 값을 지정
#백터 데이터에서 순서대로 데이터를 나열해야되는 데이터
#리스트 데이터는 순서와 상관없이 key값을 기준으로 데이터를 출력 가능

list_a = list(name = "test", age = 20, phone = "01040422837")
list_b = list(name = "test1", age = 40, phone = "01012341234")

print(list_a["age"])

df = data.frame(
  name = c('test1', 'test2', 'test3'),
  age = c(20,30,40),
  phone = c("01012345678","01012341234","01045674567")
)
df

df = data.frame(
  name = c('test1', 'test2', 'test3'),
  age = c(30,40),
  phone = c("01012345678","01012341234","01045674567")
)


#연산자

#산술연산자
x = 10
y = 3
print(x + y)
x - y -> result
result

x ^ y
x * y
x / y
x %% y
x %/% y

#비교연산자
#두개의 데이터를 비교하여 결과 값은 논리값으로 출력
x > y
z = 5
x == z
y != z
x > y
x < z

#논리연산자
print( !FALSE)
#and
#두 개의 논리값들이 모두 참인 경우에만 참을 출력, 그 외의 경우는 모두 거짓 출력
print(!TRUE & !TRUE)
#or
#두 개의 논리값 중 하나만 참이여도 참을 출력
#두 개의 논리값이 모두 거짓인 경우에만 거짓을 출력
print(TRUE | TRUE)
print(TRUE | FALSE)
print(!TRUE | FALSE)

#조건문 (if문)
x <- 4
if(x>5) {
  print('x는 5보다 크다')
}

#if - else문

if (x>5){
  print("X는 5보다 크다")
}else{
  print("X는 5보다 작거나 같다")
}

score <- 95
if (score >= 90){
  print("성적 : A")
}else if (score >= 80){
  print("성적 : B")
}else if (score >= 70){
  print("성적 : C")
}else {
  print("성적 : F")
}

# if 조건식에 조건식이 2개 이상인 경우
id <- "test2"
pass <- '1111'

if (id == "test" & pass == "1234") {
  print("로그인에 성공했습니다.")
}else if (id != "test" | pass != "1234"){
  print("아이디 혹은 비밀번호를 확인해주세요")
}else {
  print("아이디와 비밀번호를 확인해주세요")
}

#which 문
name <- c("test", "test2", "test3")

which(name == "test2")
a=1
if (name[a] == "test2"){
  print(1)
  a <- a-1
}else a <- a+1
if (name[a] == "test2"){
  print(2)
  a <- a-1
}else a <- a+1
if (name[a] == "test2"){
    print(3)
  a <- a-1
}

which (name != 'test2')

#반복문

#for문
#원소데이터의 원소의 개수만큼 반복 실행하는 구문

array_a = 1:48568
result = 0

for (i in array_a){
  result = result + i   
}
print(result)

result = 0

#while문 초기 시작값을 지정하고 해당하는 값을 반복 실행할때마다 증감시켜 조건식이 거짓이 될 때 까지 반복 실행

i = 1
result = 0
while (i <= 10){
  result = result + i
  i = i + 1
}
print(result)

i = 1
result = 0
while (i <= 10){
  i = i + 1
  result = result + i
}
print(result)

x = c(2:9)
y = c(1:9)
a = 1
for (i in x){
  #print(x)
  for (j in y){
    if(i == a)
      print("2단 :")
      print(i*j)
      a = a + 1
  }
}

x = c(1:6)
y = c(1:6)
cnt = 0
for (i in 1:6){
  for (j in 1:6){
    result = i+j
    if(result%%5 == 0){
    print(c(i,j))
    cnt = cnt + 1
    }
  }
}
print(cnt)

#break 문
for (i in 1 : 100){
  print(i)
  if (i > 3){
    break
  }
}

#1부터 100까지의 누적합중에 누적합의 값이 2000이 넘어가는 부분에 숫자 몇일까? 합계는 몇일까?
result = 0
for (i in 1:100){
  result = result + i
  if(result > 2000){
    break
  }
}
print(c(result,i))
i = 1
result = 0
while (TRUE) {
  result = result + i

  if (result > 50000){
    break
  }
  i = i + 1
}
print(c(i,result))

result = 0
i = 1

while (i <= 100){
   if ( i %% 2 == 0){
   result = result + i
   }
  i = i + 1
}
print(c(i, result))

for (i in 1 : 100) {
  if (i %% 2 == 0){
    result = result + i
  }
}
print (c(i, result))

result = 0
for (i in 1 : 50){
  result = result + i * 2
}
print(result)

i = 1
result = 0

while (TRUE) {
  if (i > 100){
    break
  }
  result = result + i
  i = i + 2
}
print(c(i,result))

# 비순서형 벡터 데이터를 이용한 for문
array_a = c('kim', 'park', 'lee')
for ( i in array_a) {
  print(i)
}

i = 1
while (i <= 3){
  print(array_a[i])
  i = i + 1
}


#next 문 = 반복문으로 넘어간다 - 다음으로 넘어간다
for(i in 1:10) {
print(c("1번",i))
    if (i < 5){
    next
  }
  print(c("2번",i))
}
print(c("3번",i))

result = 0
for (i in 1:100){
  if (i %% 2 == 1){
    next
  }
  result = result + i
}
print(result)
