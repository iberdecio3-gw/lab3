# Lab 3 - Messy Data

```
lab3/
├── README.md
├── AI_USAGE.md
├── .gitignore
├── scripts/
│   ├── clean_1.R
│   ├── clean_2.R
│   └── grad_add.R
└── data/
    └── processed/
        ├── messy_samples_regex_clean.csv
        ├── messy_sequences_regex_clean.csv
        └── samples_feature_table.csv
```

## Requirements:
RStudio
Packages: tidyverse, dplyr, stringr, readr, lubridate

## Regex Cleaning

### Health Data - Samples
To run the script, clone this repo then run: Rscript scripts/clean_1.R

Data: data/raw/messy_samples.csv

Output: data/processed/messy_samples_regex_clean.csv

This script cleans:
- sample IDs
- dates
- sex categories
- enrollment sites
- glucose values
- glucose units

### Health Data - Sequences
To run the script, clone this repo then run: Rscript scripts/clean_2.R

Data: data/raw/messy_sequences.fasta

Output: data/processed/messy_sequences_regex_clean.csv

This script cleans:
- FASTA headers
- Structures headers into columns
- validates sequence length

## Graduate addendum
To run the script, clone this repo then run: Rscript scripts/grad_add.R

Data: data/processed/messy_samples_regex_clean.csv

Output: data/processed/samples_feature_table.csv

This code helps finalize the samples × features × metadata shape. While no pivot, the main feature (glucose) is highlighted alongside metadata.

## AI Use
The prompts and description of AI use are documented in AI_USAGE.md

Output from AI usage is stored here: data/processed/AI_cleaned_health_data.csv or AI_cleaned_sequences.csv

## Reproducibility
All scripts should be run from the repository root using the commands above. Relative file paths are used so the workflow can be reproduced after cloning the repository




