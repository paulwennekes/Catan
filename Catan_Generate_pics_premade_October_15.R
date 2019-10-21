setwd("/Users/Paul/Desktop/R_Catan")
# install.packages("tidyverse")
# install.packages("formatR")
# install.packages("magrittr")
# install.packages("magick")
# install.packages("gifski")
library(gifski)
library(formatR)
library(tidyverse)
library(magrittr)
library(magick)

################################################################################
################       Now, on to visualising the board!        ################
################################################################################

# Let's import some hexagons, taken from Ryan Schenk's photo stream under a creative commons share alike license (https://www.flickr.com/photos/ryanschenk/5167761311/)

grain_tile <- image_read("grain.png")
wood_tile <- image_read("wood.png")
ore_tile <- image_read("ore.png")
brick_tile <- image_read("brick.png")
sheep_tile <- image_read("sheep.png")
desert_tile <- image_read("desert.png")

grain_rotate <- image_rotate(grain_tile, 30)
wood_rotate <- image_rotate(wood_tile, 30)
ore_rotate <- image_rotate(ore_tile, 30)
brick_rotate <- image_rotate(brick_tile, 30)
sheep_rotate <- image_rotate(sheep_tile, 30)
desert_rotate <- image_rotate(desert_tile, 30)

image_write(grain_rotate, "/Users/Paul/Desktop/R_Catan/grain_rotate.png")
image_write(wood_rotate, "/Users/Paul/Desktop/R_Catan/wood_rotate.png")
image_write(ore_rotate, "/Users/Paul/Desktop/R_Catan/ore_rotate.png")
image_write(brick_rotate, "/Users/Paul/Desktop/R_Catan/brick_rotate.png")
image_write(sheep_rotate, "/Users/Paul/Desktop/R_Catan/sheep_rotate.png")
image_write(desert_rotate, "/Users/Paul/Desktop/R_Catan/desert_rotate.png")


grain_none <-
  image_fill(grain_rotate,
             color = "none",
             point = "+5+5",
             fuzz = 15)
wood_none <-
  image_fill(wood_rotate,
             color = "none",
             point = "+5+5",
             fuzz = 15)
ore_none <-
  image_fill(ore_rotate,
             color = "none",
             point = "+5+5",
             fuzz = 15)
brick_none <-
  image_fill(brick_rotate,
             color = "none",
             point = "+5+5",
             fuzz = 15)
sheep_none <-
  image_fill(sheep_rotate,
             color = "none",
             point = "+5+5",
             fuzz = 15)
desert_none <-
  image_fill(desert_rotate,
             color = "none",
             point = "+5+5",
             fuzz = 15)


image_write(grain_none, "/Users/Paul/Desktop/R_Catan/grain_none.png")
image_write(wood_none, "/Users/Paul/Desktop/R_Catan/wood_none.png")
image_write(ore_none, "/Users/Paul/Desktop/R_Catan/ore_none.png")
image_write(brick_none, "/Users/Paul/Desktop/R_Catan/brick_none.png")
image_write(sheep_none, "/Users/Paul/Desktop/R_Catan/sheep_none.png")
image_write(desert_none, "/Users/Paul/Desktop/R_Catan/desert_none.png")

grain <- image_trim(grain_none, fuzz = 6)
wood <- image_trim(wood_none, fuzz = 6)
ore <- image_trim(ore_none, fuzz = 6)
brick <- image_trim(brick_none, fuzz = 6)
sheep <- image_trim(sheep_none, fuzz = 6)
desert <- image_trim(desert_none, fuzz = 6)

image_write(grain, "/Users/Paul/Desktop/R_Catan/grain_tile.png")
image_write(wood, "/Users/Paul/Desktop/R_Catan/wood_tile.png")
image_write(ore, "/Users/Paul/Desktop/R_Catan/ore_tile.png")
image_write(brick, "/Users/Paul/Desktop/R_Catan/brick_tile.png")
image_write(sheep, "/Users/Paul/Desktop/R_Catan/sheep_tile.png")
image_write(desert, "/Users/Paul/Desktop/R_Catan/desert_tile.png")

# these images are now 1396 X 1610
# Let's make the number tiles 400?
# that means they start at +498+605

# Creating some number tiles I'm starting with two transparent .png images, a black circle of width and height 135, and a beige circle of width and height 125.
beige_circle <- image_read("beige_circle2.png")
beige_circle3 <-
  image_fill(beige_circle,
             color = "none",
             point = "+5+5",
             fuzz = 6)
beige_circle4 <- image_trim(beige_circle3, fuzz = 6)
beige2 <- image_resize(beige_circle4, "370x370")
black_circle <- image_read("beige_circle.png")
black_circle2 <-
  image_fill(black_circle,
             color = "black" ,
             point = "+1000+1000",
             fuzz = 6)
black_circle3 <-
  image_fill(black_circle2,
             color = "none",
             point = "+5+5",
             fuzz = 6)
black_circle4 <- image_trim(black_circle3, fuzz = 6)
black2 <- image_resize(black_circle4, "400x400")
beige3 <-
  image_extent(beige2, "385x385", gravity = "SouthEast", color = "none")
circle <- image_mosaic(c(black2, beige3))
image_write(circle, "/Users/Paul/Desktop/R_Catan/circle.png")

dotting <- image_scale(black2, "30")
dot1 <-
  image_extent(dotting, "40x40", gravity = "Center", color = "none")
dotting2 <- c(dot1, dot1)
dotting3 <- c(dot1, dot1, dot1)
dotting4 <- c(dot1, dot1, dot1, dot1)
dotting5 <- c(dot1, dot1, dot1, dot1, dot1)
dot2 <- image_append(dotting2)
dot3 <- image_append(dotting3)
dot4 <- image_append(dotting4)
dot5 <- image_append(dotting5)
dott1 <-
  image_extent(dot1, "400x300", gravity = "South", color = "none")
dott2 <-
  image_extent(dot2, "400x300", gravity = "South", color = "none")
dott3 <-
  image_extent(dot3, "400x300", gravity = "South", color = "none")
dott4 <-
  image_extent(dot4, "400x300", gravity = "South", color = "none")
dott5 <-
  image_extent(dot5, "400x300", gravity = "South", color = "none")
dott1a <-
  image_extent(dot1, "400x300", gravity = "South", color = "none")
dott2a <-
  image_extent(dot2, "400x300", gravity = "South", color = "none")
dott3a <-
  image_extent(dot3, "400x300", gravity = "South", color = "none")
dott4a <-
  image_extent(dot4, "400x300", gravity = "South", color = "none")
dott5a <-
  image_extent(dot5, "400x300", gravity = "South", color = "none")

numm1 <-
  image_fill(image_trim(image_mosaic(c(circle, dott1))),
             "none",
             point = "+2+2",
             fuzz = 20)
numm2 <-
  image_fill(image_trim(image_mosaic(c(circle, dott2))),
             "none",
             point = "+2+2",
             fuzz = 20)
numm3 <-
  image_fill(image_trim(image_mosaic(c(circle, dott3))),
             "none",
             point = "+2+2",
             fuzz = 20)
numm4 <-
  image_fill(image_trim(image_mosaic(c(circle, dott4))),
             "none",
             point = "+2+2",
             fuzz = 20)
numm5 <-
  image_fill(image_trim(image_mosaic(c(circle, dott5))),
             "none",
             point = "+2+2",
             fuzz = 20)
numm1a <-
  image_fill(image_trim(image_mosaic(c(circle, dott1a))),
             "none",
             point = "+2+2",
             fuzz = 20)
numm2a <-
  image_fill(image_trim(image_mosaic(c(circle, dott2a))),
             "none",
             point = "+2+2",
             fuzz = 20)
numm3a <-
  image_fill(image_trim(image_mosaic(c(circle, dott3a))),
             "none",
             point = "+2+2",
             fuzz = 20)
numm4a <-
  image_fill(image_trim(image_mosaic(c(circle, dott4a))),
             "none",
             point = "+2+2",
             fuzz = 20)
numm5a <-
  image_fill(image_trim(image_mosaic(c(circle, dott5a))),
             "none",
             point = "+2+2",
             fuzz = 20)

num2 <-
  image_extent(
    image_annotate(
      numm1,
      "2",
      gravity = "Center",
      location = "+0-40",
      degrees = 0,
      size = 200,
      weight = 400
    ),
    "898x1010",
    gravity = "SouthEast",
    color = "none"
  )
num12 <-
  image_extent(
    image_annotate(
      numm1a,
      "12",
      gravity = "Center",
      location = "+0-40",
      degrees = 0,
      size = 200,
      weight = 400
    ),
    "898x1010",
    gravity = "SouthEast",
    color = "none"
  )
num3 <-
  image_extent(
    image_annotate(
      numm2,
      "3",
      gravity = "Center",
      location = "+0-40",
      degrees = 0,
      size = 200,
      weight = 400
    ),
    "898x1010",
    gravity = "SouthEast",
    color = "none"
  )
num11 <-
  image_extent(
    image_annotate(
      numm2a,
      "11",
      gravity = "Center",
      location = "+0-40",
      degrees = 0,
      size = 200,
      weight = 400
    ),
    "898x1010",
    gravity = "SouthEast",
    color = "none"
  )
num4 <-
  image_extent(
    image_annotate(
      numm3,
      "4",
      gravity = "Center",
      location = "+0-40",
      degrees = 0,
      size = 200,
      weight = 400
    ),
    "898x1010",
    gravity = "SouthEast",
    color = "none"
  )
num10 <-
  image_extent(
    image_annotate(
      numm3a,
      "10",
      gravity = "Center",
      location = "+0-40",
      degrees = 0,
      size = 200,
      weight = 400
    ),
    "898x1010",
    gravity = "SouthEast",
    color = "none"
  )
num5 <-
  image_extent(
    image_annotate(
      numm4,
      "5",
      gravity = "Center",
      location = "+0-40",
      degrees = 0,
      size = 200,
      weight = 400
    ),
    "898x1010",
    gravity = "SouthEast",
    color = "none"
  )
num9 <-
  image_extent(
    image_annotate(
      numm4a,
      "9",
      gravity = "Center",
      location = "+0-40",
      degrees = 0,
      size = 200,
      weight = 400
    ),
    "898x1010",
    gravity = "SouthEast",
    color = "none"
  )
num6 <-
  image_extent(
    image_annotate(
      numm5,
      "6",
      gravity = "Center",
      location = "+0-40",
      degrees = 0,
      size = 200,
      weight = 400,
      color = "Red"
    ),
    "898x1010",
    gravity = "SouthEast",
    color = "none"
  )
num8 <-
  image_extent(
    image_annotate(
      numm5a,
      "8",
      gravity = "Center",
      location = "+0-40",
      degrees = 0,
      size = 200,
      weight = 400,
      color = "Red"
    ),
    "898x1010",
    gravity = "SouthEast",
    color = "none"
  )

num2 <- image_fill(num2, "none", "+5+5", fuzz = 5)
num2 <- image_fill(num2, "none", "+890+615", fuzz = 5)
num2 <- image_fill(num2, "none", "+515+1000", fuzz = 5)
num2 <- image_fill(num2, "none", "+890+1000", fuzz = 5)
num3 <- image_fill(num3, "none", "+5+5", fuzz = 5)
num3 <- image_fill(num3, "none", "+890+615", fuzz = 5)
num3 <- image_fill(num3, "none", "+515+1000", fuzz = 5)
num3 <- image_fill(num3, "none", "+890+1000", fuzz = 5)
num4 <- image_fill(num4, "none", "+5+5", fuzz = 5)
num4 <- image_fill(num4, "none", "+890+615", fuzz = 5)
num4 <- image_fill(num4, "none", "+515+1000", fuzz = 5)
num4 <- image_fill(num4, "none", "+890+1000", fuzz = 5)
num5 <- image_fill(num5, "none", "+5+5", fuzz = 5)
num5 <- image_fill(num5, "none", "+890+615", fuzz = 5)
num5 <- image_fill(num5, "none", "+515+1000", fuzz = 5)
num5 <- image_fill(num5, "none", "+890+1000", fuzz = 5)
num6 <- image_fill(num6, "none", "+5+5", fuzz = 5)
num6 <- image_fill(num6, "none", "+890+615", fuzz = 5)
num6 <- image_fill(num6, "none", "+515+1000", fuzz = 5)
num6 <- image_fill(num6, "none", "+890+1000", fuzz = 5)
num8 <- image_fill(num8, "none", "+5+5", fuzz = 5)
num8 <- image_fill(num8, "none", "+890+615", fuzz = 5)
num8 <- image_fill(num8, "none", "+515+1000", fuzz = 5)
num8 <- image_fill(num8, "none", "+890+1000", fuzz = 5)
num9 <- image_fill(num9, "none", "+5+5", fuzz = 5)
num9 <- image_fill(num9, "none", "+890+615", fuzz = 5)
num9 <- image_fill(num9, "none", "+515+1000", fuzz = 5)
num9 <- image_fill(num9, "none", "+890+1000", fuzz = 5)
num10 <- image_fill(num10, "none", "+5+5", fuzz = 5)
num10 <- image_fill(num10, "none", "+890+615", fuzz = 5)
num10 <- image_fill(num10, "none", "+515+1000", fuzz = 5)
num10 <- image_fill(num10, "none", "+890+1000", fuzz = 5)
num11 <- image_fill(num11, "none", "+5+5", fuzz = 5)
num11 <- image_fill(num11, "none", "+890+615", fuzz = 5)
num11 <- image_fill(num11, "none", "+515+1000", fuzz = 5)
num11 <- image_fill(num11, "none", "+890+1000", fuzz = 5)
num12 <- image_fill(num12, "none", "+5+5", fuzz = 5)
num12 <- image_fill(num12, "none", "+890+615", fuzz = 5)
num12 <- image_fill(num12, "none", "+515+1000", fuzz = 5)
num12 <- image_fill(num12, "none", "+890+1000", fuzz = 5)

image_write(num2, "/Users/Paul/Desktop/R_Catan/num2.png")
image_write(num3, "/Users/Paul/Desktop/R_Catan/num3.png")
image_write(num4, "/Users/Paul/Desktop/R_Catan/num4.png")
image_write(num5, "/Users/Paul/Desktop/R_Catan/num5.png")
image_write(num6, "/Users/Paul/Desktop/R_Catan/num6.png")
image_write(num8, "/Users/Paul/Desktop/R_Catan/num8.png")
image_write(num9, "/Users/Paul/Desktop/R_Catan/num9.png")
image_write(num10, "/Users/Paul/Desktop/R_Catan/num10.png")
image_write(num11, "/Users/Paul/Desktop/R_Catan/num11.png")
image_write(num12, "/Users/Paul/Desktop/R_Catan/num12.png")

brick2 <- image_mosaic(c(brick, num2))
brick3 <- image_mosaic(c(brick, num3))
brick4 <- image_mosaic(c(brick, num4))
brick5 <- image_mosaic(c(brick, num5))
brick6 <- image_mosaic(c(brick, num6))
brick8 <- image_mosaic(c(brick, num8))
brick9 <- image_mosaic(c(brick, num9))
brick10 <- image_mosaic(c(brick, num10))
brick11 <- image_mosaic(c(brick, num11))
brick12 <- image_mosaic(c(brick, num12))
grain2 <- image_mosaic(c(grain, num2))
grain3 <- image_mosaic(c(grain, num3))
grain4 <- image_mosaic(c(grain, num4))
grain5 <- image_mosaic(c(grain, num5))
grain6 <- image_mosaic(c(grain, num6))
grain8 <- image_mosaic(c(grain, num8))
grain9 <- image_mosaic(c(grain, num9))
grain10 <- image_mosaic(c(grain, num10))
grain11 <- image_mosaic(c(grain, num11))
grain12 <- image_mosaic(c(grain, num12))
ore2 <- image_mosaic(c(ore, num2))
ore3 <- image_mosaic(c(ore, num3))
ore4 <- image_mosaic(c(ore, num4))
ore5 <- image_mosaic(c(ore, num5))
ore6 <- image_mosaic(c(ore, num6))
ore8 <- image_mosaic(c(ore, num8))
ore9 <- image_mosaic(c(ore, num9))
ore10 <- image_mosaic(c(ore, num10))
ore11 <- image_mosaic(c(ore, num11))
ore12 <- image_mosaic(c(ore, num12))
sheep2 <- image_mosaic(c(sheep, num2))
sheep3 <- image_mosaic(c(sheep, num3))
sheep4 <- image_mosaic(c(sheep, num4))
sheep5 <- image_mosaic(c(sheep, num5))
sheep6 <- image_mosaic(c(sheep, num6))
sheep8 <- image_mosaic(c(sheep, num8))
sheep9 <- image_mosaic(c(sheep, num9))
sheep10 <- image_mosaic(c(sheep, num10))
sheep11 <- image_mosaic(c(sheep, num11))
sheep12 <- image_mosaic(c(sheep, num12))
wood2 <- image_mosaic(c(wood, num2))
wood3 <- image_mosaic(c(wood, num3))
wood4 <- image_mosaic(c(wood, num4))
wood5 <- image_mosaic(c(wood, num5))
wood6 <- image_mosaic(c(wood, num6))
wood8 <- image_mosaic(c(wood, num8))
wood9 <- image_mosaic(c(wood, num9))
wood10 <- image_mosaic(c(wood, num10))
wood11 <- image_mosaic(c(wood, num11))
wood12 <- image_mosaic(c(wood, num12))
desert0 <- desert

brick2 <- image_fill(brick2,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
brick3 <- image_fill(brick3,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
brick4 <- image_fill(brick4,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
brick5 <- image_fill(brick5,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
brick6 <- image_fill(brick6,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
brick8 <- image_fill(brick8,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
brick9 <- image_fill(brick9,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
brick10 <- image_fill(brick10,
                      color = "none",
                      point = "+5+5",
                      fuzz = 0)
brick11 <- image_fill(brick11,
                      color = "none",
                      point = "+5+5",
                      fuzz = 0)
brick12 <- image_fill(brick12,
                      color = "none",
                      point = "+5+5",
                      fuzz = 0)
grain2 <- image_fill(grain2,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
grain3 <- image_fill(grain3,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
grain4 <- image_fill(grain4,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
grain5 <- image_fill(grain5,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
grain6 <- image_fill(grain6,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
grain8 <- image_fill(grain8,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
grain9 <- image_fill(grain9,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
grain10 <- image_fill(grain10,
                      color = "none",
                      point = "+5+5",
                      fuzz = 0)
grain11 <- image_fill(grain11,
                      color = "none",
                      point = "+5+5",
                      fuzz = 0)
grain12 <- image_fill(grain12,
                      color = "none",
                      point = "+5+5",
                      fuzz = 0)
ore2 <- image_fill(ore2,
                   color = "none",
                   point = "+5+5",
                   fuzz = 0)
ore3 <- image_fill(ore3,
                   color = "none",
                   point = "+5+5",
                   fuzz = 0)
ore4 <- image_fill(ore4,
                   color = "none",
                   point = "+5+5",
                   fuzz = 0)
ore5 <- image_fill(ore5,
                   color = "none",
                   point = "+5+5",
                   fuzz = 0)
ore6 <- image_fill(ore6,
                   color = "none",
                   point = "+5+5",
                   fuzz = 0)
ore8 <- image_fill(ore8,
                   color = "none",
                   point = "+5+5",
                   fuzz = 0)
ore9 <- image_fill(ore9,
                   color = "none",
                   point = "+5+5",
                   fuzz = 0)
ore10 <- image_fill(ore10,
                    color = "none",
                    point = "+5+5",
                    fuzz = 0)
ore11 <- image_fill(ore11,
                    color = "none",
                    point = "+5+5",
                    fuzz = 0)
ore12 <- image_fill(ore12,
                    color = "none",
                    point = "+5+5",
                    fuzz = 0)
sheep2 <- image_fill(sheep2,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
sheep3 <- image_fill(sheep3,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
sheep4 <- image_fill(sheep4,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
sheep5 <- image_fill(sheep5,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
sheep6 <- image_fill(sheep6,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
sheep8 <- image_fill(sheep8,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
sheep9 <- image_fill(sheep9,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
sheep10 <- image_fill(sheep10,
                      color = "none",
                      point = "+5+5",
                      fuzz = 0)
sheep11 <- image_fill(sheep11,
                      color = "none",
                      point = "+5+5",
                      fuzz = 0)
sheep12 <- image_fill(sheep12,
                      color = "none",
                      point = "+5+5",
                      fuzz = 0)
wood2 <- image_fill(wood2,
                    color = "none",
                    point = "+5+5",
                    fuzz = 0)
wood3 <- image_fill(wood3,
                    color = "none",
                    point = "+5+5",
                    fuzz = 0)
wood4 <- image_fill(wood4,
                    color = "none",
                    point = "+5+5",
                    fuzz = 0)
wood5 <- image_fill(wood5,
                    color = "none",
                    point = "+5+5",
                    fuzz = 0)
wood6 <- image_fill(wood6,
                    color = "none",
                    point = "+5+5",
                    fuzz = 0)
wood8 <- image_fill(wood8,
                    color = "none",
                    point = "+5+5",
                    fuzz = 0)
wood9 <- image_fill(wood9,
                    color = "none",
                    point = "+5+5",
                    fuzz = 0)
wood10 <- image_fill(wood10,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
wood11 <- image_fill(wood11,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
wood12 <- image_fill(wood12,
                     color = "none",
                     point = "+5+5",
                     fuzz = 0)
desert0 <- image_fill(desert0,
                      color = "none",
                      point = "+5+5",
                      fuzz = 0)

brick2 <- image_fill(brick2,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
brick3 <- image_fill(brick3,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
brick4 <- image_fill(brick4,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
brick5 <- image_fill(brick5,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
brick6 <- image_fill(brick6,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
brick8 <- image_fill(brick8,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
brick9 <- image_fill(brick9,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
brick10 <- image_fill(brick10,
                      color = "none",
                      point = "+1380+5",
                      fuzz = 0)
brick11 <- image_fill(brick11,
                      color = "none",
                      point = "+1380+5",
                      fuzz = 0)
brick12 <- image_fill(brick12,
                      color = "none",
                      point = "+1380+5",
                      fuzz = 0)
grain2 <- image_fill(grain2,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
grain3 <- image_fill(grain3,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
grain4 <- image_fill(grain4,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
grain5 <- image_fill(grain5,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
grain6 <- image_fill(grain6,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
grain8 <- image_fill(grain8,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
grain9 <- image_fill(grain9,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
grain10 <- image_fill(grain10,
                      color = "none",
                      point = "+1380+5",
                      fuzz = 0)
grain11 <- image_fill(grain11,
                      color = "none",
                      point = "+1380+5",
                      fuzz = 0)
grain12 <- image_fill(grain12,
                      color = "none",
                      point = "+1380+5",
                      fuzz = 0)
ore2 <- image_fill(ore2,
                   color = "none",
                   point = "+1380+5",
                   fuzz = 0)
ore3 <- image_fill(ore3,
                   color = "none",
                   point = "+1380+5",
                   fuzz = 0)
ore4 <- image_fill(ore4,
                   color = "none",
                   point = "+1380+5",
                   fuzz = 0)
ore5 <- image_fill(ore5,
                   color = "none",
                   point = "+1380+5",
                   fuzz = 0)
ore6 <- image_fill(ore6,
                   color = "none",
                   point = "+1380+5",
                   fuzz = 0)
ore8 <- image_fill(ore8,
                   color = "none",
                   point = "+1380+5",
                   fuzz = 0)
ore9 <- image_fill(ore9,
                   color = "none",
                   point = "+1380+5",
                   fuzz = 0)
ore10 <- image_fill(ore10,
                    color = "none",
                    point = "+1380+5",
                    fuzz = 0)
ore11 <- image_fill(ore11,
                    color = "none",
                    point = "+1380+5",
                    fuzz = 0)
ore12 <- image_fill(ore12,
                    color = "none",
                    point = "+1380+5",
                    fuzz = 0)
sheep2 <- image_fill(sheep2,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
sheep3 <- image_fill(sheep3,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
sheep4 <- image_fill(sheep4,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
sheep5 <- image_fill(sheep5,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
sheep6 <- image_fill(sheep6,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
sheep8 <- image_fill(sheep8,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
sheep9 <- image_fill(sheep9,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
sheep10 <- image_fill(sheep10,
                      color = "none",
                      point = "+1380+5",
                      fuzz = 0)
sheep11 <- image_fill(sheep11,
                      color = "none",
                      point = "+1380+5",
                      fuzz = 0)
sheep12 <- image_fill(sheep12,
                      color = "none",
                      point = "+1380+5",
                      fuzz = 0)
wood2 <- image_fill(wood2,
                    color = "none",
                    point = "+1380+5",
                    fuzz = 0)
wood3 <- image_fill(wood3,
                    color = "none",
                    point = "+1380+5",
                    fuzz = 0)
wood4 <- image_fill(wood4,
                    color = "none",
                    point = "+1380+5",
                    fuzz = 0)
wood5 <- image_fill(wood5,
                    color = "none",
                    point = "+1380+5",
                    fuzz = 0)
wood6 <- image_fill(wood6,
                    color = "none",
                    point = "+1380+5",
                    fuzz = 0)
wood8 <- image_fill(wood8,
                    color = "none",
                    point = "+1380+5",
                    fuzz = 0)
wood9 <- image_fill(wood9,
                    color = "none",
                    point = "+1380+5",
                    fuzz = 0)
wood10 <- image_fill(wood10,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
wood11 <- image_fill(wood11,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
wood12 <- image_fill(wood12,
                     color = "none",
                     point = "+1380+5",
                     fuzz = 0)
desert0 <- image_fill(desert0,
                      color = "none",
                      point = "+1380+5",
                      fuzz = 0)

brick2 <- image_fill(brick2,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
brick3 <- image_fill(brick3,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
brick4 <- image_fill(brick4,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
brick5 <- image_fill(brick5,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
brick6 <- image_fill(brick6,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
brick8 <- image_fill(brick8,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
brick9 <- image_fill(brick9,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
brick10 <- image_fill(brick10,
                      color = "none",
                      point = "+1380+1600",
                      fuzz = 0)
brick11 <- image_fill(brick11,
                      color = "none",
                      point = "+1380+1600",
                      fuzz = 0)
brick12 <- image_fill(brick12,
                      color = "none",
                      point = "+1380+1600",
                      fuzz = 0)
grain2 <- image_fill(grain2,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
grain3 <- image_fill(grain3,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
grain4 <- image_fill(grain4,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
grain5 <- image_fill(grain5,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
grain6 <- image_fill(grain6,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
grain8 <- image_fill(grain8,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
grain9 <- image_fill(grain9,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
grain10 <- image_fill(grain10,
                      color = "none",
                      point = "+1380+1600",
                      fuzz = 0)
grain11 <- image_fill(grain11,
                      color = "none",
                      point = "+1380+1600",
                      fuzz = 0)
grain12 <- image_fill(grain12,
                      color = "none",
                      point = "+1380+1600",
                      fuzz = 0)
ore2 <- image_fill(ore2,
                   color = "none",
                   point = "+1380+1600",
                   fuzz = 0)
ore3 <- image_fill(ore3,
                   color = "none",
                   point = "+1380+1600",
                   fuzz = 0)
ore4 <- image_fill(ore4,
                   color = "none",
                   point = "+1380+1600",
                   fuzz = 0)
ore5 <- image_fill(ore5,
                   color = "none",
                   point = "+1380+1600",
                   fuzz = 0)
ore6 <- image_fill(ore6,
                   color = "none",
                   point = "+1380+1600",
                   fuzz = 0)
ore8 <- image_fill(ore8,
                   color = "none",
                   point = "+1380+1600",
                   fuzz = 0)
ore9 <- image_fill(ore9,
                   color = "none",
                   point = "+1380+1600",
                   fuzz = 0)
ore10 <- image_fill(ore10,
                    color = "none",
                    point = "+1380+1600",
                    fuzz = 0)
ore11 <- image_fill(ore11,
                    color = "none",
                    point = "+1380+1600",
                    fuzz = 0)
ore12 <- image_fill(ore12,
                    color = "none",
                    point = "+1380+1600",
                    fuzz = 0)
sheep2 <- image_fill(sheep2,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
sheep3 <- image_fill(sheep3,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
sheep4 <- image_fill(sheep4,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
sheep5 <- image_fill(sheep5,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
sheep6 <- image_fill(sheep6,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
sheep8 <- image_fill(sheep8,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
sheep9 <- image_fill(sheep9,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
sheep10 <- image_fill(sheep10,
                      color = "none",
                      point = "+1380+1600",
                      fuzz = 0)
sheep11 <- image_fill(sheep11,
                      color = "none",
                      point = "+1380+1600",
                      fuzz = 0)
sheep12 <- image_fill(sheep12,
                      color = "none",
                      point = "+1380+1600",
                      fuzz = 0)
wood2 <- image_fill(wood2,
                    color = "none",
                    point = "+1380+1600",
                    fuzz = 0)
wood3 <- image_fill(wood3,
                    color = "none",
                    point = "+1380+1600",
                    fuzz = 0)
wood4 <- image_fill(wood4,
                    color = "none",
                    point = "+1380+1600",
                    fuzz = 0)
wood5 <- image_fill(wood5,
                    color = "none",
                    point = "+1380+1600",
                    fuzz = 0)
wood6 <- image_fill(wood6,
                    color = "none",
                    point = "+1380+1600",
                    fuzz = 0)
wood8 <- image_fill(wood8,
                    color = "none",
                    point = "+1380+1600",
                    fuzz = 0)
wood9 <- image_fill(wood9,
                    color = "none",
                    point = "+1380+1600",
                    fuzz = 0)
wood10 <- image_fill(wood10,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
wood11 <- image_fill(wood11,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
wood12 <- image_fill(wood12,
                     color = "none",
                     point = "+1380+1600",
                     fuzz = 0)
desert0 <- image_fill(desert0,
                      color = "none",
                      point = "+1380+1600",
                      fuzz = 0)

brick2 <- image_fill(brick2,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
brick3 <- image_fill(brick3,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
brick4 <- image_fill(brick4,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
brick5 <- image_fill(brick5,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
brick6 <- image_fill(brick6,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
brick8 <- image_fill(brick8,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
brick9 <- image_fill(brick9,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
brick10 <- image_fill(brick10,
                      color = "none",
                      point = "+5+1600",
                      fuzz = 0)
brick11 <- image_fill(brick11,
                      color = "none",
                      point = "+5+1600",
                      fuzz = 0)
brick12 <- image_fill(brick12,
                      color = "none",
                      point = "+5+1600",
                      fuzz = 0)
grain2 <- image_fill(grain2,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
grain3 <- image_fill(grain3,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
grain4 <- image_fill(grain4,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
grain5 <- image_fill(grain5,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
grain6 <- image_fill(grain6,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
grain8 <- image_fill(grain8,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
grain9 <- image_fill(grain9,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
grain10 <- image_fill(grain10,
                      color = "none",
                      point = "+5+1600",
                      fuzz = 0)
grain11 <- image_fill(grain11,
                      color = "none",
                      point = "+5+1600",
                      fuzz = 0)
grain12 <- image_fill(grain12,
                      color = "none",
                      point = "+5+1600",
                      fuzz = 0)
ore2 <- image_fill(ore2,
                   color = "none",
                   point = "+5+1600",
                   fuzz = 0)
ore3 <- image_fill(ore3,
                   color = "none",
                   point = "+5+1600",
                   fuzz = 0)
ore4 <- image_fill(ore4,
                   color = "none",
                   point = "+5+1600",
                   fuzz = 0)
ore5 <- image_fill(ore5,
                   color = "none",
                   point = "+5+1600",
                   fuzz = 0)
ore6 <- image_fill(ore6,
                   color = "none",
                   point = "+5+1600",
                   fuzz = 0)
ore8 <- image_fill(ore8,
                   color = "none",
                   point = "+5+1600",
                   fuzz = 0)
ore9 <- image_fill(ore9,
                   color = "none",
                   point = "+5+1600",
                   fuzz = 0)
ore10 <- image_fill(ore10,
                    color = "none",
                    point = "+5+1600",
                    fuzz = 0)
ore11 <- image_fill(ore11,
                    color = "none",
                    point = "+5+1600",
                    fuzz = 0)
ore12 <- image_fill(ore12,
                    color = "none",
                    point = "+5+1600",
                    fuzz = 0)
sheep2 <- image_fill(sheep2,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
sheep3 <- image_fill(sheep3,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
sheep4 <- image_fill(sheep4,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
sheep5 <- image_fill(sheep5,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
sheep6 <- image_fill(sheep6,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
sheep8 <- image_fill(sheep8,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
sheep9 <- image_fill(sheep9,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
sheep10 <- image_fill(sheep10,
                      color = "none",
                      point = "+5+1600",
                      fuzz = 0)
sheep11 <- image_fill(sheep11,
                      color = "none",
                      point = "+5+1600",
                      fuzz = 0)
sheep12 <- image_fill(sheep12,
                      color = "none",
                      point = "+5+1600",
                      fuzz = 0)
wood2 <- image_fill(wood2,
                    color = "none",
                    point = "+5+1600",
                    fuzz = 0)
wood3 <- image_fill(wood3,
                    color = "none",
                    point = "+5+1600",
                    fuzz = 0)
wood4 <- image_fill(wood4,
                    color = "none",
                    point = "+5+1600",
                    fuzz = 0)
wood5 <- image_fill(wood5,
                    color = "none",
                    point = "+5+1600",
                    fuzz = 0)
wood6 <- image_fill(wood6,
                    color = "none",
                    point = "+5+1600",
                    fuzz = 0)
wood8 <- image_fill(wood8,
                    color = "none",
                    point = "+5+1600",
                    fuzz = 0)
wood9 <- image_fill(wood9,
                    color = "none",
                    point = "+5+1600",
                    fuzz = 0)
wood10 <- image_fill(wood10,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
wood11 <- image_fill(wood11,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
wood12 <- image_fill(wood12,
                     color = "none",
                     point = "+5+1600",
                     fuzz = 0)
desert0 <- image_fill(desert0,
                      color = "none",
                      point = "+5+1600",
                      fuzz = 0)



bricknums <-
  list(
    brick,
    brick2,
    brick3,
    brick4,
    brick5,
    brick6,
    brick,
    brick8,
    brick9,
    brick10 ,
    brick11,
    brick12
  )
grainnums <-
  list(
    grain,
    grain2,
    grain3,
    grain4,
    grain5,
    grain6,
    grain,
    grain8,
    grain9,
    grain10 ,
    grain11,
    grain12
  )
orenums <-
  list(ore,
       ore2,
       ore3,
       ore4,
       ore5,
       ore6,
       ore,
       ore8,
       ore9,
       ore10,
       ore11,
       ore12)
sheepnums <-
  list(
    sheep,
    sheep2,
    sheep3,
    sheep4,
    sheep5,
    sheep6,
    sheep,
    sheep8,
    sheep9,
    sheep10,
    sheep11,
    sheep12
  )
woodnums <-
  list(wood,
       wood2,
       wood3,
       wood4,
       wood5,
       wood6,
       wood,
       wood8,
       wood9,
       wood10,
       wood11,
       wood12)
desertnums <-
  list(
    desert0,
    desert0,
    desert0,
    desert0,
    desert0,
    desert0,
    desert0,
    desert0,
    desert0,
    desert0,
    desert0,
    desert0
  )

image_write(brick2, "/Users/Paul/Desktop/R_Catan/brick2_big.png")
image_write(brick3, "/Users/Paul/Desktop/R_Catan/brick3_big.png")
image_write(brick4, "/Users/Paul/Desktop/R_Catan/brick4_big.png")
image_write(brick5, "/Users/Paul/Desktop/R_Catan/brick5_big.png")
image_write(brick6, "/Users/Paul/Desktop/R_Catan/brick6_big.png")
image_write(brick8, "/Users/Paul/Desktop/R_Catan/brick8_big.png")
image_write(brick9, "/Users/Paul/Desktop/R_Catan/brick9_big.png")
image_write(brick10, "/Users/Paul/Desktop/R_Catan/brick10_big.png")
image_write(brick11, "/Users/Paul/Desktop/R_Catan/brick11_big.png")
image_write(brick12, "/Users/Paul/Desktop/R_Catan/brick12_big.png")
image_write(grain2, "/Users/Paul/Desktop/R_Catan/grain2_big.png")
image_write(grain3, "/Users/Paul/Desktop/R_Catan/grain3_big.png")
image_write(grain4, "/Users/Paul/Desktop/R_Catan/grain4_big.png")
image_write(grain5, "/Users/Paul/Desktop/R_Catan/grain5_big.png")
image_write(grain6, "/Users/Paul/Desktop/R_Catan/grain6_big.png")
image_write(grain8, "/Users/Paul/Desktop/R_Catan/grain8_big.png")
image_write(grain9, "/Users/Paul/Desktop/R_Catan/grain9_big.png")
image_write(grain10, "/Users/Paul/Desktop/R_Catan/grain10_big.png")
image_write(grain11, "/Users/Paul/Desktop/R_Catan/grain11_big.png")
image_write(grain12, "/Users/Paul/Desktop/R_Catan/grain12_big.png")
image_write(ore2, "/Users/Paul/Desktop/R_Catan/ore2_big.png")
image_write(ore3, "/Users/Paul/Desktop/R_Catan/ore3_big.png")
image_write(ore4, "/Users/Paul/Desktop/R_Catan/ore4_big.png")
image_write(ore5, "/Users/Paul/Desktop/R_Catan/ore5_big.png")
image_write(ore6, "/Users/Paul/Desktop/R_Catan/ore6_big.png")
image_write(ore8, "/Users/Paul/Desktop/R_Catan/ore8_big.png")
image_write(ore9, "/Users/Paul/Desktop/R_Catan/ore9_big.png")
image_write(ore10, "/Users/Paul/Desktop/R_Catan/ore10_big.png")
image_write(ore11, "/Users/Paul/Desktop/R_Catan/ore11_big.png")
image_write(ore12, "/Users/Paul/Desktop/R_Catan/ore12_big.png")
image_write(sheep2, "/Users/Paul/Desktop/R_Catan/sheep2_big.png")
image_write(sheep3, "/Users/Paul/Desktop/R_Catan/sheep3_big.png")
image_write(sheep4, "/Users/Paul/Desktop/R_Catan/sheep4_big.png")
image_write(sheep5, "/Users/Paul/Desktop/R_Catan/sheep5_big.png")
image_write(sheep6, "/Users/Paul/Desktop/R_Catan/sheep6_big.png")
image_write(sheep8, "/Users/Paul/Desktop/R_Catan/sheep8_big.png")
image_write(sheep9, "/Users/Paul/Desktop/R_Catan/sheep9_big.png")
image_write(sheep10, "/Users/Paul/Desktop/R_Catan/sheep10_big.png")
image_write(sheep11, "/Users/Paul/Desktop/R_Catan/sheep11_big.png")
image_write(sheep12, "/Users/Paul/Desktop/R_Catan/sheep12_big.png")
image_write(wood2, "/Users/Paul/Desktop/R_Catan/wood2_big.png")
image_write(wood3, "/Users/Paul/Desktop/R_Catan/wood3_big.png")
image_write(wood4, "/Users/Paul/Desktop/R_Catan/wood4_big.png")
image_write(wood5, "/Users/Paul/Desktop/R_Catan/wood5_big.png")
image_write(wood6, "/Users/Paul/Desktop/R_Catan/wood6_big.png")
image_write(wood8, "/Users/Paul/Desktop/R_Catan/wood8_big.png")
image_write(wood9, "/Users/Paul/Desktop/R_Catan/wood9_big.png")
image_write(wood10, "/Users/Paul/Desktop/R_Catan/wood10_big.png")
image_write(wood11, "/Users/Paul/Desktop/R_Catan/wood11_big.png")
image_write(wood12, "/Users/Paul/Desktop/R_Catan/wood12_big.png")
image_write(desert0, "/Users/Paul/Desktop/R_Catan/desert0_big.png")

terrainnums <-
  tibble(bricknums, grainnums, orenums, sheepnums, woodnums, desertnums)

#### making a board
# To make things easier, we'll save the width and height of the tiles. Hexagons are basically 6 equilateral triangles, so we can define the length of the side of a hexagon as 0.5 * tile height. The vertical offset is ona and a half of that.

brick2 <- image_scale(brick2, 400)
brick3 <- image_scale(brick3, 400)
brick4 <- image_scale(brick4, 400)
brick5 <- image_scale(brick5, 400)
brick6 <- image_scale(brick6, 400)
brick8 <- image_scale(brick8, 400)
brick9 <- image_scale(brick9, 400)
brick10 <- image_scale(brick10, 400)
brick11 <- image_scale(brick11, 400)
brick12 <- image_scale(brick12, 400)
grain2 <- image_scale(grain2, 400)
grain3 <- image_scale(grain3, 400)
grain4 <- image_scale(grain4, 400)
grain5 <- image_scale(grain5, 400)
grain6 <- image_scale(grain6, 400)
grain8 <- image_scale(grain8, 400)
grain9 <- image_scale(grain9, 400)
grain10 <- image_scale(grain10, 400)
grain11 <- image_scale(grain11, 400)
grain12 <- image_scale(grain12, 400)
ore2 <- image_scale(ore2, 400)
ore3 <- image_scale(ore3, 400)
ore4 <- image_scale(ore4, 400)
ore5 <- image_scale(ore5, 400)
ore6 <- image_scale(ore6, 400)
ore8 <- image_scale(ore8, 400)
ore9 <- image_scale(ore9, 400)
ore10 <- image_scale(ore10, 400)
ore11 <- image_scale(ore11, 400)
ore12 <- image_scale(ore12, 400)
sheep2 <- image_scale(sheep2, 400)
sheep3 <- image_scale(sheep3, 400)
sheep4 <- image_scale(sheep4, 400)
sheep5 <- image_scale(sheep5, 400)
sheep6 <- image_scale(sheep6, 400)
sheep8 <- image_scale(sheep8, 400)
sheep9 <- image_scale(sheep9, 400)
sheep10 <- image_scale(sheep10, 400)
sheep11 <- image_scale(sheep11, 400)
sheep12 <- image_scale(sheep12, 400)
wood2 <- image_scale(wood2, 400)
wood3 <- image_scale(wood3, 400)
wood4 <- image_scale(wood4, 400)
wood5 <- image_scale(wood5, 400)
wood6 <- image_scale(wood6, 400)
wood8 <- image_scale(wood8, 400)
wood9 <- image_scale(wood9, 400)
wood10 <- image_scale(wood10, 400)
wood11 <- image_scale(wood11, 400)
wood12 <- image_scale(wood12, 400)
desert0 <- image_scale(desert0, 400)

image_write(brick2, "/Users/Paul/Desktop/R_Catan/brick2.png")
image_write(brick3, "/Users/Paul/Desktop/R_Catan/brick3.png")
image_write(brick4, "/Users/Paul/Desktop/R_Catan/brick4.png")
image_write(brick5, "/Users/Paul/Desktop/R_Catan/brick5.png")
image_write(brick6, "/Users/Paul/Desktop/R_Catan/brick6.png")
image_write(brick8, "/Users/Paul/Desktop/R_Catan/brick8.png")
image_write(brick9, "/Users/Paul/Desktop/R_Catan/brick9.png")
image_write(brick10, "/Users/Paul/Desktop/R_Catan/brick10.png")
image_write(brick11, "/Users/Paul/Desktop/R_Catan/brick11.png")
image_write(brick12, "/Users/Paul/Desktop/R_Catan/brick12.png")
image_write(grain2, "/Users/Paul/Desktop/R_Catan/grain2.png")
image_write(grain3, "/Users/Paul/Desktop/R_Catan/grain3.png")
image_write(grain4, "/Users/Paul/Desktop/R_Catan/grain4.png")
image_write(grain5, "/Users/Paul/Desktop/R_Catan/grain5.png")
image_write(grain6, "/Users/Paul/Desktop/R_Catan/grain6.png")
image_write(grain8, "/Users/Paul/Desktop/R_Catan/grain8.png")
image_write(grain9, "/Users/Paul/Desktop/R_Catan/grain9.png")
image_write(grain10, "/Users/Paul/Desktop/R_Catan/grain10.png")
image_write(grain11, "/Users/Paul/Desktop/R_Catan/grain11.png")
image_write(grain12, "/Users/Paul/Desktop/R_Catan/grain12.png")
image_write(ore2, "/Users/Paul/Desktop/R_Catan/ore2.png")
image_write(ore3, "/Users/Paul/Desktop/R_Catan/ore3.png")
image_write(ore4, "/Users/Paul/Desktop/R_Catan/ore4.png")
image_write(ore5, "/Users/Paul/Desktop/R_Catan/ore5.png")
image_write(ore6, "/Users/Paul/Desktop/R_Catan/ore6.png")
image_write(ore8, "/Users/Paul/Desktop/R_Catan/ore8.png")
image_write(ore9, "/Users/Paul/Desktop/R_Catan/ore9.png")
image_write(ore10, "/Users/Paul/Desktop/R_Catan/ore10.png")
image_write(ore11, "/Users/Paul/Desktop/R_Catan/ore11.png")
image_write(ore12, "/Users/Paul/Desktop/R_Catan/ore12.png")
image_write(sheep2, "/Users/Paul/Desktop/R_Catan/sheep2.png")
image_write(sheep3, "/Users/Paul/Desktop/R_Catan/sheep3.png")
image_write(sheep4, "/Users/Paul/Desktop/R_Catan/sheep4.png")
image_write(sheep5, "/Users/Paul/Desktop/R_Catan/sheep5.png")
image_write(sheep6, "/Users/Paul/Desktop/R_Catan/sheep6.png")
image_write(sheep8, "/Users/Paul/Desktop/R_Catan/sheep8.png")
image_write(sheep9, "/Users/Paul/Desktop/R_Catan/sheep9.png")
image_write(sheep10, "/Users/Paul/Desktop/R_Catan/sheep10.png")
image_write(sheep11, "/Users/Paul/Desktop/R_Catan/sheep11.png")
image_write(sheep12, "/Users/Paul/Desktop/R_Catan/sheep12.png")
image_write(wood2, "/Users/Paul/Desktop/R_Catan/wood2.png")
image_write(wood3, "/Users/Paul/Desktop/R_Catan/wood3.png")
image_write(wood4, "/Users/Paul/Desktop/R_Catan/wood4.png")
image_write(wood5, "/Users/Paul/Desktop/R_Catan/wood5.png")
image_write(wood6, "/Users/Paul/Desktop/R_Catan/wood6.png")
image_write(wood8, "/Users/Paul/Desktop/R_Catan/wood8.png")
image_write(wood9, "/Users/Paul/Desktop/R_Catan/wood9.png")
image_write(wood10, "/Users/Paul/Desktop/R_Catan/wood10.png")
image_write(wood11, "/Users/Paul/Desktop/R_Catan/wood11.png")
image_write(wood12, "/Users/Paul/Desktop/R_Catan/wood12.png")
image_write(desert0, "/Users/Paul/Desktop/R_Catan/desert0.png")

# Harbours and sea!
# Harbour colour codes:
# 
# brick = #862917
# wood = #093C1B
# grain = #F7D55A
# ore = #7A756F
# sheep = #8FB222


sea_tile <- image_read("sea.png")
harbour_tile <- image_read("harbour.png")

harbour_general_circle <-
  image_extent(
    image_annotate(
      circle,
      "3:1",
      gravity = "Center",
      location = "+0-0",
      degrees = 0,
      size = 200,
      weight = 400
    ),
    "898x1010",
    gravity = "SouthEast",
    color = "none"
  )
harbour_general_circle <- image_fill(harbour_general_circle, "none", "+5+5", fuzz = 5)
harbour_general_circle <- image_fill(harbour_general_circle, "none", "+890+615", fuzz = 5)
harbour_general_circle <- image_fill(harbour_general_circle, "none", "+515+1000", fuzz = 5)
harbour_general_circle <- image_fill(harbour_general_circle, "none", "+890+1000", fuzz = 5)

grain_circle <-image_fill(circle, "#F7D55A", "+200+200", fuzz = 5)
wood_circle <- image_fill(circle, "#093C1B", "+200+200", fuzz = 5)
ore_circle <- image_fill(circle, "#7A756F", "+200+200", fuzz = 5)
sheep_circle <- image_fill(circle, "#8FB222", "+200+200", fuzz = 5)
brick_circle <- image_fill(circle, "#862917", "+200+200", fuzz = 5)





harbour_specific_circle <-
  image_extent(
    image_annotate(
      circle,
      "2:1",
      gravity = "Center",
      location = "+0-0",
      degrees = 0,
      size = 200,
      weight = 400
    ),
    "898x1010",
    gravity = "SouthEast",
    color = "none"
  )

harbour_specific_circle <- image_fill(harbour_specific_circle, "none", "+5+5", fuzz = 5)
harbour_specific_circle <- image_fill(harbour_specific_circle, "none", "+890+615", fuzz = 5)
harbour_specific_circle <- image_fill(harbour_specific_circle, "none", "+515+1000", fuzz = 5)
harbour_specific_circle <- image_fill(harbour_specific_circle, "none", "+890+1000", fuzz = 5)

circle <- image_mosaic(c(black2, beige3))


harbour_grain_circle <-image_fill(harbour_general_circle, "#F7D55A", "+800+900", fuzz = 5)
harbour_wood_circle <- image_fill(harbour_general_circle, "#093C1B", "+800+900", fuzz = 5)
harbour_ore_circle <- image_fill(harbour_general_circle, "#7A756F", "+800+900", fuzz = 5)
harbour_sheep_circle <- image_fill(harbour_general_circle, "#8FB222", "+800+900", fuzz = 5)
harbour_brick_circle <- image_fill(harbour_general_circle, "#862917", "+800+900", fuzz = 5)
  



harbour_general <- 


sea1_rotate <- image_rotate(sea_tile, 30)
sea2_rotate <- image_rotate(sea_tile, 90)
sea3_rotate <- image_rotate(sea_tile, 150)
sea4_rotate <- image_rotate(sea_tile, 210)
sea5_rotate <- image_rotate(sea_tile, 270)
sea6_rotate <- image_rotate(sea_tile, 330)
harbour1_rotate <- image_rotate(harbour_tile, 30)
harbour2_rotate <- image_rotate(harbour_tile, 90)
harbour3_rotate <- image_rotate(harbour_tile, 150)
harbour4_rotate <- image_rotate(harbour_tile, 210)
harbour5_rotate <- image_rotate(harbour_tile, 270)
harbour6_rotate <- image_rotate(harbour_tile, 330)

image_write(sea1_rotate, "/Users/Paul/Desktop/R_Catan/sea1_rotate.png")
image_write(sea2_rotate, "/Users/Paul/Desktop/R_Catan/sea2_rotate.png")
image_write(sea3_rotate, "/Users/Paul/Desktop/R_Catan/sea3_rotate.png")
image_write(sea4_rotate, "/Users/Paul/Desktop/R_Catan/sea4_rotate.png")
image_write(sea5_rotate, "/Users/Paul/Desktop/R_Catan/sea5_rotate.png")
image_write(sea6_rotate, "/Users/Paul/Desktop/R_Catan/sea6_rotate.png")

sea1_none <-
  image_fill(sea1_rotate,
             color = "none",
             point = "+5+5",
             fuzz = 15)
sea2_none <-
  image_fill(sea2_rotate,
             color = "none",
             point = "+5+5",
             fuzz = 15)
sea3_none <-
  image_fill(sea3_rotate,
             color = "none",
             point = "+5+5",
             fuzz = 15)
sea4_none <-
  image_fill(sea4_rotate,
             color = "none",
             point = "+5+5",
             fuzz = 15)
sea5_none <-
  image_fill(sea5_rotate,
             color = "none",
             point = "+5+5",
             fuzz = 15)
sea6_none <-
  image_fill(sea6_rotate,
             color = "none",
             point = "+5+5",
             fuzz = 15)

sea1 <- image_trim(sea1_none, fuzz = 6)
sea2 <- image_trim(sea2_none, fuzz = 6)
sea3 <- image_trim(sea3_none, fuzz = 6)
sea4 <- image_trim(sea4_none, fuzz = 6)
sea5 <- image_trim(sea5_none, fuzz = 6)
sea6 <- image_trim(sea6_none, fuzz = 6)

image_write(sea1, "/Users/Paul/Desktop/R_Catan/sea1_tile.png")
image_write(sea2, "/Users/Paul/Desktop/R_Catan/sea2_tile.png")
image_write(sea3, "/Users/Paul/Desktop/R_Catan/sea3_tile.png")
image_write(sea4, "/Users/Paul/Desktop/R_Catan/sea4_tile.png")
image_write(sea5, "/Users/Paul/Desktop/R_Catan/sea5_tile.png")
image_write(sea6, "/Users/Paul/Desktop/R_Catan/sea6_tile.png")



harbour_tile_general <-
  image_extent(
    image_annotate(
      circle,
      "3:1",
      gravity = "Center",
      location = "+0-0",
      degrees = 0,
      size = 200,
      weight = 400
    ),
    "898x1010",
    gravity = "SouthEast",
    color = "none"
  )





