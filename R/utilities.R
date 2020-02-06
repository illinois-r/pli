remove_null_values = function(x) {
  Filter(Negate(is.null), x)
}

parse_response = function(x) {
 jsonlite::fromJSON(httr::content(x, as = "text"), flatten = TRUE)
}
