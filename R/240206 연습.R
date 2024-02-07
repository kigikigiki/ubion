## ifelse 함수를 생성
## ifelse (조건식 (벡터데이터), 참인 경우 값, 거짓인 경우 값)
a = c(TRUE, FALSE, TRUE, FALSE, FALSE)
ifelse(a, "T", "F")

## ifelse함수는 벡터 데이터를 리턴
## ifelse함수 안에는 비어있는  벡터 데이터에 데이터를 추가하는 부분이 존재

## 벡터데이터에 데이터를 추가
result = c()
## 1부터 10까지 반복을 하는 반복문 생성
for (i in 1:10) {
  if (i %% 2 == 0){
    result[length(result) + 1] = i
  }
}
result


## ifelse 함수를 생성
## 매개변수 3개
iftest = function(vec_bool, t, f){
  ## 되돌려주는 데이터는 벡터데이터이기 때문에 빈 벡터 하나 생성
  result = c()
  
  ## vec_bool의 데이터 타입은 벡터
  ## 벡터의 길이만큼 반복하는 반복문을 생성
  ## while 문에서 사용할 초기 값 지정
  i = 1
  
  ## while 조건식
  while(i <= length(vec_bool)){
    ## i가 의미 = vec_bool의 위치값
    if(vec_bool[i]){
      result[i] <- t
    }
    else{
      result[i] <- f
    }
    i = i + 1
  }
  print(result)
  print(length(vec_bool))
}
a = c(1,2,3,4,5,6,7,8,9)
flag = a >= 5
flag
iftest(a>=5,"5 이상", "5 미만")

## 결측치 데이터 처리
c1 = c(1,2,NA, 4, 5)
c2 = c(1, 2, 3, 4, 5)
c3 = c(NA, NA, 3, 4, 5)

df = data.frame(c1, c2, c3)
df

## 결측치 존재 유무
is.na(df)

## 결측치 개수 확인
## TRUE의 개수 확인
table(is.na(df))

## is.na 함수를 이용하여 데이터 필터링
flag = is.na(df$c1)
df[flag,]
df[!flag,]

## 결측치가 포함된 컬럼 데이터는 연산이 제대로 이루어지지 않는다.
mean(df$c1)
mean(df$c2)
min(df$c1)
max(df$c1, na.rm = T)

#외부의 데이터 파일을 로드
exam = read.csv("csv/csv_exam.csv")
str(exam)
## 결측치의 개수를 확인
table(is.na(exam))
## 결측치를 강제로 입력
exam[c(2,5), 'math'] <- NA
table(is.na(exam))

exam %>% select(math)

# 수학 성적에서 결측치를 제거 하고 그룹화 연산
exam %>%
  group_by(class) %>% 
  summarise(mean_math = mean(math)) ## 결측치가 존재하기 때문에 연산이 안되는 경우가 있음

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math, na.rm = T)) ## mean함수에서 결측치를 제외하고 뽑는 방법

exam %>%
  filter(!is.na(math)) %>% ## 결측치를 사전에 제거하고 뽑는 방법법
  group_by(class) %>% 
  summarise(mean_math = mean(math)) 

is.na(exam$math)
ifelse(is.na(exam$math) == TRUE, mean(exam$math, na.rm = T), exam$math )
ifelse(is.na(exam$math), 0, exam$math)


## 극단치
library(ggplot2)
mpg = ggplot2 ::mpg
str(mpg)
View(mpg)

## 고속도로 연비 데이터에서 극단치를 확인
boxplot(mpg$hwy)

#극단치를 수치화
# 하단 극단치부터 행렬형태로 나타냄
boxplot(mpg$hwy)$stats

## 결측치 확인
table(is.na(mpg$hwy))

## 극단치인 데이터를 결측치로 대체
flag = mpg$hwy < 12 | mpg$hwy > 37
table(flag)

mpg$hwy = ifelse(flag, NA, mpg$hwy)
table(is.na(mpg))
#mpg = mpg[!is.na(mpg$hwy),]

## 컬럼의 이름을 변경
## manufactuter - 제조사
## hwy - 고속도로
## cty - 시내
## class - 차종
## drv - 구동방식
mpg = 
  mpg %>% 
  rename(
    제조사 = manufacturer,
    고속도로 = hwy,
    시내 = cty,
    차종 = class,
    구동방식 = drv)
mpg

## 제조사별 고속도로의 평균 연비가 어떠한 제조사가 가장 좋은가?

## 컬럼을 제조사, 고속도로 선택
## 제조사로 그룹화
## 그룹화 연산 고속도로 평균
## 고속도로 내림차순 정렬
## 상위 5개 출력

mpg %>% 
  select(제조사, 고속도로) %>% 
  group_by(제조사) %>% 
  summarise(고속도로_평균연비 = mean(고속도로, na.rm = T)) %>% 
  arrange(desc(고속도로_평균연비)) %>% 
  head(5)

mpg %>% 
  filter(!is.na(고속도로)) %>% 
  select(제조사, 고속도로) %>% 
  group_by(제조사) %>% 
  summarise(고속도로_평균연비 = mean(고속도로)) %>% 
  arrange(desc(고속도로_평균연비)) %>% 
  head(5)

mpg %>% 
  group_by(제조사) %>% 
  summarise(mean_제조사별 = mean(고속도로)) %>% 
  arrange(desc(mean_제조사별))

### 데이터 시각화
### 그래프 표현

### 레이어를 하나씩 추가 하여 그래프를 완성

## 배경 레이어 생성
ggplot(
  data = mpg,
  aes(
    x = displ,
    y = 고속도로
    )
) + geom_point() + xlim(3,6)

## 막대 그래프 
group_data = 
  mpg %>% 
  group_by(구동방식) %>% 
  summarise(평균연비 = mean(고속도로, na.rm = T))
ggplot(
  data = group_data,
  aes(
    x = 구동방식,
    y = 평균연비
  )  
) + geom_col()  

ggplot(
  data = mpg,
  aes(
    x = 구동방식
  )
) + geom_bar()

## 제조년도별 생산 차량의 개수 라인 그래프
table(mpg$year)

group_data2 = mpg %>% 
  group_by(year) %>% 
  summarise(count = n())
ggplot(data = group_data2,
       aes(
         x = year,
         y = count
       )
    ) + geom_line()

## 샘플데이터로 line 그래프 뽑기
ggplot(
  data = economics,
  aes(
    x = date,
    y = unemploy
  )
) + geom_line()
ggplot(
    data = economics,
    aes(
      x = date,
      y = pop
    )
  ) + geom_line()

mpg = ggplot2::mpg
boxplot(mpg$hwy)
ggplot(
  data = mpg,
  aes(
    x = drv,
    y = hwy
  )
) + geom_boxplot()

