tablac<-matrix(c(155,34,14,186,89,10,66,31,10,37,42,4),3,4) #JI CUADRADA
colnames(tablac)<-c("31 a 59 min", "1 hora a 2 horas","1 a 30 min","3 horas o más")
rownames(tablac)<-c("CDMX","EDOMEX","Otro")
ji<-chisq.test(tablac)
ji
library(MASS)
ji.corresp<-corresp(tablac)
plot(c(ji.corresp$rscore),rep(0,3),xlim = c(-1.5,2))
plot(c(ji.corresp$cscore),rep(0,4),xlim = c(-1.5,2))
text(c(ji.corresp$rscore),rep(0,3),labels=rownames(tablac),col=10)
text(c(ji.corresp$cscore),rep(0,4),labels=colnames(tablac),col=1)
#Z PARA UNA PROPORCÓN
binom.test(78,325,.50,alternative=c("greater"))
