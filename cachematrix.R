##
## 'makeCacheMatrix'
##
##    This is a constructor function that takes a matrix as an argument, caches  
##    it within the function scope and returns a list of functions which allow
##    the getting and setting of both the cached matrix and it's inverse.
##
## 'cacheSolve'
##
##    This function take an instance of a 'makeCacheMatrix' as an argument and
##    returns the inverse (computed using the 'solve' function) of the matrix
##    cached within the 'makeCacheMatrix' instance. It uses the 'setinverse' 
##    function to cache the computed inverse in the 'makeCacheMatrix' instance.
## 

## This function returns a list of methods that act on an encapsulated matrix.

makeCacheMatrix <- function(normalMatrix = matrix()) {
    
    baseMatrix = normalMatrix
    cachedInverse = NULL
    
    set = function (y) {baseMatrix <<- y; cachedInverse <<- NULL}
    get = function() baseMatrix
    setInverse = function(inverse) cachedInverse <<- inverse
    getInverse = function() cachedInverse
    
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## This function returns the inverse of the 'makeCacheMatrix' provided as an argument. 

cacheSolve <- function(makeCacheMatrixInstance, ...) {
    
    if (is.null(makeCacheMatrixInstance$getInverse())) 
        makeCacheMatrixInstance$setInverse(solve(makeCacheMatrixInstance$get(), ...))
    
    makeCacheMatrixInstance$getInverse()
    
}