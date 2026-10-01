library(dplyr)
library(readr)

clean_samples <- read_csv(
  "data/processed/messy_samples_regex_clean.csv",
  show_col_types = FALSE
)

feature_table <- clean_samples %>%
  select(
    sample_id,
    glucose_value,
    dob,
    sex,
    enrollment_site,
    glucose_unit,
    glucose_flag
  )

write_csv(
  feature_table,
  "data/processed/samples_feature_table.csv"
)