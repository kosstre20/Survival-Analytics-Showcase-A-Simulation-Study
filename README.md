# Survival Analysis Simulation in R

Survival analysis is a statistical technique widely used in medical research to analyze the time until an event of interest occurs. This event could be the occurrence of a disease recurrence, death, or any other outcome. In this R script, we perform a simulation of survival data to demonstrate the application of survival analysis techniques using the `survival`, `survminer`, and `gtsummary` packages.

## Simulation Overview

We simulate a dataset with various explanatory variables, a survival time variable, and a binary event indicator. The goal is to mimic a scenario where patients are treated with different interventions, and we want to assess the impact of these interventions on the time until an event of interest.

## Key Steps and Analyses

1. **Data Simulation:** Simulate a dataset with explanatory variables representing patient characteristics, a survival time variable (`TIME`), treatment variable (A) and a binary event indicator (`Y`).

2. **Kaplan-Meier Survival Curves:** Estimate and plot Kaplan-Meier survival curves to visualize the survival probabilities over time for different treatment groups.

3. **Log-Rank Test:** Perform a log-rank test to compare the survival curves between different treatment groups.

4. **Cox Proportional-Hazards Model:** Fit a Cox proportional-hazards model to assess the impact of treatment and other covariates on the hazard of the event.

5. **Summary and Hazard Ratios:** Summarize the results and present hazard ratios using the `gtsummary` package.

## Packages Used

- `survival`: for survival analysis functions.
- `survminer`: for advanced survival analysis visualizations.
- `gtsummary`: for creating summary tables of regression models.

This script serves as a practical example of survival analysis simulation and provides a foundation for analyzing real-world survival data in a medical research context.
