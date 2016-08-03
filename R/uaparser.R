# roxygen2::roxygenise()

.onLoad <- function(libname, pkgname) {
  library(rPython)
  python.load(paste0(libname, "/", pkgname, "/python_lib/ua_parser.py"))
}

#' @title parse_user_agent
#' @export
parse_user_agent <- function (
  r_string
) {
  output_string = python.call("parse_user_agent", r_string)
  message(output_string)
  return (jsonlite::fromJSON(output_string))
}