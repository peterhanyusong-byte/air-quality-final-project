# Final target
all: final_project.html

# Step 1: Generate table RDS
output/01_table.rds: code/01_table.R data/air_quality_health_impact_data.csv
	Rscript code/01_table.R

# Step 2: Generate figure RDS
output/02_figure.rds: code/02_figure.R data/air_quality_health_impact_data.csv
	Rscript code/02_figure.R

# Step 3: Render the final report
final_project.html: final_project.Rmd output/01_table.rds output/02_figure.rds
	Rscript -e "rmarkdown::render('final_project.Rmd')"

# Optional cleanup
.PHONY: clean
clean:
	rm -f output/*.rds figures/*.png final_project.html
