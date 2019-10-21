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

# Creating three tibbles which represent the three data types on the map of Catan, being hexagon, edge, and corner:

brick2<-image_read("brick2.png")
brick3<-image_read("brick3.png")
brick4<-image_read("brick4.png")
brick5<-image_read("brick5.png")
brick6<-image_read("brick6.png")
brick8<-image_read("brick8.png")
brick9<-image_read("brick9.png")
brick10<-image_read("brick10.png")
brick11<-image_read("brick11.png")
brick12<-image_read("brick12.png")
grain2<-image_read("grain2.png")
grain3<-image_read("grain3.png")
grain4<-image_read("grain4.png")
grain5<-image_read("grain5.png")
grain6<-image_read("grain6.png")
grain8<-image_read("grain8.png")
grain9<-image_read("grain9.png")
grain10<-image_read("grain10.png")
grain11<-image_read("grain11.png")
grain12<-image_read("grain12.png")
ore2<-image_read("ore2.png")
ore3<-image_read("ore3.png")
ore4<-image_read("ore4.png")
ore5<-image_read("ore5.png")
ore6<-image_read("ore6.png")
ore8<-image_read("ore8.png")
ore9<-image_read("ore9.png")
ore10<-image_read("ore10.png")
ore11<-image_read("ore11.png")
ore12<-image_read("ore12.png")
sheep2<-image_read("sheep2.png")
sheep3<-image_read("sheep3.png")
sheep4<-image_read("sheep4.png")
sheep5<-image_read("sheep5.png")
sheep6<-image_read("sheep6.png")
sheep8<-image_read("sheep8.png")
sheep9<-image_read("sheep9.png")
sheep10<-image_read("sheep10.png")
sheep11<-image_read("sheep11.png")
sheep12<-image_read("sheep12.png")
wood2<-image_read("wood2.png")
wood3<-image_read("wood3.png")
wood4<-image_read("wood4.png")
wood5<-image_read("wood5.png")
wood6<-image_read("wood6.png")
wood8<-image_read("wood8.png")
wood9<-image_read("wood9.png")
wood10<-image_read("wood10.png")
wood11<-image_read("wood11.png")
wood12<-image_read("wood12.png")
desert0<-image_read("desert0.png")

sea_1<-image_read("sea_1.png")
sea_2<-image_read("sea_2.png")
sea_3<-image_read("sea_3.png")
sea_4<-image_read("sea_4.png")
sea_5<-image_read("sea_5.png")
sea_6<-image_read("sea_6.png")
harbour_wood1<-image_read("harbour_wood1.png")
harbour_wood2<-image_read("harbour_wood2.png")
harbour_wood3<-image_read("harbour_wood3.png")
harbour_wood4<-image_read("harbour_wood4.png")
harbour_wood5<-image_read("harbour_wood5.png")
harbour_wood6<-image_read("harbour_wood6.png")
harbour_grain1<-image_read("harbour_grain1.png")
harbour_grain2<-image_read("harbour_grain2.png")
harbour_grain3<-image_read("harbour_grain3.png")
harbour_grain4<-image_read("harbour_grain4.png")
harbour_grain5<-image_read("harbour_grain5.png")
harbour_grain6<-image_read("harbour_grain6.png")
harbour_ore1<-image_read("harbour_ore1.png")
harbour_ore2<-image_read("harbour_ore2.png")
harbour_ore3<-image_read("harbour_ore3.png")
harbour_ore4<-image_read("harbour_ore4.png")
harbour_ore5<-image_read("harbour_ore5.png")
harbour_ore6<-image_read("harbour_ore6.png")
harbour_sheep1<-image_read("harbour_sheep1.png")
harbour_sheep2<-image_read("harbour_sheep2.png")
harbour_sheep3<-image_read("harbour_sheep3.png")
harbour_sheep4<-image_read("harbour_sheep4.png")
harbour_sheep5<-image_read("harbour_sheep5.png")
harbour_sheep6<-image_read("harbour_sheep6.png")
harbour_brick1<-image_read("harbour_brick1.png")
harbour_brick2<-image_read("harbour_brick2.png")
harbour_brick3<-image_read("harbour_brick3.png")
harbour_brick4<-image_read("harbour_brick4.png")
harbour_brick5<-image_read("harbour_brick5.png")
harbour_brick6<-image_read("harbour_brick6.png")
harbour_generic1<-image_read("harbour_generic1.png")
harbour_generic2<-image_read("harbour_generic2.png")
harbour_generic3<-image_read("harbour_generic3.png")
harbour_generic4<-image_read("harbour_generic4.png")
harbour_generic5<-image_read("harbour_generic5.png")
harbour_generic6<-image_read("harbour_generic6.png")

adjacent <- vector("list", 19)
hexagon <-
  tibble(
    terraintype = 1:19,
    dicevalue = rep(7),
    robber = rep(FALSE, 19),
    adjacent
  )
adjacent_edge <- vector("list", 19)
adjacent_corner <- vector("list", 19)
edge <-
  tibble(
    built = rep("empty", 72),
    buildable_red = rep(FALSE, 72),
    buildable_blue = rep(FALSE, 72),
    buildable_green = rep(FALSE, 72),
    buildable_orange = rep(FALSE, 72),
    placeable_red = rep(FALSE, 72),
    placeable_blue = rep(FALSE, 72),
    placeable_green = rep(FALSE, 72),
    placeable_orange = rep(FALSE, 72),
    orientation = "/",
  )
corner <-
  tibble(
    built = rep("empty", 54),
    buildable_red = rep(FALSE, 54),
    buildable_blue = rep(FALSE, 54),
    buildable_green = rep(FALSE, 54),
    buildable_orange = rep(FALSE, 54),
    placeable_red = rep(TRUE, 54),
    placeable_blue = rep(TRUE, 54),
    placeable_green = rep(TRUE, 54),
    placeable_orange = rep(TRUE, 54),
    orientation = rep("^", 54),
    harbour = rep("no", 54)
  )

# Now we'll make a vector representing the pile of hexagonal terrain cards:
terrain_wood   <- rep("wood", 4)
terrain_sheep  <- rep("sheep", 4)
terrain_grain  <- rep("grain", 4)
terrain_brick  <- rep("brick", 3)
terrain_ore    <- rep("ore", 3)
terrain_desert <- rep("desert", 1)
terrain_types <-
  c(
    terrain_wood,
    terrain_sheep,
    terrain_grain,
    terrain_brick,
    terrain_ore,
    terrain_desert
  )

# Let's randomly draw from the pile until the pile is empty, and assign this to the terraintype column in our hexagon tibble:
hexagon$terraintype <-
  sample(terrain_types, length(terrain_types), replace = FALSE)

hexagon$render <- vector("list", 19)

# hex_dice_value is the value of the hexagonal cards, starting at the top left on hexagon 1 and going counterclockwise. But we cannot simply apply this straight away because we need to skip the desert tile which will be in a different position each game:
hex_dice_value <-
  c(5, 2, 6, 3, 8, 10, 9, 12, 11, 4, 8, 10, 9, 4, 5, 6, 3, 11)

# hex_order is the order of the tiles in which they are given their numerical values
hex_order <-
  c(1, 4, 8, 13, 17, 18, 19, 16, 12, 7, 3, 2, 5, 9, 14, 15, 11, 6, 10)

# making a new vector of all the assigned terrain hexagons, in the anticlockwise order that the numbers will be added
terrain_ordered <- hexagon$terraintype[hex_order]

# We'll need the index for the desert tile, as this is the one we have to skip when adding the numerical values to the  tiles:
desert_index <- which(terrain_ordered[] == "desert")

# adding a 0 into the hex_dice_value where the desert is:
hdv_deserted <-
  c(hex_dice_value[1:desert_index - 1], 0, hex_dice_value[desert_index:length(hex_dice_value)])

# Let's reverse the re-ordering, now that we have the dice values allocated, and add these values to out hexagon tibble:
hex_reorder <-
  c(1, 12, 11, 2, 13, 18, 10, 3, 14, 19, 17, 9, 4, 15, 16, 8, 5, 6, 7)
hexagon$dicevalue <- hdv_deserted[hex_reorder]

hexagon$render <- paste0(hexagon$terraintype, hexagon$dicevalue)

# Add robber to desert tile:
desert_index2 <- which(hexagon$terraintype[] == "desert")
hexagon$robber[desert_index2] <- TRUE

tile_width <- 400
tile_height <- 462
tile_unit <- 0.5 * tile_height
vert <- 0.75 * tile_height
horiz <- 0.5 * tile_width

# how big do we want the board to be? Remember that we want to keep space for the harbours:

catan <- image_blank(width = tile_width * 7,
                     height = tile_unit * 11 ,
                     col = "moccasin")


# 1  4  8 13 17 18 19 16 12  7  3  2  5  9 14 15 11 6 10

tile1 <-
  image_extent(
    get(hexagon$render[1]),
    paste0(6 * horiz, "x", 2 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile2 <-
  image_extent(
    get(hexagon$render[4]),
    paste0(5 * horiz, "x", 3 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile3 <-
  image_extent(
    get(hexagon$render[8]),
    paste0(4 * horiz, "x", 4 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )

tile4 <-
  image_extent(
    get(hexagon$render[13]),
    paste0(5 * horiz, "x", 5 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile5 <-
  image_extent(
    get(hexagon$render[17]),
    paste0(6 * horiz, "x", 6 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile6 <-
  image_extent(
    get(hexagon$render[18]),
    paste0(8 * horiz, "x", 6 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile7 <-
  image_extent(
    get(hexagon$render[19]),
    paste0(10 * horiz, "x", 6 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile8 <-
  image_extent(
    get(hexagon$render[16]),
    paste0(11 * horiz, "x", 5 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile9 <-
  image_extent(
    get(hexagon$render[12]),
    paste0(12 * horiz, "x", 4 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile10 <-
  image_extent(
    get(hexagon$render[7]),
    paste0(11 * horiz, "x", 3 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile11 <-
  image_extent(
    get(hexagon$render[3]),
    paste0(10 * horiz, "x", 2 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile12 <-
  image_extent(
    get(hexagon$render[2]),
    paste0(8 * horiz, "x", 2 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile13 <-
  image_extent(
    get(hexagon$render[5]),
    paste0(7 * horiz, "x", 3 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile14 <-
  image_extent(
    get(hexagon$render[9]),
    paste0(6 * horiz, "x", 4 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile15 <-
  image_extent(
    get(hexagon$render[14]),
    paste0(7 * horiz, "x", 5 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile16 <-
  image_extent(
    get(hexagon$render[15]),
    paste0(9 * horiz, "x", 5 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile17 <-
  image_extent(
    get(hexagon$render[11]),
    paste0(10 * horiz, "x", 4 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile18 <-
  image_extent(
    get(hexagon$render[6]),
    paste0(9 * horiz, "x", 3 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
tile19 <-
  image_extent(
    get(hexagon$render[10]),
    paste0(8  * horiz, "x", 4 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )


## Adding harbours
## Let's start by creating a new tibble, similar to the hexagon terrain tibble we made before, just this time for sea tiles:

seahex <-
  tibble(
    type = rep(c("harbour","sea"),9),
    harbourtype = rep("",18),
    orientation = c(6L,6L,1L,1L,1L,2L,2L,2L,3L,3L,3L,4L,4L,4L,5L,5L,5L,6L),
    render = rep("",18),
    harbourcorner = vector("list", 18)
  )

seahex$harbourcorner[[1]] <- c(1L,2L)
seahex$harbourcorner[[3]] <- c(4L,5L)
seahex$harbourcorner[[5]] <- c(15L,16L)
seahex$harbourcorner[[7]] <- c(27L,38L)
seahex$harbourcorner[[9]] <- c(46L,47L)
seahex$harbourcorner[[11]] <- c(51L,52L)
seahex$harbourcorner[[13]] <- c(48L,49L)
seahex$harbourcorner[[15]] <- c(29L,39L)
seahex$harbourcorner[[17]] <- c(8L,18L)

## If we start at the top left corner and rotate clockwise, we will need harbour and sea tiles in the following order of orientation:
## H6, S6, H1, S1, H1, S2, H2, S2, H3, S3, H3, S4, H4, S4, H5, S5, H5, S6
## There are 9 harbours, 1 for each resource and 4 generic ones. 
## So let's start by making a random draw from the harbour tiles the same way we did for the terrain tiles:
# Now we'll make a vector representing the pile of hexagonal terrain cards:

harbour_wood   <- rep("wood", 1)
harbour_sheep  <- rep("sheep", 1)
harbour_grain  <- rep("grain", 1)
harbour_brick  <- rep("brick", 1)
harbour_ore    <- rep("ore", 1)
harbour_generic <- rep("generic", 4)
harbour_types <-
  c(
    harbour_wood,
    harbour_sheep,
    harbour_grain,
    harbour_brick,
    harbour_ore,
    harbour_generic
  )

harbour_rand <- sample(harbour_types, length(harbour_types), replace = FALSE)
seahex$harbourtype[1] <- harbour_rand[1]
seahex$harbourtype[3] <- harbour_rand[2]
seahex$harbourtype[5] <- harbour_rand[3]
seahex$harbourtype[7] <- harbour_rand[4]
seahex$harbourtype[9] <- harbour_rand[5]
seahex$harbourtype[11] <- harbour_rand[6]
seahex$harbourtype[13] <- harbour_rand[7]
seahex$harbourtype[15] <- harbour_rand[8]
seahex$harbourtype[17] <- harbour_rand[9]

seahex$render <- paste0(seahex$type, "_", seahex$harbourtype, seahex$orientation)

seatile1 <-
  image_extent(
    get(seahex$render[1]),
    paste0(5 * horiz, "x", 1 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile2 <-
  image_extent(
    get(seahex$render[2]),
    paste0(7 * horiz, "x", 1 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile3 <-
  image_extent(
    get(seahex$render[3]),
    paste0(9 * horiz, "x", 1 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile4 <-
  image_extent(
    get(seahex$render[4]),
    paste0(11 * horiz, "x", 1 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile5 <-
  image_extent(
    get(seahex$render[5]),
    paste0(12 * horiz, "x", 2 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile6 <-
  image_extent(
    get(seahex$render[6]),
    paste0(13 * horiz, "x", 3 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile7 <-
  image_extent(
    get(seahex$render[7]),
    paste0(14 * horiz, "x", 4 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile8 <-
  image_extent(
    get(seahex$render[8]),
    paste0(13 * horiz, "x", 5 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile9 <-
  image_extent(
    get(seahex$render[9]),
    paste0(12 * horiz, "x", 6 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile10 <-
  image_extent(
    get(seahex$render[10]),
    paste0(11 * horiz, "x", 7 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile11 <-
  image_extent(
    get(seahex$render[11]),
    paste0(9 * horiz, "x", 7 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile12 <-
  image_extent(
    get(seahex$render[12]),
    paste0(7 * horiz, "x", 7 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile13 <-
  image_extent(
    get(seahex$render[13]),
    paste0(5 * horiz, "x", 7 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile14 <-
  image_extent(
    get(seahex$render[14]),
    paste0(4 * horiz, "x", 6 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile15 <-
  image_extent(
    get(seahex$render[15]),
    paste0(3 * horiz, "x", 5 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile16 <-
  image_extent(
    get(seahex$render[16]),
    paste0(2 * horiz, "x", 4 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile17 <-
  image_extent(
    get(seahex$render[17]),
    paste0(3 * horiz, "x", 3 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )
seatile18 <-
  image_extent(
    get(seahex$render[18]),
    paste0(4 * horiz, "x", 2 * vert + 1 / 3 * vert),
    gravity = "SouthEast",
    color = "none"
  )

# Now let's render the map!

catan01<-image_mosaic(c(catan,tile1))
catan02<-image_mosaic(c(catan01,tile2))
catan03<-image_mosaic(c(catan02,tile3))
catan04<-image_mosaic(c(catan03,tile4))
catan05<-image_mosaic(c(catan04,tile5))
catan06<-image_mosaic(c(catan05,tile6))
catan07<-image_mosaic(c(catan06,tile7))
catan08<-image_mosaic(c(catan07,tile8))
catan09<-image_mosaic(c(catan08,tile9))
catan10<-image_mosaic(c(catan09,tile10))
catan11<-image_mosaic(c(catan10,tile11))
catan12<-image_mosaic(c(catan11,tile12))
catan13<-image_mosaic(c(catan12,tile13))
catan14<-image_mosaic(c(catan13,tile14))
catan15<-image_mosaic(c(catan14,tile15))
catan16<-image_mosaic(c(catan15,tile16))
catan17<-image_mosaic(c(catan16,tile17))
catan18<-image_mosaic(c(catan17,tile18))
catan19<-image_mosaic(c(catan18,tile19))
catan20<-image_mosaic(c(catan19,seatile1))
catan21<-image_mosaic(c(catan20,seatile2))
catan22<-image_mosaic(c(catan21,seatile3))
catan23<-image_mosaic(c(catan22,seatile4))
catan24<-image_mosaic(c(catan23,seatile5))
catan25<-image_mosaic(c(catan24,seatile6))
catan26<-image_mosaic(c(catan25,seatile7))
catan27<-image_mosaic(c(catan26,seatile8))
catan28<-image_mosaic(c(catan27,seatile9))
catan29<-image_mosaic(c(catan28,seatile10))
catan30<-image_mosaic(c(catan29,seatile11))
catan31<-image_mosaic(c(catan30,seatile12))
catan32<-image_mosaic(c(catan31,seatile13))
catan33<-image_mosaic(c(catan32,seatile14))
catan34<-image_mosaic(c(catan33,seatile15))
catan35<-image_mosaic(c(catan34,seatile16))
catan36<-image_mosaic(c(catan35,seatile17))
catan37<-image_mosaic(c(catan36,seatile18))

image_write(catan01,"/Users/Paul/Desktop/R_Catan/catan01.png")
image_write(catan02,"/Users/Paul/Desktop/R_Catan/catan02.png")
image_write(catan03,"/Users/Paul/Desktop/R_Catan/catan03.png")
image_write(catan04,"/Users/Paul/Desktop/R_Catan/catan04.png")
image_write(catan05,"/Users/Paul/Desktop/R_Catan/catan05.png")
image_write(catan06,"/Users/Paul/Desktop/R_Catan/catan06.png")
image_write(catan07,"/Users/Paul/Desktop/R_Catan/catan07.png")
image_write(catan08,"/Users/Paul/Desktop/R_Catan/catan08.png")
image_write(catan09,"/Users/Paul/Desktop/R_Catan/catan09.png")
image_write(catan10,"/Users/Paul/Desktop/R_Catan/catan10.png")
image_write(catan11,"/Users/Paul/Desktop/R_Catan/catan11.png")
image_write(catan12,"/Users/Paul/Desktop/R_Catan/catan12.png")
image_write(catan13,"/Users/Paul/Desktop/R_Catan/catan13.png")
image_write(catan14,"/Users/Paul/Desktop/R_Catan/catan14.png")
image_write(catan15,"/Users/Paul/Desktop/R_Catan/catan15.png")
image_write(catan16,"/Users/Paul/Desktop/R_Catan/catan16.png")
image_write(catan17,"/Users/Paul/Desktop/R_Catan/catan17.png")
image_write(catan18,"/Users/Paul/Desktop/R_Catan/catan18.png")
image_write(catan19,"/Users/Paul/Desktop/R_Catan/catan19.png")
image_write(catan20,"/Users/Paul/Desktop/R_Catan/catan20.png")
image_write(catan21,"/Users/Paul/Desktop/R_Catan/catan21.png")
image_write(catan22,"/Users/Paul/Desktop/R_Catan/catan22.png")
image_write(catan23,"/Users/Paul/Desktop/R_Catan/catan23.png")
image_write(catan24,"/Users/Paul/Desktop/R_Catan/catan24.png")
image_write(catan25,"/Users/Paul/Desktop/R_Catan/catan25.png")
image_write(catan26,"/Users/Paul/Desktop/R_Catan/catan26.png")
image_write(catan27,"/Users/Paul/Desktop/R_Catan/catan27.png")
image_write(catan28,"/Users/Paul/Desktop/R_Catan/catan28.png")
image_write(catan29,"/Users/Paul/Desktop/R_Catan/catan29.png")
image_write(catan30,"/Users/Paul/Desktop/R_Catan/catan30.png")
image_write(catan31,"/Users/Paul/Desktop/R_Catan/catan31.png")
image_write(catan32,"/Users/Paul/Desktop/R_Catan/catan32.png")
image_write(catan33,"/Users/Paul/Desktop/R_Catan/catan33.png")
image_write(catan34,"/Users/Paul/Desktop/R_Catan/catan34.png")
image_write(catan35,"/Users/Paul/Desktop/R_Catan/catan35.png")
image_write(catan36,"/Users/Paul/Desktop/R_Catan/catan36.png")
image_write(catan37,"/Users/Paul/Desktop/R_Catan/catan37.png")

catan_gif <-
  image_animate(
    c(
      catan01,
      catan02,
      catan03,
      catan04,
      catan05,
      catan06,
      catan07,
      catan08,
      catan09,
      catan10,
      catan11,
      catan12,
      catan13,
      catan14,
      catan15,
      catan16,
      catan17,
      catan18,
      catan19,
      catan20,
      catan21,
      catan22,
      catan23,
      catan24,
      catan25,
      catan26,
      catan27,
      catan28,
      catan29,
      catan30,
      catan31,
      catan32,
      catan33,
      catan34,
      catan35,
      catan36,
      catan37
    ),
    fps = 1,
    loop = 1
  )

# image_write(catan_gif,"/Users/Paul/Desktop/R_Catan/catan_gif.gif")

