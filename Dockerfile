FROM rocker/verse:latest

# Install required R packages
RUN R -e "install.packages(c('tidyverse', 'knitr', 'rmarkdown', 'here', 'ggplot2'))"

# Turn off renv autoloader inside the container
ENV RENV_CONFIG_AUTOLOADER_ENABLED=FALSE

# Copy project files
WORKDIR /project
COPY . /project

# Default command to build report
CMD Rscript -e "source('code/01_table.R'); source('code/02_figure.R'); rmarkdown::render('final_project.Rmd', output_file='final_project.html', output_dir='report')"