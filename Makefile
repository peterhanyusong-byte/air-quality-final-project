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

# Install all required packages
.PHONY: install
install:
	Rscript -e "renv::restore()"

# Optional cleanup
.PHONY: clean
clean:
	rm -rf output/*.rds figures/*.png report/final_project.html report/final_project_files final_project_files final_project.html

# Run docker
.PHONY: docker-run
docker-run:
	mkdir -p report
	docker run --rm -v $(PWD)/report:/project/report peterhanyusong/finalproject