library(dplyr)
library(stringr)
library(readr)


library(tidyverse)

fasta <- readLines("data/raw/messy_sequences.fasta")

#header lines
headers <- fasta[str_detect(fasta, "^>")]

#sequence lines
sequence_groups <- cumsum(str_detect(fasta, "^>"))

seqs <- tibble(
  group = sequence_groups,
  line = fasta
) %>%
  filter(!str_detect(line, "^>")) %>%
  group_by(group) %>%
  summarize(sequence = paste0(line, collapse = ""))

clean_fasta <- tibble(
  raw_header = headers
)

clean_fasta$sample_id <- str_extract(
  clean_fasta$raw_header,
  "\\d+"
)

clean_fasta$sample_id <- paste0(
  "S",
  str_pad(clean_fasta$sample_id, 3, pad = "0")
)

clean_fasta$organism <- "Homo sapiens"

clean_fasta$gene <- str_extract(
  clean_fasta$raw_header,
  "BRCA1|TP53|EGFR"
)

clean_fasta$declared_length <- str_extract(
  clean_fasta$raw_header,
  "\\d+\\s*bp|len[=:]\\d+|length=\\d+"
)

clean_fasta$declared_length <- str_extract(
  clean_fasta$declared_length,
  "\\d+"
)

clean_fasta$declared_length <- as.numeric(
  clean_fasta$declared_length
)

clean_fasta$sequence <- seqs$sequence

clean_fasta$actual_length <- nchar(
  clean_fasta$sequence
)

write_csv(
  clean_fasta,
  "data/processed/messy_sequences_regex_clean.csv"
)

print(clean_fasta)