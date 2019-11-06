rm(list = ls())
cat('\014')
##上可略，設定R的環境
memory.size() #查詢R目前使用的記憶體(MB)
memory.limit() #查詢R最大可用的記憶體(MB)
ls() #目前有哪些變數
rm() #刪除變數
rm(list = ls()) #刪除所有變數
memory.size() #釋放R軟體使用的記憶體(MB)
#Ctrl + shift + (1/2/3/4) #切換不同視窗，這個是指視窗的放大
#####################################################################################
install.packages(c("ggplot2", "gcookbook", "corrplot", "RColorBrewer", "openxlsx", "data.table"))
library(ggplot2) #R數據視覺化
library(corrplot) #R相關矩陣套件
library(gcookbook) #R視覺化資料集
library(RColorBrewer)
library(openxlsx)
library(data.table)
#library(formatR)
search()
colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA")) #把調色盤變成代號

setwd("C:/Users/Jack Chang/Desktop/TWSE_ADRGDR_arbitragestrategy/data") #03152138 張永霖
getwd()
dir()

xlsx_bench = read.xlsx("台灣ADR GDR 20190621--值.xlsx", sheet = 1)
xlsx_adrgdr = read.xlsx("台灣ADR GDR 20190621--值.xlsx", sheet = 2)
xlsx_open = read.xlsx("台灣ADR GDR 20190621--值.xlsx", sheet = 3)
xlsx_close = read.xlsx("台灣ADR GDR 20190621--值.xlsx", sheet = 4)

#####################################################################################
#####################################################################第一題: 資料整理
#####################################################################################

######################################adrgdr
adrgdr_list <- paste(xlsx_adrgdr[2, ])
adrgdr_list<- paste(adrgdr_list, "_Close", sep = "")
adrgdr_list
xlsx_adrgdr <- xlsx_adrgdr[-1:-4, ]

colnames(xlsx_adrgdr)=c("Date",
                       
                       "TSM US Equity_Close","TSFA GR Equity_Close", 
                       "HNHPF US Equity_Close", "HHPD LI Equity_Close", 
                       "CHT US Equity_Close", "CHWD GR Equity_Close", 
                       "TLC US Equity_Close", "7TLA GR Equity_Close",
                       "AUO US Equity_Close", "AU7A GR Equity_Close", 
                       "IMOS US Equity_Close", "CPIA GR Equity_Close",  
                       "UMC US Equity_Close", "UMCB GR Equity_Close", 
                       
                       "ASX US Equity_Close", "ASKD LX Equity_Close","CTC LX Equity_Close",
                       "CFHS LX Equity_Close",  "CHCG LX Equity_Close",  "CPED LX Equity_Close", 
                       "DELT LX Equity_Close",  "ESNFY LX Equity_Close", "FEC LX Equity_Close",  
                       "FFHD LX Equity_Close",  "FFHCR LX Equity_Close", "QUCO LX Equity_Close", 
                       "TAICA LX Equity_Close", "YAGG LX Equity_Close" 
                       )
#View(xlsx_adrgdr)
###################################open
open_list <- paste(xlsx_open[2, ])
open_list<- paste(open_list, "_Open", sep = "")
open_list
xlsx_open <- xlsx_open[-1:-4, ]

colnames(xlsx_open)=c("Date",
                      
                      "2330    TT Equity_US_Open", "2330    TT Equity_GR_Open", 
                      "2317    TT Equity_US_Open", "2317    TT Equity_LI_Open", 
                      "2412    TT Equity_US_Open", "2412    TT Equity_GR_Open", 
                      "4152    TT Equity_US_Open", "4152    TT Equity_GR_Open",
                      "2409    TT Equity_US_Open", "2409    TT Equity_GR_Open", 
                      "8150    TT Equity_US_Open", "8150    TT Equity_GR_Open", 
                      "2303    TT Equity_US_Open", "2303    TT Equity_GR_Open",
                      
                      "3711    TT Equity_Open", "2357    TT Equity_Open", "2474    TT Equity_Open",
                      "2882    TT Equity_Open", "2002    TT Equity_Open", "2324    TT Equity_Open",
                      "2308    TT Equity_Open", "2884    TT Equity_Open", "4904    TT Equity_Open",
                      "2892    TT Equity_Open", "2881    TT Equity_Open", "2382    TT Equity_Open",
                      "1101    TT Equity_Open", "2327    TT Equity_Open", 
                      
                      "USDTWD Curncy_Open", "EURTWD Curncy_Open"
)
#View(xlsx_open)
###################################close
close_list <- paste(xlsx_close[2, ])
close_list<- paste(close_list, "_Close", sep = "")
close_list
xlsx_close <- xlsx_close[-1:-4, ]

colnames(xlsx_close)=c("Date",
                      
                      "2330    TT Equity_US_Close", "2330    TT Equity_GR_Close", 
                      "2317    TT Equity_US_Close", "2317    TT Equity_LI_Close", 
                      "2412    TT Equity_US_Close", "2412    TT Equity_GR_Close", 
                      "4152    TT Equity_US_Close", "4152    TT Equity_GR_Close",
                      "2409    TT Equity_US_Close", "2409    TT Equity_GR_Close", 
                      "8150    TT Equity_US_Close", "8150    TT Equity_GR_Close", 
                      "2303    TT Equity_US_Close", "2303    TT Equity_GR_Close",
                      
                      "3711    TT Equity_Close", "2357    TT Equity_Close", "2474    TT Equity_Close",
                      "2882    TT Equity_Close", "2002    TT Equity_Close", "2324    TT Equity_Close",
                      "2308    TT Equity_Close", "2884    TT Equity_Close", "4904    TT Equity_Close",
                      "2892    TT Equity_Close", "2881    TT Equity_Close", "2382    TT Equity_Close",
                      "1101    TT Equity_Close", "2327    TT Equity_Close", 
                      
                      "USDTWD Curncy_Close", "EURTWD Curncy_Close"
)
#View(xlsx_open)
#################################merge
xlsx <- merge(x = xlsx_adrgdr, y = xlsx_open, by = "Date")
xlsx <- merge(x = xlsx, y = xlsx_close, by = "Date")
#View(xlsx)

xlsx <- data.frame(sapply(xlsx, function(x) as.numeric(as.character(x))))
sapply(xlsx, class)

class(xlsx$Date)
#xlsx$Date<-as.character(xlsx$Date)
xlsx$Date<-as.Date(xlsx$Date, origin ="1899-12-30")

################################corrplot
#dev.new()
corrplot(round(cor(xlsx[2:24]), 2),
         method = "pie",
         tl.col = "black",
         tl.srt = 45,
         col = col(200),
         addCoef.col = "black",
         order="AOE"
)
#method種類：circle, square, ellipse, shade, pie
#tl.col：欄位顏色
#tl.srt：欄位全旋轉角度(傾斜角度)
#col(200)：多少種顏色(切幾等分)
#order：AOE是相關性接近的排在一起
#####################################################################################
#####################################################################第二題: 策略開發
#####################################################################################

########################################查看換股比例
ta = 19 #哪個哪檔股票
xlsx_bench[ta, 2]
xlsx_bench[ta, 13] #換股比率
xlsx_bench[ta, ] #all

xlsx$ADJUST_PRICE_USD_Close<-(xlsx$CHCG.LX.Equity_Close)*(xlsx$USDTWD.Curncy_Close)/20
#xlsx$ADJUST_PRICE_EUR_Close<-(xlsx$TSFA.GR.Equity_Close)*(xlsx$EURTWD.Curncy_Close)/20

#########################################目標標的(改這個)
ADJ_US_Close <- xlsx$ADJUST_PRICE_USD_Close
ADJ_EU_Close <- xlsx$ADJUST_PRICE_EUR_Close
TT_Open <- xlsx$X2002....TT.Equity_Open
TT_Close <- xlsx$X2002....TT.Equity_Close
FEE <- (0.001425+0.001425)*(2.8)/10+(0.003)

######################################################################正常狀況(不賣空)
######################################################################################
#正常狀況(不賣空)
###PART1 合在一起的ab 
fprice <- seq(-3, 3, by = 0.01) #設定價格範圍
#fdays <- seq(1, 30, by = 1) #設定天數範圍
fdays <- 0
ab<-matrix(0,nrow = length(fprice)*length(fdays),ncol = 10) #建立ab矩陣
colnames(ab)<-c("勝率","賺賠比","獲利因子", "交易天數",
                "length(PL[PL>0]","length(PL[PL!=0]",
                "mean(PL[PL>=0]","abs(mean(PL[PL<0]))",
                "sum(PL[PL>=0])","abs(sum(PL[PL<0])" )
pxd <- expand.grid(fprice = fprice, fdays = fdays)
opxd <- pxd[order(pxd$fprice, pxd$fdays),];
rownames(ab) <- paste(opxd$fprice, "*", opxd$fdays, "天") #每個rowname都是價格跟天數命名

z=0
#設定投資規則(嘔心瀝血之for迴圈)
for (x in fprice) {
  row = ADJ_US_Close > TT_Open + x
  #View(row)
  #設定向量 #numeric(nrow(xlsx))多少個0(還沒賺錢先設0)
  PL <- setNames(numeric(nrow(xlsx)),xlsx$Date)
  #View(PL)
  m=1 #第一天交易
  for (y in fdays) {
    for (m in 1:(nrow(xlsx) - y)) {
      if (row[m]==1){
        PL[m]<-as.numeric(TT_Close[m+y]
                          -TT_Open[m]
                          -TT_Close[m+y]*FEE
        ) #計算手續費 
        #計算每次符合條件開盤到收盤當沖賺多少
      }else
        PL[m]=0
    }
    ab[z+1,1] <- length(PL[PL>0])/length(PL[PL!=0])#勝率
    ab[z+1,2] <- mean(PL[PL>0])/abs(mean(PL[PL<0]))#平均賺/賠
    ab[z+1,3] <- sum(PL[PL>0])/abs(sum(PL[PL<0]))#獲利因子
    ab[z+1,4] <- length(row[row == TRUE]) #交易天數
    ab[z+1,5] <- length(PL[PL>0])
    ab[z+1,6] <- length(PL[PL!=0])
    ab[z+1,7] <- mean(PL[PL>0])
    ab[z+1,8] <- abs(mean(PL[PL<0]))
    ab[z+1,9] <- sum(PL[PL>0])
    ab[z+1,10] <- abs(sum(PL[PL<0]))
    z = z + 1
    #print(z)
  }
  
}

####################################################PART2 BENCHMARK
###################################################################
##PART2 BENCHMARK
benchpxd<-matrix(0, nrow = nrow(ab), ncol = 2) ###
colnames(benchpxd)<-c("sum","multi")
rownames(benchpxd) <- paste(opxd$fprice, "*", opxd$fdays, "天")
for (q in 1:nrow(ab)){
  benchpxd[q,1]<-(ab[q,1]*ab[q,2]+ab[q,3]) 
  #第一個BENCHMARK:勝率*平均賺賠比+獲利因子
  benchpxd[q,2]<-((ab[q,1]*ab[q,2]+ab[q,3])*length(row[row == TRUE])/length(row))
  #第二個BENCHMARK:[勝率*平均賺賠比+獲利因子]*交易日比例
}

#max(benchpxd, na.rm = TRUE)
#which(benchpxd[ , 1] == max(benchpxd, na.rm = TRUE))[1]
#which(benchpxd[ , 2] == max(benchpxd, na.rm = TRUE))[1]
summax <- do.call(pmax, c(benchpxd[ , 1], list(na.rm=T)))
rownames(benchpxd)[which(grepl(summax, benchpxd[ , 1]))]#找出max的rowname(第一個BENCHMARK)
multimax <- do.call(pmax, c(benchpxd[ , 2], list(na.rm=T)))
rownames(benchpxd)[which(grepl(multimax, benchpxd[ , 2]))]#找出max的rowname(第二個BENCHMARK)

####################################################PART3 設定投資規則
###################################################################
#PART3 設定投資規則
days=0 #填入剛剛天數結果
price=0.24 #填入剛剛價格結果
row=ADJ_US_Close > TT_Open + price
#View(row)

#設定向量 #numeric(nrow(xlsx))多少個0(還沒賺錢先設0)
PL<-setNames(numeric(nrow(xlsx)),xlsx$Date)
#View(PL)

m=1 #第一天交易

for (m in 1:(nrow(xlsx)-days)) {
  if(row[m]==1){
    PL[m]<-as.numeric(+TT_Close[m+days]
                      -TT_Open[m]
                      -TT_Close[m+days]*FEE #手續費金額
    ) #計算手續費  #計算每次符合條件開盤到收盤當沖賺多少
  }else
    PL[m]=0
}


#dev.new()
plot(cumsum(PL), 
     main=paste("累計獲利圖：", price, "買進，", days, "天後賣出"), 
     type = "l"
)

watch<-cbind(ADJ_US_Close ,TT_Open ,TT_Close , PL, row)
colnames(watch)=c("ADJUST_PRICE","OPEN","CLOSE","PL","row")
#View(watch)
#檢驗策略的品質 #交易次數
sum(row)
length(row)
sum(row)/length(row)
#View(PL)
PL[PL!=0]
PL[PL>0]
class(PL[PL<0])

length(PL[PL>0])/length(PL[PL!=0])#勝率
mean(PL[PL>0])/abs(mean(PL[PL<0]))#平均賺/賠
sum(PL[PL>0])/abs(sum(PL[PL<0]))#獲利因子
length(row[row == TRUE])
days
price

######################################################################TWO 放空+借券費
######################################################################################
#TWO 放空+借券費 
##概念基本上相同，已修改完成程式碼(為了區隔重要變數前面都加"s")，獲利因子同樣達到100多...
###PART1 合在一起 
sfprice <- seq(-3, 3, by = 0.01) #價格
#sfdays <- seq(1, 40, by = 1) #天數
sfdays <- 0
sab<-matrix(0, nrow = length(sfprice)*length(sfdays), ncol = 10)
colnames(sab)<-c("勝率","賺賠比","獲利因子", "交易天數",
                 "length(PL[PL>0]","length(PL[PL!=0]",
                 "mean(PL[PL>=0]","abs(mean(PL[PL<0]))",
                 "sum(PL[PL>=0])","abs(sum(PL[PL<0])" )
spxd <- expand.grid(sfprice = sfprice, sfdays = sfdays)
sopxd <- spxd[order(spxd$sfprice, spxd$sfdays),];
rownames(sab) <- paste(sopxd$sfprice, "*", sopxd$sfdays, "天")

sz=0
#設定投資規則
for (sx in sfprice) {
  srow = ADJ_US_Close < TT_Open + sx
  #View(row)
  #設定向量 #numeric(nrow(xlsx))多少個0(還沒賺錢先設0)
  sPL <- setNames(numeric(nrow(xlsx)),xlsx$Date)
  #View(PL)
  sm=1 #第一天交易
  for (sy in sfdays) {
    for (sm in 1:(nrow(xlsx) - sy)) {
      if (srow[sm]==1){
        sPL[sm]<-as.numeric(+TT_Open[sm]
                            -TT_Close[sm+sy]
                            -TT_Open[sm]*FEE #假設這是借券費金額
        ) #計算手續費 
        #計算每次符合條件開盤到收盤當沖賺多少
      }else
        sPL[sm]=0
    }
    sab[sz+1,1] <- length(sPL[sPL>0])/length(sPL[sPL!=0])#勝率
    sab[sz+1,2] <- mean(sPL[sPL>0])/abs(mean(sPL[sPL<0]))#平均賺/賠
    sab[sz+1,3] <- sum(sPL[sPL>0])/abs(sum(sPL[sPL<0]))#獲利因子
    sab[sz+1,4] <- length(srow[srow == TRUE])#交易天數
    sab[sz+1,5] <- length(sPL[sPL>0])
    sab[sz+1,6] <- length(sPL[sPL!=0])
    sab[sz+1,7] <- mean(sPL[sPL>0])
    sab[sz+1,8] <- abs(mean(sPL[sPL<0]))
    sab[sz+1,9] <- sum(sPL[sPL>0])
    sab[sz+1,10] <- abs(sum(sPL[sPL<0]))
    sz = sz + 1
    #print(z)
  }
  
}

####################################################PART2 BENCHMARK
###################################################################
##PART2 BENCHMARK
sbenchpxd<-matrix(0, nrow = nrow(sab), ncol = 2) ###
colnames(sbenchpxd)<-c("sum","multi")
rownames(sbenchpxd) <- paste(sopxd$sfprice, "*", sopxd$sfdays, "天")
for (sq in 1:nrow(sab)){
  sbenchpxd[sq,1]<-(sab[sq,1]*sab[sq,2]+sab[sq,3]) 
  #第一個BENCHMARK:勝率*平均賺賠比+獲利因子
  sbenchpxd[sq,2]<-(sab[sq,1]*sab[sq,2]+sab[sq,3])*length(srow[srow == TRUE])/length(srow) 
  #第二個BENCHMARK:[勝率*平均賺賠比+獲利因子]*交易日比例
}

#max(benchpxd, na.rm = TRUE)
#which(benchpxd[ , 1] == max(benchpxd, na.rm = TRUE))[1]
#which(benchpxd[ , 2] == max(benchpxd, na.rm = TRUE))[1]
ssummax <- do.call(pmax, c(sbenchpxd[ , 1], list(na.rm=T)))
rownames(sbenchpxd)[which(grepl(ssummax, sbenchpxd[ , 1]))] #找出max的rowname(第一個BENCHMARK)
smultimax <- do.call(pmax, c(sbenchpxd[ , 2], list(na.rm=T)))
rownames(sbenchpxd)[which(grepl(smultimax, sbenchpxd[ , 2]))]#找出max的rowname(第二個BENCHMARK)
####################################################PART3 設定投資規則
###################################################################
#PART3 設定投資規則
sdays=0
sprice=1.93
srow=ADJ_US_Close < TT_Open + sprice
#View(row)

#設定向量 #numeric(nrow(xlsx))多少個0(還沒賺錢先設0)
sPL<-setNames(numeric(nrow(xlsx)),xlsx$Date)
#View(PL)

sm=1 #第一天交易

for (sm in 1:(nrow(xlsx)-sdays)) {
  if(srow[sm]==1){
    sPL[sm]<-as.numeric(+TT_Open[sm]
                        -TT_Close[sm+sdays]
                        -TT_Open[sm]*FEE
    ) #計算手續費  #計算每次符合條件開盤到收盤當沖賺多少
  }else
    sPL[sm]=0
}


#dev.new()
plot(cumsum(sPL), 
     main=paste("累計獲利圖：", sprice, "買進，", sdays, "天後賣出"), 
     type = "l"
)

swatch<-cbind(ADJ_US_Close ,TT_Open, TT_Close, sPL, srow)
colnames(swatch)=c("ADJUST_PRICE","OPEN","CLOSE","PL","row")
#View(swatch)
#檢驗策略的品質 #交易次數
sum(srow)
length(srow)
sum(srow)/length(srow)
#View(sPL)
sPL[sPL!=0]
sPL[sPL>0]
class(sPL[sPL<0])

length(sPL[sPL>0])/length(sPL[sPL!=0])#勝率
mean(sPL[sPL>0])/abs(mean(sPL[sPL<0]))#平均賺/賠
sum(sPL[sPL>0])/abs(sum(sPL[sPL<0]))#獲利因子
length(srow[srow == TRUE])
sdays
sprice

#####################################################################################
#####################################################################第三題: 證明策略
#####################################################################################
#https://stock.cnyes.com/
install.packages("imager")
library(imager)
plot(load.image("Dqa9G3aS.png"))

#####################################################################################
#####################################################################第四題: 個股選擇權運用
#####################################################################################
#https://www.taifex.com.tw/cht/3/dlOptDailyMarketView

setwd("C:/Users/Jack Chang/Desktop/TWSE_ADRGDR_arbitragestrategy/data") #03152138 張永霖
dir()

Equity <- fread("Daily_2019_06.txt", header=TRUE, fill = TRUE, sep=",")
colnames(Equity)
unique(Equity$交易日期)
unique(Equity$買賣權)

EquityTA <- Equity[which(Equity$交易日期 == "2019/06/19" & Equity$成交量 > 0), ]
#EquityTA <- data.frame(sapply(EquityTA, function(x) as.numeric(as.character(x))))
EquityTA$收盤價 <- sapply(EquityTA$收盤價, function(x) as.numeric(as.character(x)))
EquityTA$開盤價 <- sapply(EquityTA$開盤價, function(x) as.numeric(as.character(x)))
#sink()
sapply(EquityTA, class)

#正常狀況
print("正常狀況")
for (i in 1:nrow(EquityTA)) {
  if (EquityTA$買賣權[i] == "買權"){
    if ((EquityTA$收盤價[i] - EquityTA$開盤價[i])*EquityTA$履約價[i] > 0){
      print("買權sit.")
      print(paste("選擇權有辦法賺錢，買權：", 
                  EquityTA$收盤價[i], "減", EquityTA$開盤價[i],
                  "乘以", EquityTA$履約價[i],
                  "等於", (EquityTA$收盤價[i] - EquityTA$開盤價[i])*EquityTA$履約價[i], "元"))
    }else{
      #print(paste("選擇權沒有辦法賺錢，買權：",
                  #EquityTA$收盤價[i], "減", EquityTA$開盤價[i], 
                  #"乘以", EquityTA$履約價[i],
                  #"等於", (EquityTA$收盤價[i] - EquityTA$開盤價[i])*EquityTA$履約價[i], "元"))
    }    
  }else{
    #NOPE
  }
  ################################################################
  if (EquityTA$買賣權[i] == "賣權"){
    if ((EquityTA$開盤價[i] - EquityTA$收盤價[i])*EquityTA$履約價[i] > 0){
      print("賣權sit.")
      print(paste("選擇權有辦法賺錢，賣權：", 
                  EquityTA$開盤價[i], "減", EquityTA$收盤價[i], 
                  "乘以", EquityTA$履約價[i],
                  "等於", (EquityTA$開盤價[i] - EquityTA$收盤價[i]), "元"))
    }else{
      #print(paste("選擇權沒有辦法賺錢，賣權：", 
                  #EquityTA$開盤價[i], "減", EquityTA$收盤價[i], 
                  #"乘以", EquityTA$履約價[i],
                  #"等於", (EquityTA$開盤價[i] - EquityTA$收盤價[i])*EquityTA$履約價[i], "元"))
    }    
  }else{
    #NOPE
  }
}

#放空狀況
print("放空狀況")
for (i in 1:nrow(EquityTA)) {
  if (EquityTA$買賣權[i] == "買權"){
    print("買權sit.")
    if ((-EquityTA$收盤價[i] + EquityTA$開盤價[i])*EquityTA$履約價[i] > 0){
      print(paste("選擇權有辦法賺錢，買權：", 
                  EquityTA$開盤價[i], "減", EquityTA$收盤價[i],
                  "乘以", EquityTA$履約價[i],
                  "等於", (-EquityTA$收盤價[i] + EquityTA$開盤價[i])*EquityTA$履約價[i], "元"))
    }else{
      print(paste("選擇權沒有辦法賺錢，買權：",
                  EquityTA$開盤價[i], "減", EquityTA$收盤價[i], 
                  "乘以", EquityTA$履約價[i],
                  "等於", (-EquityTA$收盤價[i] + EquityTA$開盤價[i])*EquityTA$履約價[i], "元"))
    }    
  }else{
    #NOPE
  }
  ################################################################
  if (EquityTA$買賣權[i] == "賣權"){
    print("賣權sit.")
    if ((-EquityTA$開盤價[i] + EquityTA$收盤價[i])*EquityTA$履約價[i] > 0){
      print(paste("選擇權有辦法賺錢，賣權：", 
                  EquityTA$收盤價[i], "減", EquityTA$開盤價[i], 
                  "乘以", EquityTA$履約價[i],
                  "等於", (-EquityTA$開盤價[i] + EquityTA$收盤價[i]), "元"))
    }else{
      print(paste("選擇權沒有辦法賺錢，賣權：", 
                  EquityTA$收盤價[i], "減", EquityTA$開盤價[i], 
                  "乘以", EquityTA$履約價[i],
                  "等於", (-EquityTA$開盤價[i] + EquityTA$收盤價[i])*EquityTA$履約價[i], "元"))
    }    
  }else{
    #NOPE
  }
}

