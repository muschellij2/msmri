
#' MS Imaging Data in a \code{data.frame}
#'
#' @param cohort Cohort to be used - cross-sectional or longitudinal
#' @param data data to be used - raw or coregistered/processed
#'
#' @return A \code{data.frame} of imaging modalities and masks,
#' and demographics
#' @export
#'
#' @examples
#' ms_data()
#' ms_data(data = "coregistered")
#' df = ms_data(cohort = "longitudinal", data = "coregistered")
ms_data = function(
  cohort = c("cross_sectional", "longitudinal"),
  data = c("raw", "coregistered")) {

  demog = ms_demog(cohort)

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
  if (cohort == "long") {
    df$Gold_Standard_url = file.path(ms_data_url(), df$Gold_Standard)
    if (data == "coreg") {
      df$Brain_Mask_url = file.path(ms_data_url(), df$Brain_Mask)
    }
  }
  df = merge(df, demog, all.x = TRUE, by = "id")
  return(df)
}

