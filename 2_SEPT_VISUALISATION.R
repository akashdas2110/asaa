library("ggplot2")
head(diamonds, n= 10)
n = nrow(diamonds)
set.seed(100)
id = sample(1:n, size = 5000, replace = FALSE)
small = diamonds[id,]
qplot(carat,price,data=small)

summary(small)
n
plot(NULL,xlim=c(0,3),ylim=c(0,20000),xlab="carat",ylab="price")           ##xlim stands for limit of x axis
grid(col="grey",lty=2,lwd=2)  ###lty=line type,lwd=line width
points(small$carat,small$price,pch=20)   ##pch=symbol,different for pch=10 or 8

#############################creating the same layered graph using ggplot()#######################
## "+" sign for adding layers
##plot=data+aesthetics+geometry

ggplot(small,aes(carat,price))+geom_point()
##alt##
#ggplot(small)+aes(carat,price)+geom_point()

ggplot(small,aes(carat,price))+geom_line()   ###its not meaningful here

ggplot(small,aes(carat,price,colour=factor(cut)))+geom_point()    ##this making sense
ggplot(small,aes(carat,price,colour=factor(cut),shape = factor(color)))+geom_point()   ## doesn't make sense , its consist too many info in a single graph

ggplot(small,aes(carat,price,colour=factor(color),shape = factor(cut)))+geom_point()   ###this graph is better ??(why)

ggplot(small,aes(log(carat),log(price),colour=factor(color),shape = factor(cut)))+geom_point()


ggplot(small,aes(log(carat),log(price)))+geom_point()+geom_smooth()   ## geom_smooth() to fit a smooth curve





