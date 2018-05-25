temp <- (matrix(1,nrow=3,ncol=3) %x% matrix(c(2,1,1,2),2))[1:5,1:5]
M1 <- temp %x% matrix(1,nrow=10,ncol=10)
M2 <- matrix(2,nrow=50, ncol=50)
M2[21:30,1:10] <- M2[21:30,41:50] <- 1
M2[11:40,11:20] <- M2[11:40,31:40] <- 1
M2[1:50,21:30] <- 1
M3 <- matrix(2,nrow=50, ncol=50)
M3[11:20,] <- M3[31:40,] <- 1
M3[1:10,21:30] <- M3[41:50,21:30] <- 1
M4 <- 3 - M2
X.ori <- cbind(rbind(M1,M4),rbind(M2,M3))

image(X.ori, axes=FALSE, frame.plot=FALSE, col = grey(c(0, 0.8)))