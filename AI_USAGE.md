
## Using ChatGPT, I uploaded both datasets to see what would happen. The transcripts and observations are below:

```
Prompt: Here's a messy health data set - can you clean it so the IDs and dates are structured consistently, and the units for the glucose measurements are the same (in mg/dL)?


Response: one. I standardized all 60 records:
- IDs → S####
- DOBs → YYYY-MM-DD
- Glucose units → mg/dL
- * markers removed from numeric values but preserved in an audit log
- unusually large converted values were flagged for source verification rather than silently altered
he Excel file includes Cleaned Data, Audit Log, and Cleaning Notes sheets.   

cleaned_health_data.xlsx
Excel
cleaned_health_data.csv
Spreadsheet


```
The main observation is that ChatGPT only did what I asked, it did not go outside the bound of my direction - so things like enrollment site are still messy. It was definitely faster than coding in R (took at ~25 seconds), but I would still need to verify the correctness of each action. ChatGPT did provide an audit log, which is helpful for this process. 

## The next interaction is for the sequence data:

```
Prompt: Here's sequence data, can you clean it - like header fields split into separate columns, and make sure that the declared sequence length matches the actual length?

Response: Done. I split the FASTA headers into structured fields and standardized the recurring metadata.
The table includes sample_id, organism, gene, declared_length, actual_length, note, qa_flag, the original header, and the full sequence. I also flagged records where the stated length is missing or doesn’t match the actual sequence length.

```

Similarly to the samples, this was much faster. This ask seemed to work better than the samples - it could be because there was only 8 seqs. ChatGPT provided an excel with cleaned sequences split into cols like asked, and it seems to be correct for the most part. 
