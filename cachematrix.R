### Caching the Inverse of a Matrix

# Matrix inversion is usually a costly computation and there may be some
# benefit to caching the inverse of a matrix rather than computing it
# repeatedly (there are also alternatives to matrix inversion that we will
# not discuss here). Your assignment is to write a pair of functions that
# cache the inverse of a matrix.
# 
# Computing the inverse of a square matrix can be done with the `solve`
# function in R. For example, if `X` is a square invertible matrix, then
# `solve(X)` returns its inverse.
# 
# For this assignment, assume that the matrix supplied is always
# invertible.

# makeCacheMatrix: This function creates a special "matrix" object
# that can cache its inverse.
#
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(z) m <<- z
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}

# cacheSolve: This function computes the inverse of the special
# "matrix" returned by `makeCacheMatrix` above. If the inverse has
# already been calculated (and the matrix has not changed), then
# `cacheSolve` should retrieve the inverse from the cache.
# 
cacheSolve <- function(x, ...) {
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        ## Return a matrix that is the inverse of 'x'
        m
}
