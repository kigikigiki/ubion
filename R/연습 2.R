# 조건문 (if문)
x = 10
if (x > 5) {
  print('x는 5보다 크다')
}

# if - else
# if 조건식이 참인경우 실행할 코드와
# else 문에서 조건식이 거짓인 경우 실행 할 코드 작성
if (x > 5) {
  print('x는 5보다 크다')
} else {
  print('x는 5보다 작거나 같다')
}

# 조건이 여러 개인 조건문
score = 55
if (score > 90) {
  print('A학점입니다')
} else if (score > 80) {
  print('B')
} else if (score > 70) {
  print('C')
} else {
  print('F')
}
  