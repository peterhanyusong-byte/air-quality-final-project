# code/02_figure.R
# Purpose: Create ggplot object and save as RDS

# Load data
library(ggplot2)
here::i_am("code/02_figure.R")
data <- read.csv(here::here("data", "air_quality_health_impact_data.csv"))

p <- ggplot(data, aes(x = PM2_5, y = HealthImpactScore)) +
  geom_point(alpha = 0.5, color = "blue") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(
    title = "Relationship Between PM2.5 and Health Impact Score",
    x = "PM2.5 Concentration (µg/m³)",
    y = "Health Impact Score"
  ) +
  theme_minimal()

# Save plot object as .rds
saveRDS(p, file = here::here("output", "02_figure.rds"))

# Save as PNG
ggsave(
  filename = here::here("figures", "02_figure.png"),
  plot = p,
  width = 8, height = 6, dpi = 300
)
