## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { ## define the argument with default mode of "matrix"
        inv <- NULL                           ## initialize inv as NULL which will hold value of matrix inverse
        set <- funtion(y) {                   ## define the set function to assign new
                x <<- y                       ## value of matrix in parent environment
                inv <<- NULL                  ## if there is a new matrix, reset inv to NULL
        }
        get <- funtion() x                    ## define the get fucntion - returns value of the matrix argument
        
        setinverse <- function(inverse) inv <<- inverse  ## assigns value of inv in parent environment
        getinverse <- funtion() inv                      ## gets the value of inv where called
        list(set = set, get = get,
             setinverse = setinverse,         ## return the list to refer to the
             getinverse = getinverse)         ## functions with the $ operator
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
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