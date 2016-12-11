x <- c("ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap")
install.packages(X)
lapply(x, library, character.only = TRUE)   
lnd <- readOGR(dsn = "mexstates", layer = "mexstates")
head(lnd@data, n = 2)
plot(lnd)
lnd@data[lnd$POP_ADMIN > 8000000, ]
Sel <- lnd$POP_ADMIN < 8000000 & lnd$POP_ADMIN > 3000000
lnd@data[sel , c(4,8,11)]
gCentroid(lnd)
plot(GCentroid(lnd))
plot(lnd)
points(gCentroid(lnd), col = “blue”)
lnd@data[grep("Distrito", lnd$ADMIN_NAME), ]
df <- lnd[grep("Distrito", lnd$ADMIN_NAME), ]
plot(lnd)
points(gCentroid(df), col= "yellow")

nearDF <- gDistance(gCentroid(df), gCentroid(lnd, byid = TRUE), byid = TRUE) < 6
lnd@data[nearDF, 4]
nearStates <- lnd[c(nearDF), 4]
plot(lnd)
plot(nearStates, col = “blue”, add = TRUE)
