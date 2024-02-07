library(dplyr)

## 파일의 경로
## 1. 절대경로 : 절대적인 주소 값, 환경이 변하더라도 같은 위치를 지정
## ex) c:/users/admin/document/a.txt,
## 2. 상대경로 : 상대적인 주소 값, 환경이 변함에 따라 위치도 변화
## ./ : 현재 작업중인 디렉토리
## ../ : 현재 디렉토리에서 상위 디렉토리 이동
## 폴더명/ : 하위 디렉토리(폴더명)로 이동

## 외부에 있는 데이터 파일 로드
## csv 파일 로드

## 현재 디렉토리에서 상위 디렉토리로 이동 (../) - csv라는 하위 디렉토리 이동 (csv)
df = read.csv('../csv/example.csv')
df

df2 = read.csv('C:/Users/hyungjun/OneDrive/document/ubion/csv/example.csv')
df2

exam = read.csv('../csv/csv_exam.csv')

## 파이프 연산자
## %>% : ctrl + shift + m
## 왼쪽에 있는 데이터를 오른쪽의 함수에 대입

##head(데이터 프레임명, 개수) : 데이터프레임 상위 n개를 출력
df %>% head(3)

## 인덱스의 조건식으로 필터링
## filter(조건식)
df %>% filter(Gender == 'male')

## base 함수로 필터링
## 조건식을 생성
flag = df$Gender == 'male'
df[flag,]

##특정컬럼의 데이터만 출력
df %>% select(Name, Phone)
df %>% select(-Gender)

## base 함수로 필터링
df[c('Name','Phone')]

## 성별이 남자인 데이터 중 이름과 휴대폰 번호만 출력
df %>% filter(Gender == 'male') %>% select(Name, Phone)

## base 함수로
flag = df$Gender == 'male'
df[flag,c('Name', 'Phone')]

exam

## 차순 정렬 변경 (오름차순 / 내림차순)
## 수학 성적을 기준으로 오름차순 정렬
exam %>% arrange(math)

## 수학 성적을 기준으로 내림차순 정렬
exam %>% arrange(desc(math))
exam %>% arrange(-math)

## base 함수
flag2 = order(exam$math)
exam[flag2,]
flag3 = order(exam$math, decreasing = TRUE)
exam[flag3,]

## 정렬 방식의 조건이 2개 이상인 경우
exam %>% 
  arrange(desc(class),math)

### 그룹화 연산
## class 별 수학, 과학, 영어의 평균 점수를 출력

exam %>% 
  group_by(class) %>% 
  summarise(
    mean_math = mean(math),
    mean_science = mean(science),
    mean_english = mean(english)
  )

##데이터프레임의 결합
## 행을 결합한다 -> 유니언 결합
## 열을 결합한다 -> 조인 결합

## 유니언 결합
df_1 = data.frame(
  id = 1:5,
  score = c(70, 80, 65, 80, 90)
)
df_2 = data.frame(
  id = 3:6,
  weight = c(60, 50, 70, 80)
)

df_3 = data.frame(
  id = 3:8,
  score = c(50, 70, 80, 70, 90, 50)
)
## 행 결합 함수 (rbind() : 데이터프레임의 구조가 같은 데이터 프레임을 결합)

#데이터 구조가 일치하지 않아서 에러가 남
rbind(df_1, df_2)

#데이터 구조가 같아서 결합이 정상적으로 이뤄짐
rbind(df_1, df_3)

#bind_rows() : 강제적으로 결합함, 맞지 않은 컬럼은 결측치로 
bind_rows(df_1, df_2, df_3)

## 조인결합
## 특정한 조건이 참인 경우 컬럼의 데이터를 추가
df_4 = data.frame(
  id = c('test', 'test2', 'test3', 'test4'),
  item = c('A', 'B', 'B', 'D')
)
df_5 = data.frame(
  item = c('A', 'B', 'C'),
  price = c(1000, 2000, 3000)
)
inner_join(df_4, df_5, by = 'item')
right_join(df_4, df_5)
left_join(df_4, df_5)
full_join(df_4, df_5)

library('ggplot2')

## ggplot2 패키지 안에 샘플데이터를 로드
midwest = ggplot2 :: midwest
head(midwest, 3)
str(midwest, 3)
View(midwest)

## 컬럼의 이름을 변경
## rename(데이터프레임명, 새컬럼명 = 변경할 컬럼 명)
## popasian 컬럼을 asian
## poptotal 칼럼을 total
midwest = rename(midwest, asian = popasian)
midwest = rename(midwest, total = poptotal)
midwest

# 복사본 생성 (midwest에서 country, asian, total 데이터만 추출하여 저장)
df = NULL
df = midwest %>% select(county, asian, total)
df = midwest[c('county', 'asian', 'total')]
df

## 전체 인구수 대비 아시안 인구 비율이라는 컬럼을 생성
## 컬럼의 이름은 ratio
## (아시아 인구수/ 전체 인구수) * 100
ratio = df$asian/df$total * 100

## 결합하는 방법 3가지
df = bind_cols(df,ratio = ratio)
cbind(df, ratio)
data.frame(df, ratio)

## 패키지 이용해서 파생변수 추가
df2 = midwest[c('county', 'asian', 'total')]

##mutate() : 파생변수 생성 함수
df2 %>% 
  mutate(ratio = (asian / total) * 100)

## 히스토그램 
## hist(백터데이터)
hist(df$ratio)

## 전체 ratio의 평균값을 출력
mean_ratio = mean(df$ratio)

## mean_ratio와 ratio 데이터를 비교하여 
## 평균 값보다 높은 경우 large,
## 평균값보다 이하인 경우 small
## group 컬럼명에 추가
flag4 = df$ratio > mean_ratio
ifelse(flag4, 'large', 'small')

df$group = 
  ifelse(flag4, 'large', 'small')
table(df$group)

## 패키지 이용하여 컬럼 추가
df = df %>% 
  mutate(group = ifelse(ratio>mean(ratio), 
                        'large', 
                        'small'
                        )
         )
table(df$group)


midwest = ggplot2::midwest
midwest


## midwest 데이터에서 데이터 정제
## 컬럼의 이름을 변경 
## popadult 컬럼을 adult 변경
## poptotal 컬럼을 total 변경
## county, adult, total 컬럼만 따로 추출 변수에 저장
## "전체 인구수 대비 미성년자의 인구 비율" 컬럼("child_ratio) 을 생성
## child_ratio 가 가장 높은 상위 5개의 지역을 출력
midwest = rename(midwest, adult = popadults)
midwest = rename(midwest, total = poptotal)
df = midwest %>% select(county, adult, total)
df$child = df$total - df$adult
df$child_ratio = df$child/df$total * 100
order(df$child_ratio,decreasing = TRUE) -> flag
df_1 = df %>% arrange(desc(child_ratio))
head(df_1,5)

## Base 함수들을 이용해서 작업
## 칼럼의 이름을 변경
midwest = ggplot2 :: midwest
midwest = rename(midwest, adult = popadults)
midwest = rename(midwest, total = poptotal)
## county, adult, total 칼럼만 따로 추출하여 변수에 저장
df = midwest[c("county", "adult", "total")]
## child 칼럼을 추가하여 total - adult 데이터를 추가
df$child = df$total - df$adult
## child_ratio 칼럼을 추가하여 child / total * 100 데이터를 추가
df$child_ratio = df$child / df$total * 100
## child_ratio 칼럼을 높은 상위 5개의 지역을 출력한다.
## child_ratio 내림차순 정렬
flag = order(df$child_ratio, decreasing = TRUE)
df = df[flag,]
## 상위 5개 지역을 출력
head(df, 5)

midwest = ggplot2 :: midwest

midwest %>% 
  rename(adult = popadults, total = poptotal) %>% 
  select(county, adult, total) %>% 
  mutate(child = total - adult, child_ratio = child / total * 100) %>% 
  arrange(desc(child_ratio)) %>% 
  head(5)

students %>% arrange(midturm)
students %>% mutate(total = midturm + final
                    , mean = (midturm + final)/2)

df_1 = data.frame(id = 1:5, score = c(60,70,80,90,100))
df_2 = data.frame(id = 1:5, weight = c(80,70,75,65,60))
df_3 = data.frame(id = 1:3, class = c(1,1,2))
total_df1 = inner_join(df_1, df_2, by = 'id')
total_df1

total_df2 = inner_join(df_1, df_3, by = 'id')
total_df2

total_df3 = full_join(df_1, df_3, by = 'id')
total_df3

a = data.frame(id = c(1,2,3,4,5), score = c(60,80,70,90,85))
b = data.frame(id = c(3,4,5,6,7), weight = c(80,90,85,60,85))
df_1 = bind_rows(a,b)

#a = data.frame(id = c(1,2,3,4,5), score = c(60,80,70,90,85))
#b = data.frame(id = c(3,7,8), score = c(80, 90, 85))
#bind_rows(a,b)

df_1$score = ifelse(is.na(df_1$score), mean(df_1$score, na.rm = T), df_1$score)
df_1
boxplot(df_1$score)

#시각화
install.packages("ggplot2")

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

mpg = ggplot2::mpg

