setwd("c:/mydocs/1new/work concluded/IFE Electoral Studies/ReplicaNexos")
rm(list = ls())

all <-read.csv("idealpoints.csv",  header=TRUE)
ife1 <- all[2:10,2:5]
ife2 <- all[12:20,2:5]
ife3 <- all[22:30,2:5]

names1 <- all[2:10,1]
names2 <- all[12:20,1]
names3 <- all[22:30,1]

row.names(ife1) <- names1
row.names(ife2) <- names2
row.names(ife3) <- names3

color1 <- c("yellow2","orange","yellow2","blue","blue","red","red","red","yellow2")
color2 <- c("yellow3","yellow3","orange","blue","red","blue","red","red","red")
color3 <- c("blue","blue","blue","red","red","red","red","blue","green3")

consejo <- c("Ugalde 2003-2006","Wold. II 2000-2003","Wold. I 1996-2000")

#estandariza medias sin sd
ife1[,2] <- (ife1[,2]-min(ife1[,2]))/(max(ife1[,2])-min(ife1[,2]))
ife2[,2] <- (ife2[,2]-min(ife2[,2]))/(max(ife2[,2])-min(ife2[,2]))
ife3[,2] <- (ife3[,2]-min(ife3[,2]))/(max(ife3[,2])-min(ife3[,2]))



oldpar <- par(no.readonly=TRUE)

par(mfrow=c(3,1)) #### Falta que recortar eje Y y la distancia entre las gr�ficas.

#IFE 1
object <- ife1[,2]
color  <- color1
names  <- names1
y     <- rep(-0.022,times=9)
plot(c(0,1),c(0,1),type="n",xlab=NA,ylab=NA,axes=F)
axis(1,at=c(0,1))
#abline(0,0,lty=2,col="gray")
points(object,y,pch=25,bg=color)
txt.obj <- object
txt.obj[4] <- .535; txt.obj[8] <- .815   #### Ajusta etiquetas para que no se traslapen
text(txt.obj,0.03,names,adj=c(0,0.35),srt=90)

#IFE 2
object <- ife2[,2]
color  <- color2
names  <- names2
y     <- rep(-0.022,times=9)
plot(c(0,1),c(0,1),type="n",xlab=NA,ylab=NA,axes=F)
axis(1,at=c(0,1))
points(object,y,pch=25,bg=color)
txt.obj <- object
txt.obj[8] <- .965; txt.obj[7] <- .93; txt.obj[6] <- .895; txt.obj[5] <- .86;
text(txt.obj,0.03,names,adj=c(0,0.35),srt=90)
lines(c(txt.obj[5],object[5]),c(0.02,-0.01))
lines(c(txt.obj[6],object[6]),c(0.02,-0.01))
lines(c(txt.obj[7],object[7]),c(0.02,-0.01))
lines(c(txt.obj[8],object[8]),c(0.02,-0.01))
lines(c(txt.obj[9],object[9]),c(0.02,-0.01))

#IFE 3
object <- ife3[,2]
color  <- color3
names  <- names3
y     <- rep(-0.022,times=9)
plot(c(0,1),c(0,1),type="n",xlab=NA,ylab=NA,axes=F)
axis(1,at=c(0,1))
points(object,y,pch=25,bg=color)
text(object,0.03,names,adj=c(0,0.35),srt=90)

par(oldpar)



####3 en 1
y1     <- rep(3.04,times=9)
y2     <- rep(2.04,times=9)
y3     <- rep(1.04,times=9)
plot(c(0,1),c(1,3.65),type="n",xlab="Perfil de votaci�n")
abline(1,0,lty=2,col="gray")
abline(2,0,lty=2,col="gray")
abline(3,0,lty=2,col="gray")
points(ife1[,2],y1,pch=20,col=color1)
points(ife2[,2],y2,pch=20,col=color2)
points(ife3[,2],y3,pch=20,col=color3)
points(ife1[,2],y1,pch=6)
points(ife2[,2],y2,pch=6)
points(ife3[,2],y3,pch=6)
text(ife1[,2],3.07,names1,adj=c(0,0.35),srt=90)
text(ife2[,2],2.07,names2,adj=c(0,0.35),srt=90)
text(ife3[,2],1.07,names3,adj=c(0,0.35),srt=90)



#DOTCHART
object <- ife1                         ## LO QUE SE VA A GRAFICAR
tt     <- c("Woldenberg I (1996-2000)")    ## T�TULO 
ys     <- 1:nrow(object)
tmp    <- c(rep(0,nrow(object)-1),1)
dotchart(object[,2],row.names(object), xlim = c(-1,2), pch=16, main=tt, col=c("yellow3","yellow3","orange","blue","red","red","red","blue","red"))
segments(object[,1],ys,object[,3],ys, col=c("yellow3","yellow3","orange","blue","red","red","red","blue","red"))
points(object[,2], ys)



#DOTCHART
object <- ife1                         
tt     <- c("Woldenberg I (1996-2000)")   ## T�TULO 
ys     <- 1:nrow(object)
tmp    <- c(rep(0,nrow(object)-1),1)
dotchart(object[,2],row.names(object), xlim = c(0,1), pch=16, main=tt, col=color1)
segments(object[,2]-object[,3],ys,object[,3]+object[,3],ys)

