#' Raw Cross-sectional Data
#'
#' @format A \code{data.frame} with 3 columns, which are:
#' \describe{
#' \item{file}{filename, necessary for downloading data, along with the URL}
#' \item{mod}{imaging modality}
#' \item{id}{patient identifier}
#' }
"cs_raw"

#' Coregistered Cross-sectional Data
#'
#' @format A \code{data.frame} with 3 columns, which are:
#' \describe{
#' \item{file}{filename, necessary for downloading data, along with the URL}
#' \item{mod}{imaging modality}
#' \item{id}{patient identifier}
#' }
"cs_coreg"


#' Raw Longitudinal Data
#'
#' @format A \code{data.frame} with 4 columns, which are:
#' \describe{
#' \item{file}{filename, necessary for downloading data, along with the URL}
#' \item{mod}{imaging modality}
#' \item{id}{patient identifier}
#' \item{Gold_Standard}{filename of the gold standard lesion change}
#' }
"long_raw"

#' Coregistered Longitudinal Data
#'
#' @format A \code{data.frame} with 5 columns, which are:
#' \describe{
#' \item{file}{filename, necessary for downloading data, along with the URL}
#' \item{mod}{imaging modality}
#' \item{id}{patient identifier}
#' \item{Brain_Mask}{filename of the brain mask}
#' \item{Gold_Standard}{filename of the gold standard lesion change}
#' }
"long_coreg"

