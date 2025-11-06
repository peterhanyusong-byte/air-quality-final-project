# code/01_table.R
# Purpose: Compute descriptive statistics and save as RDS

# Load data
here::i_am("code/01_table.R")
data <- read.csv(here::here("data", "air_quality_health_impact_data.csv"))

# Compute summary statistics
summary_table <- data.frame(
  Variable = c("AQI", "PM10", "PM2_5", "NO2", "SO2", "O3"),
  Mean = sapply(data[, c("AQI","PM10","PM2_5","NO2","SO2","O3")], mean, na.rm = TRUE),
  SD   = sapply(data[, c("AQI","PM10","PM2_5","NO2","SO2","O3")], sd, na.rm = TRUE),
  Min  = sapply(data[, c("AQI","PM10","PM2_5","NO2","SO2","O3")], min, na.rm = TRUE),
  Max  = sapply(data[, c("AQI","PM10","PM2_5","NO2","SO2","O3")], max, na.rm = TRUE)
)

# Save as .rds
saveRDS(summary_table, file = here::here("output", "01_table.rds"))
