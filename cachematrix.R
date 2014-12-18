## First function creates a list of functions that can be called.
## Second function checks cache for inverse of the set matrix.  Calls it if found, else it calculates the matrix inverse.
##


## List of functions to call.  Comments in function

makeCacheMatrix <- function(x = matrix()) { ##create a null matrix
    ## Nullify the inverse
    m <- NULL
    ## Assigns matrix to value input.  Nullify inverse
    set <- function(y) {
    x <<- y
    m <<- NULL
  }
    ##return data
  get <- function() x
  
  ##store inverse in cache from new calculation or overwrite if existing
  setinverse <- function(inverse) m <<- inverse
  
  ##return inverse data
  getinverse <- function() m
  
  ##create a list of functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Checks for result in cache, if availbe display else calculate.  Comments in function

cacheSolve <- function(x, ...) {
    ##get inverse of matrix
m <- x$getinverse()

## if value is in cache return it
if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }

## if not in cache, get matrix and solve inverse.  Sets result to cache
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  message("no value found in cache")
  m
}


