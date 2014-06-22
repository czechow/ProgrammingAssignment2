## Utility functions to cache matrix inversion results


## A wrapper around a matrix to deliver cache functionality
makeCachedMatrix <- function(x = matrix()) {

	## Cached result 
	invx <- NULL

	get <- function() x

	set <- function(m) { 
		x <<- m
		invx <<- NULL
	}
	
	getinv <- function() invx

	setinv <- function(inv) invx <<- inv


	# Interface to the outside world
	list(get = get, set = set, getinv = getinv, setinv = setinv)
}


## Solve with caching
## As a first argument pass an object returned by makeCacheMatrix function
## Other args will be passed to "solve" function

cacheSolve <- function(x, ...) {
	
	if ( is.null(x$getinv()) )
	{
		x$setinv(solve(x$get(), ...))
		print("Solving matrix")		# Info only ;-)
	}
	
	x$getinv()
}

