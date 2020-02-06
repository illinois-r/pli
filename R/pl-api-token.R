pl_token = function() {
  api_token = Sys.getenv("PRAIRIELEARN_API_TOKEN")
  if (identical(api_token, "")) {
    stop("\n`PRAIRIELEARN_API_TOKEN` environment variable must contain your access token. \n",
         "Please create one at <https://prairielearn.engr.illinois.edu/pl/settings> \n",
         "Add it to ~/.Renviron with `usethis::edit_r_environ()` \n",
         call. = FALSE)
  }
  api_token
}
