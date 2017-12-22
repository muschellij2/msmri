
#' MS Imaging Data in a \code{data.frame}
#'
#' @param cohort Cohort to be used - cross-sectional or longitudinal
#' @param data data to be used - raw or coregistered/processed
#'
#' @return A \code{data.frame} of imaging modalities and masks
#' @export
#'
#' @examples
#' ms_data()
#' ms_data(data = "coregistered")
#' ms_data(cohort = "longitudinal", data = "coregistered")
ms_data = function(
  cohort = c("cross_sectional", "longitudinal"),
  data = c("raw", "coregistered")) {

  cohort = match.arg(cohort)
  cohort = switch(
    cohort,
    "cross_sectional" = "cs",
    "longitudinal" = "long"
  )
  data = match.arg(data)
  data = switch(
    data,
    "raw" = "raw",
    "coregistered" = "coreg"
  )
  rda = paste0(cohort, "_", data)
  df = get(rda)
  df$url = file.path(ms_data_url(), df$file)
  if (data == "longitudinal") {
    df$Gold_Standard = file.path(ms_data_url(), df$Gold_Standard)
    if (data == "coregistered") {
      df$Brain_Mask = file.path(ms_data_url(), df$Brain_Mask)
    }
  }
  return(df)
}

