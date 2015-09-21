source('ProgrammingAssignment2/cachematrix.R')
arr = matrix(runif(25, min=0, max=100), 5, 5)
mcm = makeCacheMatrix(arr)
inv = cacheSolve(mcm)
ide = mcm$get()%*%inv
print(ide)