# Final Project – Air Quality and Health Impact

## Repository structure

- `code/`: R scripts used for analysis  
  - `01_table.R`: creates `output/01_table.rds`  
  - `02_figure.R`: creates `output/02_figure.rds` and `figures/02_figure.png`  
- `data/`: dataset used in the project  
- `output/`: generated RDS objects containing tables and figures  
- `figures/`: generated PNG images of figures  
- `final_project.Rmd`: final R Markdown report (reads from RDS outputs)  
- `Makefile`: rules for building the full report  

## How to reproduce results

From the project root directory, run:

```bash
make
```
####### This will:
1. Generate the descriptive statistics table (output/01_table.rds)
2. Generate the PM2.5–Health Impact figure (output/02_figure.rds and figures/02_figure.png)
3. Render the final R Markdown report (final_project.html)


## Table generation
1. Code: code/01_table.R
2. Output: output/01_table.rds
3. Displayed in: R Markdown chunk named table

## Figure generation
1. Code: code/02_figure.R
2. Outputs: output/02_figure.rds, figures/02_figure.png
3. Displayed in: R Markdown chunk named figure
