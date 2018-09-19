#학습에 필요한 패키지 인스톨 및 실행
if(!require(maps))install.packages('maps');library(maps)
if(!require(mapdata))install.packages('mapdata');library(mapdata)
if(!require(ggmap))install.packages('ggmap');library(ggmap)
if(!require("XML")) install.packages("XML");library(XML)
if(!require("stringr")) install.packages("stringr");library(stringr)
if(!require("RCurl")) install.packages("RCurl");library(RCurl)
if(!require("tm")) install.packages("tm");library(tm)
if(!require("SnowballC")) install.packages("SnowballC");library(SnowballC)
if(!require("wordcloud")) install.packages("wordcloud");library(wordcloud)
if(!require("RColorBrewer")) install.packages("RColorBrewer");library(RColorBrewer)

map('world','South Korea')
map('world','South Korea', fill=TRUE, col="grey")
map('world','South Korea', fill=TRUE, col="grey", bg="lightblue")

map.axes()
map.scale(129,34)
points(stations$경도, stations$위도, pch=16)

map('world',c('North Korea','South Korea'))
############################

map(database = "worldHires", region=c('South Korea', 'North Korea'))
map(database = "worldHires", region=c('South Korea', 'North Korea', 'Japan', 'China'))
map(database = "worldHires", region='South Korea', col='blue', fill=TRUE, add=TRUE)
map(database = "worldHires", region='North Korea', col='red', fill=TRUE, add=TRUE)
map(database = "worldHires", region='Japan', col='black', fill=TRUE, add=TRUE)
map(database = "worldHires", region='China', col='gold', fill=TRUE, add=TRUE)

map.scale(cex=0.7)

map(database = "worldHires", region=c('South Korea', 'North Korea', 'Japan', 'China'))
###############


geocode("daegu university")

# location <- get_map(location = "daegu university", zoom = 15, maptype = "roadmap")
ggmap(location)

# 자유의여신상 (The status of liberty), 에펠탑 (Eiffel tower)
# 등 가고 싶은 장소 또는 보고 싶은 장소를 그림으로 그려보세요.


###############



url2 <-iconv(getURL("http://www.weather.go.kr/weather/observation/currentweather.jsp",
                    .encoding="euc-kr"), from="euc-kr", to='UTF-8')
tables <-as.data.frame(readHTMLTable(url2, encoding="UTF-8"))
dim(tables)
head(tables)
names(tables)<-c("id","current","vis","cloud","l.cloud","Tcurrent","dew","sensible","prec","rh","dir","ws","hpa")
tables<-tables[tables$id!="지점",]
tables

# Step 1 :  자료만들기
# Step 2 :  필요 패키지 설치하기

# Step 3 :  텍스트 불러오기
#text <- readLines(file.choose())
filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(filePath)

docs <- Corpus(VectorSource(text))
inspect(docs)
# Step 4 :  텍스트 깨끗이 정리하기
docs <- tm_map(docs, content_transformer(tolower))  #소문자로
docs <- tm_map(docs, removeNumbers)  #숫자를 지워요

docs <- tm_map(docs, removeWords, stopwords("english"))  #불필요한 단어 제거
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2"))

docs <- tm_map(docs, removePunctuation)    #특수문자를 제거해요
docs <- tm_map(docs, stripWhitespace)  #빈칸도 제거
inspect(docs)  #정리된 파일 확인
#  Step 5 : 정리된 파일을 분석하기
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)   # 단어에 대한 빈도 분석
v <- sort(rowSums(m),decreasing=TRUE)    #많이 나온 순서대로
d <- data.frame(word = names(v),freq=v)
head(d, 10)  #상위 10개의 단어 빈도는
# Final Step : Word cloud  그리기
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))
############
#인터넷에서 검색해서 메모장에 저장하세요.
#text <- readLines(choose.files()) 를 이용해서 불러오세요.
# text <- readLines(choose.files())
#docs <- Corpus(VectorSource(text)) … 여기서 부터 실행하세요
