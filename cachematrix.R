## Put comments here that give an overall description of what your
## functions do

## These functions would be used as part of a larger program typically
## where the function was being repeated for example when using an apply function.
## They would save time by caching the result of the function to an object 
## that can then be retrived for use later.

## Write a short comment describing this function

## This function is creating a vector containing a matrix and a list of functions
## that will get the reverse of the matrix

makeCacheMatrix <- function(x=matrix()) {
        ## making a square invertible matrix
        ## with a list of functions to:
        ## set the matirx
        ## get the matrix
        ## set the inverse
        ## get the inverse
        
        inv <- NULL
        set <- function(y) {
                ## <<- assigns a value to an object in its environment which is
                ## different to the current environment
                x<<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) inv<<-inverse
        getinv <- function() inv
        list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Write a short comment describing this function

## This function will calculate the inverse of the vector which happens 
## be a matrix but first it will check to see if it has already been calculated 
## and cached. If so it will use this instead of calculating the inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        inv <- x$getinv()
        if(!is.null(inv)){
                message("Getting cached data...")
                return(inv)
        }
        matrix <- x$get()
        inv <- solve(matrix, ...)
        
        x$setinv(inv)
        
        return(inv)
}
