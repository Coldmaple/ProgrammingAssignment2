## Create a function that contain a list of four fucntions

## This function have setinverse, getinverse, set, get.

makeCacheMatrix<-function(x=matrix()){
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function()x
  setinverse<-function(inverse) m<<-inverse
  getinverse<-function()m
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}

## Use another function to call the first function
## so that we can calculate the inverse of a given matrix and save it in the cache

cacheSolve<-function(x,...){
  m<-x$getinverse()
  if(!is.null(m)){
    message("getting cache data")
    return(m)
  }
  data<-x$get()
  m<-solve(data,...)
  x$setinverse(m)
  m
}
