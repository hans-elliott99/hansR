#' Load data as a matrix
#' source: https://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html
#'
#' This function loads a file as a matrix. It assumes the first column contains
#' the rownames and the subsequent columns are the sample identifiers. Rows with
#' duplicated rownames will be dropped with the first one being kept.
#'
#' @param infile Path to the input file
#' @return A matrix of the infile
#' @export
load_mat <- function(infile){
  in.dt <- data.table::fread(infile, header = TRUE)
  in.dt <- in.dt[!duplicated(in.dt[, 1]), ]
  in.mat <- as.matrix(in.dt[, -1, with = FALSE])
  rownames(in.mat) <- unlist(in.dt[, 1, with = FALSE])
  in.mat
}

