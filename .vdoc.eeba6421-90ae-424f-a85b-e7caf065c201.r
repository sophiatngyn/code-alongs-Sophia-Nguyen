co2_emissions_longer |>
    mutate(answer_type = fct_rev(fct_relevel(answer_type, "Very wrong", "Wrong", "Correct"))),
    country = fct_relevel(country, "Türkiye", "Columbia", "Sweden", "Germany", "United Kingdom", "United States", "Kenya", "Pakistan")
    ggplot(aes(y = country, x = percentage, fill = answer_type)) +
    geom_col() +
    scale_fill_manual(
        values = c(
            "Very wrong" = "#96283A",
            "Wrong" =  "#DB4C67",
            "Correct" = "#C8F0BF"
        ),
        guide = guide_legend(reverse = TRUE)
    ) +
        theme(legend.position = "bottom")
