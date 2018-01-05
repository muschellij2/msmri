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


#' Cross-sectional Demographic Data
#'
#' @format A \code{data.frame} with 6 columns, which are:
#' \describe{
#' \item{id}{patient identifier}
#' \item{age}{age of patient}
#' \item{sex}{sex of the patient}
#' \item{ms_type}{type of MS diagnosis}
#' \item{edss}{Expanded Disability Status Scale (EDSS)}
#' \item{criteria}{criteria for diagnosis of MS}
#' }
"cs_demog"


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

#' Longitudinal Demographic Data
#'
#' @format A \code{data.frame} with 6 columns, which are:
#' \describe{
#' \item{id}{patient identifier}
#' \item{age}{age of patient, at first visit}
#' \item{sex}{sex of the patient}
#' \item{ms_type}{type of MS diagnosis}
#' \item{days_between_studies}{number of days between study 1 and study 2}
#' }
"long_demog"
