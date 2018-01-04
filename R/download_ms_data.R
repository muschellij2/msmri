
#' Download MS Imaging Data
#'
#' @inheritParams ms_data
#' @param id ID to download (either 01 or patient01 or 1)
#' @param outdir output directory
#' @param overwrite Should the files be overwritten if already existing?
#'
#' @return A \code{data.frame} of imaging modalities and masks
#' @export
#'
#' @examples \dontrun{
#' res = download_ms_patient(id = "patient01")
#' res = download_ms_patient(
#' id = "patient01",
#' data = "coregistered",
#' cohort = "longitudinal")
#' }
#' @importFrom httr GET write_disk warn_for_status progress
download_ms_patient = function(
  id,
  cohort = c("cross_sectional", "longitudinal"),
  data = c("raw", "coregistered"),
  outdir = tempfile(),
  overwrite = FALSE) {

  urls = ms_patient_urls(
    id = id,
    cohort = cohort,
    data = data)
  if (!dir.exists(outdir)) {
    dir.create(outdir, showWarnings = FALSE, recursive = TRUE)
  }
  outfiles = file.path(outdir, basename(urls))
  f_not_e = !file.exists(outfiles)
  if (!overwrite) {
    outfiles = outfiles[f_not_e]
  }
  if (any(f_not_e)) {
    urls = urls[f_not_e]
    res = mapply(function(url, outfile) {
      res = httr::GET(
        url = url,
        httr::write_disk(path = outfile, overwrite = overwrite),
        if (interactive()) httr::progress()
      )
      httr::warn_for_status(res)
    }, urls, outfiles)
  }
  fe = file.exists(outfiles)
  if (!all(fe)) {
    warning("Not all files seem to be downloaded - may be an error")
  }
  return(outfiles)

}

#' @rdname download_ms_patient
#' @export
ms_patient_urls = function(
  id,
  cohort = c("cross_sectional", "longitudinal"),
  data = c("raw", "coregistered")) {

  if (is.numeric(id) || is.integer(id)) {
    id = sprintf("patient%02.0f", id)
  }

  dat = ms_data(cohort = cohort,
                data = data)
  have_data = dat$id %in% id
  if (!any(have_data)) {
    stop("That ID is not in the cohort/data you requested")
  }
  dat = dat[ have_data, ]
  urls = c(dat$url, unique(c(dat$Brain_Mask_url, dat$Gold_Standard_url)))
  return(urls)
}
