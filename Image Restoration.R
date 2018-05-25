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

p <- 0.2
set.seed(12345)
N <- dim(X.ori)[1]
Y <- X.ori
Y1 <- Y[2:(N-1),2:(N-1)]
i1 <- which(runif(((N-2)^2)) < p)
Y1[i1] <- 3-Y1[i1]
Y[2:(N-1),2:(N-1)] <- Y1

image(Y, axes=FALSE, frame.plot=FALSE, col=grey(c(0, 0.8)))


alpha <- 0.03
beta <- 1
nmcmc <- 50
N <- 100
set.seed(12345)
X <- matrix(runif(N^2)<0.5,N)+1
for (k in (1:nmcmc)) {
  for (i in sample(2:(N-1))) {
    for (j in sample(2:(N-1))) {
      Vij <- c(X[i-1,j], X[i+1,j], X[i,j-1], X[i,j+1])
      u1 <-   beta*sum(Vij!=1) + alpha
      u2 <-   beta*sum(Vij!=2) 
      p1 <- 1/(1+exp(-u2+u1))
      r <- runif(1)
      if (r < p1)
        X[i,j] <- 1
      else 
        X[i,j] <- 2
    }
  }
}
image(X, axes=FALSE, frame.plot=FALSE, col = grey(c(0, 0.8)))