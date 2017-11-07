#4차산업혁명 선도인재 양성 프로젝트 과정
---
## 1. Week 1 Day 2: Ruby

### Block

-Block (of code) == 코드뭉치

1. { puts "likelion" }
   do
     puts "hack your life"
   end

### iterate

a = [1,2,3,4,5]

a.each

a.each {puts "hello" }

hello 5번 출력

a.each { |p| puts p }

### Sinatra

gem install sinatra

gem install thin 서버

echo $PORT

echo $IP

서버구동

ruby app.rb -p PORT -o IP

!web은 요청과 응답 서비스

get 방식을 통해서 '/' = 루트 정브를 가져온다

domain 80

database = permenant storage = file

method 확인 : {}.respond_to?(:sample)
