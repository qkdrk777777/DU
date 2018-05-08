
cont_duplicate<-function(b,colnum,input,text,t=NULL,j=0){
  while(j!=(nrow(b))){
    j=j+1
    if(j==1){if(b[j,colnum]==b[j+1,colnum])if(
      b[j,colnum]==text)t=c(t,j)}else if(j==nrow(b)){
        if(b[j,colnum]==b[j-1,colnum])if(b[j,colnum]==text)t=c(t,j)}else if(
          (b[j,colnum]==b[j-1,colnum])|b[j,colnum]==b[j+1,colnum])if(b[j,colnum]==text)t=c(t,j)
  }
  b[t,colnum]<-input
  return(b)
}

