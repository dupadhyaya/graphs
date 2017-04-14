# Palette
n=seq(1:12)
barplot(n)

n=12
pie(rep(1,n), col=FALSE)

pie(rep(1,n), col=rainbow(n))

#If you would prefer something skewed to the reds and yellows, use heat.
pie(rep(1,n), col=heat.colors(n))

#If you prefer something in earth tones, use terrain.
pie(rep(1,n), col=terrain.colors(n))

#If you prefer these this type of palette, but with a bit more blue, try topo.
pie(rep(1,n), col=topo.colors(n))

#if you prefer subdued pinks and blues, try cm.
pie(rep(1,n), col=cm.colors(n))

barplot(seq(1:12), col=topo.colors(12))
help(package=colorspace)
