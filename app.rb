require 'sinatra'
require 'httparty'
require 'nokogiri'
require 'uri'
require 'date'
require 'csv'

#첫페이지
get '/' do
    send_file 'index.html'
end

#lol op gg 검색
get '/lol' do
    erb :lol
end

#op.gg에서 특정값만 확인
get '/search' do
    
    url = "http://www.op.gg/summoner/userName="
    @id = params[:userName]
    keyword = URI.encode(@id)
    res = HTTParty.get(url + keyword) 
    text = Nokogiri::HTML(res.body) 
    @win = text.css('#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins')
    @lose = text.css('#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.losses')
    
    # File.open("log.txt", 'a+' ) do |f| #keep appending
    #     f.write("#{@id}, #{@win.text}, #{@lose.text}, "  + Time.now.to_s + "\n")
    # end
    #log.txt로 데이터 출력
    
    CSV.open('log.csv', 'a+') do |csv|
        csv << [@id, @win.text, @lose.text, Time.now.to_s]
    end
    
    erb :search
end

get '/log' do
    @log = []
    CSV.foreach('log.csv') do |row|
        @log << row
    end
    erb :log
end

#점심메뉴 랜덤 추천
get '/lunch' do
   a = ["20층", "김밥카페", "순남시래기", "시골집"]
   @photos = {
       "20층" => "https://scontent-sea1-1.cdninstagram.com/t51.2885-15/s480x480/e35/20987024_1431422050287339_2004189507347283968_n.jpg?ig_cache_key=MTU4NzUwMTg2NjEwNzc3MTI0Nw%3D%3D.2",
       "김밥카페" => "http://www.gimgane.co.kr/board/data/file/menu/1935589795_afscgN0k_EAB980EAB080EB84A4EAB980EBB0A5_EC8B9CEAB888ECB998_.jpg",
       "순남시래기" => "http://cfile25.uf.tistory.com/image/235FF03455A3421504721F",
       "시골집" => "http://scontent.cdninstagram.com/t51.2885-15/s320x320/sh0.08/e35/14099392_661079487402979_1222276838_n.jpg"
   }
   @menu = a.sample
   erb :lunch
   #동적으로 변환하는 페이지 send할때 views/index.erb 형식으로, views폴더 생성 xxx.erb로 instead of #{xxx}
   #send_file 대신에 erb :xxx
end

#로또번호 추천
get '/lotto' do
    @a = (1..45).to_a.sample(6)
    erb :lotto
end

#어떤 url에 해당하는 값을 불러와서 읽을때 : params hash안에 저장
get '/welcome/:name' do
    "Welcome ! #{params['name']}"
end

#cube에 ^3 값
get '/cube/:num' do
    a = params[:num].to_i
    b = a ** 3
    "The result is #{b}"
end