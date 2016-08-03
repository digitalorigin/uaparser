# roxygen2::roxygenise()

.onLoad <- function(libname, pkgname) {
  library(rPython)
  python.load(paste0(libname, "/", pkgname, "/python_lib/ua_parser.py"))
}

#' @title parse_user_agent
#' @export
parse_user_agent <- function (
  str_user_agent
) {
  if (length(str_user_agent)>1) {
    output = list()
    for (r_string in str_user_agent) {
      if (is.na(r_string)) {
        output = append(output, list(NA))
      } else {
        output_string = python.call("parse_user_agent", r_string)
        output = append(output, list(jsonlite::fromJSON(output_string)))
      }
    }
  } else {
    if (is.na(r_string)) {
      output = NA
    } else {
      output_string = python.call("parse_user_agent", str_user_agent)
      output = jsonlite::fromJSON(output_string)
    }
  }
  return (output)
}