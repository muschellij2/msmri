#' MS Data Ids
#'
#' @param cohort cohort (cross-sectional or longitudinal) of data
#'
#' @return A vector of IDs
#' @export
#'
#' @examples
#' ms_ids()
#' ms_ids("longitudinal")
ms_ids = function(
  cohort = c("cross_sectional", "longitudinal")
) {
  cohort = match.arg(cohort)
  n_patients = switch(
    cohort,
    cross_sectional = 15,
    longitudinal = 20)
  sprintf("patient%02.0f", seq(n_patients))
}
