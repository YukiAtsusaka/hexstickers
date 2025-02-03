
# sticker

# https://github.com/GuangchuangYu/hexSticker
#install.packages("hexSticker")

library(hexSticker)
library(ggplot2)
library(showtext)
library(tidyverse)
## Loading Google fonts (http://www.google.com/fonts)
font_add_google("Gochi Hand", "gochi")

## Automatically use showtext to render text for future devices
showtext_auto()


# survey question theme
x <- c(rep(1, 3), rep(2, 3), rep(3, 3))
y <- rep(1:3, 3)
dat <- data.frame(x = x, y = y)
fill <- data.frame(a = c(1, 2, 3),
                   b = c(1, 3, 2))
line1 <- data.frame(la = c(1, 2),
                    lb = c(2, 3))
line2 <- data.frame(la = c(3, 2),
                    lb = c(1, 3))

check_line <-  data.frame(la = c(2, 2),
                          lb = c(1, 3))

col_edge <- rgb(red = 178, green = 187, blue = 158, maxColorValue = 255)
col_fill <- rgb(red = 121, green = 151, blue = 151, maxColorValue = 255)
col_title <-  rgb(red = 244, green = 217, blue = 203, maxColorValue = 255)


p <- ggplot(aes(x = x, y = y), data = dat) +
  geom_line(data = line1,
            aes(x = la, y = lb), color = col_title, alpha = 1, linewidth = 0.9) +
  geom_line(data = line2,
            aes(x = la, y = lb), color = col_title, alpha = 1, linewidth = 0.9) +    
  # geom_line(data = check_line,
  #           aes(x = la, y = lb), color = col_title, alpha = 1) +      
  geom_point(data = dat,
             pch = 1, size = 2, color = col_title, stroke = 1.3, alpha = c(1, 0, 1,
                                                                    1, 1, 0,
                                                                    0, 1, 1)) +
  geom_point(data = fill,
             aes(x = a, y = rev(b)),
             pch = 16, size = c(4,4.5,5), color = col_title, alpha = c(1, 1, 1)) +
  annotate("text", label = c("1", "2", "3"),
           x = 1:3, y = c(2, 3, 1),
           size = c(6.5, 7, 7),
           color = col_fill,
           fontface = "bold",
           ) +
  theme(axis.text.y=element_text(margin=margin(r=0))) +
  scale_x_discrete(labels=c("1" = "1", 
                            "2" = "2",
                            "3" = "3")) +
  scale_y_discrete(labels=c("1" = "1", 
                            "2" = "2",
                            "3" = "3"))  +
  theme_void() +
  theme_transparent() 
   
# font
fonts_dataset <- font_files()
font_add("use", "FRAHV.TTF")


# hexsticker
sticker(p,
        package = "rankingQ",
        h_fill = col_fill,
        h_color = col_edge,
        p_color = col_title,
        h_size = 1.5,
        p_size = 25,
        p_x = 1.00,
        p_y = 1.42,
        p_family = "use",
        s_x = 1,
        s_y = 0.73,
        s_width = 0.5*1.5,
        s_height = 0.9*1.5,
        # spotlight = T,
        # l_x = 1.55,
        # l_y = 1.35,
        # l_width = 1,
        # l_alpha = 0.7,
        filename="rankingQ.png") %>% 
  print()

