#' Perform a GET call to the PrairieLearn API
#'
#' Calls into the specified PrairieLearn endpoint with a `GET` request.
#'
#' @param url  URL with endpoint
#' @param args Values to pass onto `query` component.
#'
#' @details
#'
#' Structures the API call as:
#'
#' ```bash
#' curl -H "Private-Token: TOKEN" https://prairielearn.engr.illinois.edu/pl/api/v1/<REST_OF_PATH>
#' ```
#'
#' @keywords internal
pl_get = function(url, args = NULL) {

  # Remove null values
  args = remove_null_values(args)

  # Query against GET
  resp =
    httr::GET(
      url,
      httr::add_headers(`Private-Token` = pl_token()),
      query = args
    )

  # Check status
  httr::stop_for_status(resp)

  # Release response
  resp
}

pl_get_df = function(url, args = NULL) {
  resp = pl_get(url, args)

  parse_response(resp)
}
