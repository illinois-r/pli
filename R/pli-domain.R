# Not sure if this will ever change, but... Let's be safe.
prairielearn_domain="https://prairielearn.engr.illinois.edu"

## TODO: figure out a good way of removing the a double / (e.g. //) in a URL.

pl_api_url = function() {
  paste(
    Sys.getenv("PRAIRIELEARN_DOMAIN", prairielearn_domain),
    "pl/api/v1",
    sep = "/"
  )
}

