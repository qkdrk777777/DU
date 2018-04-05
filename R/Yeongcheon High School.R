if(!require('base64enc'))install.packages('base64enc')
if(!require('RCurl'))install.packages('RCurl')
if(!require('twitteR'))install.packages('twitteR')
if(!require('ROAuth'))install.packages('ROAuth')
if(!require('stingr'))install.packages('stingr')
if(!require('KoNLP'))install.packages('KoNLP')
if(!require('wordcloud'))install.packages('wordcloud')
if(!require('RColorBrewer'))install.packages('RColorBrewer')

consumerKey<-"tIHi4OgXo7rmWMLtQPnxtLisS"
consumerSecret<-"a2RnhXkpeeKPPTKKhYqv1MdCDL5cz8L6DCtlcnZyYR0pMkf0bu"
accesstoken<-"918738742587699200-J4xSSA9u7ujmd9l37qsNK57QsDTD88E"
accesstokensecret<- "JDKI53Po9kLE9bI0EIWfK3d6EbkaCr3R906H9eYyVLtKJ"
options(RCurlOptions = list(cainfo=system.file('CurlSSL','cacert.pem',package='RCurl')))
download.file(url='https://curl.haxx.se/ca/cacert.pem',destfile = 'carcert.pem')
setup_twitter_oauth(consumerKey,consumerSecret,accesstoken,accesstokensecret)
1
string<-'대구대'
string<-iconv(string,'cp949','utf8')
tweets<-searchTwitter(searchString = string,n=2000,lang='ko')
(text_extracted<-sapply(tweets,function(t)t$getText()))
(text_extracted<-str_replace_all(text_extracted,'[0-9]',''))
extractNoun
(text_extracted<-str_replace_all(text_extracted,'[#+]',''))
(text_extracted<-gsub('[RT+]','',text_extracted))
(text_extracted<-gsub('https\\S*','',text_extracted))
(text_extracted<-gsub('\n','',text_extracted))
(text_extracted<-gsub('[^A-zㄱ-힣 ]+','',text_extracted))
text_extracted<-sapply(text_extracted, extractNoun, USE.NAMES=F)

wordcount <- table(unlist(text_extracted))

palete <- brewer.pal(5,"Set1")
wordcloud(names(wordcount),freq=wordcount,scale=c(5,0.5),rot.per=0.25,min.freq=5,
          random.order=F,random.color=T,colors=palete)

