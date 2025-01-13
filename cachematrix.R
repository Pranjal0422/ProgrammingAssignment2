## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

  inv <- NULL  # Initialize the inverse to NULL
set <- function(y){
  x <<- y
  inv <<- NULL  # Reset the cached inverse when the matrix is updated
}
get <- function()x #function to get matrix x
setInverse <- function(inverse) inv <<- inverse
getInverse <- function() inv 
  

list(set = set,get = get,
     setInverse = setInverse,
     getInverse = getInverse)
} # returns the list of above function


## Write a short comment describing this function
# This function computes the inverse of the special "matrix" returned by makeCacheMatrix.
cacheSolve <- function(x, ...) {
  inv <- x$getInverse() # Check if the inverse is already cached
  
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)} #If the inverse is already cached, return it
 
  # Otherwise, compute the inverse 
  mat <- x$get()
  inv <- solve(mat,...)
  x$setInverse(inv)
  inv
}  # Return the computed inverse
