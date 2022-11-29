#3D graph
#https://www.programiz.com/r-programming/3d-plot
#function mainly takes in three variables, x, y and z where x and y are vectors defining the location along x- and y-axis. The height of the surface (z-axis) will be in the matrix z.

cone <- function(x, y){
  sqrt(x^2+y^2)
}

x <- y <- seq(-1, 1, length= 20)
z <- outer(x, y, cone)
#seq() to generate vector of equally spaced numbers.

#Then, we used the outer() function to apply the function cone at every combination of x and y.
persp(x, y, z)
persp(x, y, z,
      main="Perspective Plot of a Cone",
      zlab = "Height",
      theta = 30, phi = 15,
      col = "springgreen", shade = 0.5)
