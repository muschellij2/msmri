
#' MS Demographic Data in a \code{data.frame}
#'
#' @param cohort Cohort to be used - cross-sectional or longitudinal
#'
#' @return A \code{data.frame} of patient demographics
#' @export
#'
#' @examples
#' ms_demog()
#' df = ms_demog(cohort = "longitudinal")
ms_demog = function(
  cohort = c("cross_sectional", "longitudinal")
  ) {

  cohort = match.arg(cohort)
  cohort = switch(
    cohort,
    "cross_sectional" = "cs",
    "longitudinal" = "long"
  )

  rda = paste0(cohort, "_demog")
  df = get(rda)

  return(df)
}

