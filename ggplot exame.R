#ggplot learning script
#Naupaka Zimm
#Feb 21 2015

install.packages("ggplot2", dependencies = TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

head(iris)
iris[1:2,]
df <- melt(iris, id.vars = "species")

library("ggplot2")
library("reshape2")
library("ggthemes")
library("plyr")
library("MASS")
myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
myplot
summary(myplot) 
myplot + geom_point()
ggplot(data= iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + #set color for species
  geom_point(aes(shape = Species), size = 3) #set the size of mapping; it's a global setting, all layers will be the same size
#mapping shap (inside of aes())

d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]
dim(diamonds)
ggplot(data = d2, aes(x = carat, y = price, color = color)) + geom_point(aes(shape = color), size = 3)
d2

ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot() #factor(race), change numeric values and put them into catagoly
ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot(color = c("blue","green","red"))

ggplot(data= iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + #set color for species
  geom_point(aes(shape = Species), size = 3) + 
  facet_grid(Species ~ .)

ggplot(data= iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + #set color for species
  geom_point(aes(shape = Species), size = 3) +
  facet_grid(. ~ Species)

ggplot(data= iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + #set color for species
  geom_point(aes(shape = Species), size = 3) +
  facet_grid(~ Species) #lack of .; worked the same as the previous one

library(RColorBrewer)
display.brewer.all()

df <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) +
   geom_bar(stat = "identity", position = "dodge") +
  scale_fill_brewer(palette = "Set1")



