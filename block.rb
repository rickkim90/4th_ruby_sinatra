# block
# 1. {}
# 2. do ~ end

arr = ["john", "mino", "tok"]
#arr.each (|a| puts a)
#1줄 출력
arr.each do |b| 
    puts b
    puts b + "입니다."
    puts "멋사 직원" + b
end

phone_book = {
    "john" => "28561607",
    "mino" => "12345678",
    "tok" => "987654321"
}

phone_book.each { |a| puts "hello" }
#iteration 3번

phone_book.each { |a| puts a }
#전체출력