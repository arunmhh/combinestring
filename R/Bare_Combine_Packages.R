#' @export
bare_combine_addin <- function() {
  # Check which required packages are loaded
  required_pkgs <- c(
    "tidyverse", "dplyr", "ggplot2", "readxl", "ggstatsplot",
    "BayesFactor", "ggthemes", "emmeans", "dlookr", "sjPlot",
    "reshape2", "ISLR", "ISLR2", "gapminder", "psych",
    "PerformanceAnalytics", "flextable", "survival", "MVN",
    "summarytools", "gtsummary", "DataExplorer", "clusterProfiler",
    "org.Hs.eg.db", "AnnotationDbi", "openxlsx"
  )

  # Warn if some packages are not loaded
  not_loaded <- required_pkgs[!required_pkgs %in% (.packages())]
  if(length(not_loaded) > 0) {
    warning(
      "The following packages are not loaded in this session: ",
      paste(not_loaded, collapse = ", "),
      "\nPlease load them before running this addin."
    )
  }

  # Run your main function
  bare_combine()
}


