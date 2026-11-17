#
#
#
#
#
#
#
#
#
#
#
#
#
#| label: load-packages
#| message: false
library(tidyverse)
library(tidymodels)
library(forested)
#
#
#
#
#
#| label: glimpse-forested
glimpse(forested)
#
#
#
#
#
#
#
#| label: train-test-split
set.seed(12345)
forested_split <- initial_split(forested)

forested_split
#
#
#
#
#
#
#
#
#
#| label: train-test-percentages-75-25-split
5330 / nrow(forested)
1777 / nrow(forested)
#
#
#
#
#
#| label: train-test-80-20
initial_split(forested, prop = 0.8)
#
#
#
#
#
#| label: train-test-save
forested_train <- training(forested_split)
forested_test <- testing(forested_split)
#
#
#
#
#
#
#
#
#
#
#| label: eda-plot
forested_train |>
    ggplot(aes(x = temp_annual_mean, fill = forested)) +
    geom_histogram() +
    facet_wrap(~land_type, ncol = 1) +
    scale_fill_manual(
        values = c(
            "Yes" = "forestgreen",
            "No" = "gold"
        )
    )
#
#
#
#
#
#
#
#
#
#
#
#
#| label: forested-custom-fit
custom_fit <- logistic_reg() |>
    fit(forested ~ elevation + lat + lon + temp_annual_mean + tree_no_tree, data = forested_train)

tidy(custom_fit)
#
#
#
#
#
#
#
#| label: forested-custom-aug
custom_aug <- augment(custom_fit, new_data = forested_test)
#
#
#
#
#
#
#
#| label: forested-custom-eval
custom_aug |>
    count(forested, .pred_class) |>
    group_by(forested) |>
    mutate(p = n / sum(n),
    label = case_when(
        forested == "Yes" & .pred_class == "Yes" ~ "True positive",
                forested == "Yes" & .pred_class == "Yes" ~ "True positive",z
    ))
#
#
#
#
#
#
#
#| label: conf-mat-custom
# add code here
#
#
#
#
#
#
#
#| label: forested-custom-roc
# add code here
#
#
#
#
#
#
#
#
#
#
#| label: forested-full-fit
# add code here
#
#
#
#
#
#
#
#| label: forested-full-aug
# add code here
#
#
#
#
#
#
#
#| label: forested-full-eval
# add code here
#
#
#
#
#
#
#
#| label: forested-full-roc
# add code here
#
#
#
#
#
#
#
#| label: compare
# add code here
#
#
#
#
#
#
