## This function contains a pair of functions that compute the inverse of a square matrix.
## This function creates a special "matrix" that can cache it's inverse.

## This function generates a matrix and the inverse of the matrix.

makeCacheMatrix <- function(x = matrix(),...) {
  I = NULL
  set <- function(y){
    I <<-  NULL
    x <<- y
  }
  get <- function() x
  setinverse <- function(solve) I <<- solve
  getinverse <- function() I
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



## This function checks to see if mean has been calculated.
## If,so, gets the mean from the cache and skips the computation

cacheSolve <- function(x, ...) {
  I <- x$getinverse()
  if (!is.null(I)){
    message("the inverse already exist wait to get cached data")
    return(I)
  }
  dat <- x$get()
  I <- solve(dat, ...)
  x$setinverse(I)
  I
}
