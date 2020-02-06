#' Export grades to Compass2g Format
#'
#' @param x          Data set
#' @param path       Name and path to save CSV.
#' @param assignment Pull point data
#'
#' @export
grade_format_compass2g = function(x, path, assignment = "Points") {
  x = x[, c("user_uid", "points")]

  # Remove missing
  x$points[is.na(x$points)] = 0

  # Remove e-mail part
  x$user_uid = gsub("@.*","", x$user_uid)

  # Rename
  names(x)[names(x) == "user_uid"] <- "Username"

  # Write table
  write.table(x, path, sep = ",", row.names = FALSE)
}
