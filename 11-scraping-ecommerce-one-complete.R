# Scraping an eCommerce page (complete)

# load packages ----

library(tidyverse)
library(rvest) # harvests from the web
library(polite) # are we allowed to scrape?

# check for scrape-ability ----

bow("https://www.scrapingcourse.com/")

# read page ----

url <- "https://www.scrapingcourse.com/ecommerce/"
read_html(url) # add date
page <- read_html(url)

# titles ----

titles <- page |>
  html_elements(".woocommerce-loop-product__title") |>
  html_text()

# urls ----

urls <- page |>
  html_elements(".woocommerce-loop-product__link") |>
  html_attr("href")

# prices ----

prices <- page |>
  html_elements("bdi") |>
  html_text() |>
  str_remove("\\$") |>
  as.numeric()

# make tibble ----

items <- tibble(
  title = titles,
  url = urls,
  price = prices
)

# write items ----

write_csv(items, file = "data/items.csv")
