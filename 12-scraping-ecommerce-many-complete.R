# Scraping many eCommerce pages (complete)

# load packages ----

library(tidyverse)
library(rvest)
library(polite)
library(glue)

# check for scrape-ability ----

bow("https://www.scrapingcourse.com")

# read pages ----

pages <- 1:5
urls <- glue("https://www.scrapingcourse.com/ecommerce/page/{pages}/")

# function to scrape a page ----

scrape_items <- function(url){
  page <- read_html(url)
  
  # titles
  titles <- page |>
    html_elements(".woocommerce-loop-product__title") |>
    html_text()
  
  # urls
  urls <- page |>
    html_elements(".woocommerce-loop-product__link") |>
    html_attr("href")
  
  # prices
  prices <- page |>
    html_elements(".price") |>
    html_text() |>
    str_remove("\\$") |>
    as.numeric()
  
  # make tibble
  tibble(
    title = titles,
    url = urls,
    price = prices
  )
  
  #Sys.sleep(3)
}

  
  

# test function ----

items_from_page_1 <- scrape_items(urls[1])
scrape_items(urls[2])
scrape_items(urls[5])


# map function over urls ----

items <- map(urls, scrape_items) |>
  list_rbind()


# write data ----

write_csv(items, "data/items.csv")

