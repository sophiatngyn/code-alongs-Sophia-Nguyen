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
#
#
#
#| label: load-packages
#| message: false
library(tidyverse)
library(tidymodels)
library(openintro)
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
#| label: data-prep
loans <- loans_full_schema |>
  mutate(
    credit_util = total_credit_utilized / total_credit_limit,
    bankruptcy = as.factor(if_else(public_record_bankrupt == 0, 0, 1)),
    verified_income = droplevels(verified_income),
    homeownership = str_to_title(homeownership),
    homeownership = fct_relevel(homeownership, "Rent", "Mortgage", "Own")
  ) |>
  rename(credit_checks = inquiries_last_12m) |>
  select(
    interest_rate, loan_amount, verified_income, 
    debt_to_income, credit_util, bankruptcy, term, 
    credit_checks, issue_month, homeownership
  )
#
#
#
#
#
#| label: glimpse-loans
glimpse(loans)
#
#
#
#
#
#
#
#
#
#| label: explore-loans
ggplot(loans, aes(x = interest_rate)) +
  geom_histogram(binwidth = 2)

loans |>
  summarize(
    mean = mean(interest_rate),
    sd = sd(interest_rate),
    median = median(interest_rate),
    q1 = quantile(interest_rate, 0.25),
    q3 = quantile(interest_rate, 0.75),
    IGR = q3 - q1
  )

ggplot(loans, aes(x = loan_amount)) +
  geom_histogram(binwidth = 2500)

loans |>
  summarize(
    mean = mean(loan_amount),
    sd = sd(interest_rate),
    median = median(interest_rate),
    q1 = quantile(interest_rate, 0.25),
    q3 = quantile(interest_rate, 0.75),
    IGR = q3 - q1
  )
#
#
#
#| label: explore-borrowers
# add code here
#
#
#
#
#
#
#
#| label: rate-util-fit
# add code here
#
#
#
#
#
#| label: rate-util-plot
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
#
#
#
#| label: rate-home-fit
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
#
#
#
#
#
#
#
#
#
#| label: rate-util-home-fit
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
#
#
#
#
#
#| label: rate-util-home-int-fit
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
#
#
#
#
#
#
#
#
#| label: glance
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
#
#
#
#
#
#| label: new-fit
# add code here
#
#
#
#
#
#
