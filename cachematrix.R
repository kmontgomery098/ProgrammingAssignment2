## This piece of code is a smaller part of a bigger calculation. It prevents a calculation from being made repeatedly when the matrix has not been changed. 

## this function creates a special "matrix" that can cache its inverse, 
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set<- function(y){
    if(is.matrix(x)==FALSE){
      error("this ain't a matrix")
    }#input validation 
    x<<-y
    m<<-NULL
  } #set changes matrix stored in the main function 
  get<- function() {
    x  
  } #get returns the matrix x stored in the main function
  setinv<-function(inv){
    m<<-inv
  } #setinv stores the value of input at m
  getinv<-function(){
    m
  } #getinv returns variable m
  
  if(is.matrix(x)==FALSE){
    error("this ain't a matrix")
    }#input validation 
  
  list(set=set,get=get,setinv=setinv,getinv=getinv)
}

## Input is the object of makeCacheMatrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <-x$getinv()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }#if inv is cached, do not run code 
  data<-x$get() #must call get function because input of cacheSolve is from makeCacheMatrix list
  m<-solve(data) #solve(x) returns inverse of matrix stored in makeCacheMatrix
  x$setinv(m)
  m
}
