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

#####
# Creating three tibbles which represent the three data types on the map of Catan, being hexagon, edge, and corner:
#####

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

# Our hexagon values are now complete. There is one thing left to do before the randomised board is complete, and that is to assign harbour values to the appropriate corners:
harbour_types <-
  c("generic",
    "generic",
    "generic",
    "generic",
    "wood",
    "ore",
    "grain",
    "sheep",
    "bricks")
harbour_tiles <-
  c(1, 2, 4, 5, 8, 18, 15, 16, 27, 38, 29, 39, 46, 47, 48, 49, 51, 52)
harbour_rand <-
  sample(harbour_types, length(harbour_types), replace = FALSE)
harbour_assign <-
  rep(harbour_rand[1:length(harbour_rand)], each = 2)

for (i in harbour_tiles) {
  corner$harbour[i] <- harbour_assign[1]
  harbour_assign <- harbour_assign[-1]
}

#Let's check whether the code worked to assign two of the same type of harbour in each of the adjacent slots:
corner$harbour[harbour_tiles]

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



catan01 <- image_mosaic(c(catan, tile1))
catan02 <- image_mosaic(c(catan01, tile2))
catan03 <- image_mosaic(c(catan02, tile3))
catan04 <- image_mosaic(c(catan03, tile4))
catan05 <- image_mosaic(c(catan04, tile5))
catan06 <- image_mosaic(c(catan05, tile6))
catan07 <- image_mosaic(c(catan06, tile7))
catan08 <- image_mosaic(c(catan07, tile8))
catan09 <- image_mosaic(c(catan08, tile9))
catan10 <- image_mosaic(c(catan09, tile10))
catan11 <- image_mosaic(c(catan10, tile11))
catan12 <- image_mosaic(c(catan11, tile12))
catan13 <- image_mosaic(c(catan12, tile13))
catan14 <- image_mosaic(c(catan13, tile14))
catan15 <- image_mosaic(c(catan14, tile15))
catan16 <- image_mosaic(c(catan15, tile16))
catan17 <- image_mosaic(c(catan16, tile17))
catan18 <- image_mosaic(c(catan17, tile18))
catan19 <- image_mosaic(c(catan18, tile19))

image_write(catan01, "/Users/Paul/Desktop/R_Catan/catan01.png")
image_write(catan02, "/Users/Paul/Desktop/R_Catan/catan02.png")
image_write(catan03, "/Users/Paul/Desktop/R_Catan/catan03.png")
image_write(catan04, "/Users/Paul/Desktop/R_Catan/catan04.png")
image_write(catan05, "/Users/Paul/Desktop/R_Catan/catan05.png")
image_write(catan06, "/Users/Paul/Desktop/R_Catan/catan06.png")
image_write(catan07, "/Users/Paul/Desktop/R_Catan/catan07.png")
image_write(catan08, "/Users/Paul/Desktop/R_Catan/catan08.png")
image_write(catan09, "/Users/Paul/Desktop/R_Catan/catan09.png")
image_write(catan10, "/Users/Paul/Desktop/R_Catan/catan10.png")
image_write(catan11, "/Users/Paul/Desktop/R_Catan/catan11.png")
image_write(catan12, "/Users/Paul/Desktop/R_Catan/catan12.png")
image_write(catan13, "/Users/Paul/Desktop/R_Catan/catan13.png")
image_write(catan14, "/Users/Paul/Desktop/R_Catan/catan14.png")
image_write(catan15, "/Users/Paul/Desktop/R_Catan/catan15.png")
image_write(catan16, "/Users/Paul/Desktop/R_Catan/catan16.png")
image_write(catan17, "/Users/Paul/Desktop/R_Catan/catan17.png")
image_write(catan18, "/Users/Paul/Desktop/R_Catan/catan18.png")
image_write(catan19, "/Users/Paul/Desktop/R_Catan/catan19.png")


gifski(
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
    catan19
    ),
  gif_file = "/Users/Paul/Desktop/R_Catan/catan19.png",
  width = 2800,
  height = 2541,
  delay = 1,
  loop = TRUE,
  progress = TRUE
)


image_write(catan19,
            "/Users/Paul/Desktop/R_Catan/catan_map.png")

image_write(catan_gif,
            "/Users/Paul/Desktop/R_Catan/catan_map.gif")
