makeCacheMatrix <- function(x = matrix()) { ## define the argument with default mode of "matrix"
  inv <- NULL
  set <- function(y) {##define the set function to assign new 
    x <<- y
    inv <<- NULL ## if there is a new matrix, reset inv to NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv 
  list(set=set, get=get, setinverse=setinverse,getinverse=getinverse)
  }
  cacheSolve <- function(x, ...) { ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
      message("getting cached data")
      return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}