# roxygen2::roxygenise()

.py_ua_parser <- NULL

.onLoad <- function(libname, pkgname) {
  # library(rPython)
  # rPython::python.load(paste0(libname, "/", pkgname, "/python_lib/ua_parser.py"))

  # if this fails try installing the uaparser python package first with: python -m pip install ua_parser
  .py_ua_parser <<- reticulate::py_run_file(paste0(libname, "/", pkgname, "/python_lib/ua_parser.py"))
  # .py_ua_parser <<- reticulate::py_run_file(paste0(.libPaths()[1], "/uaparser/python_lib/ua_parser.py"))
}

get_empty_list <- function (x) {
  list(
    device=list(
      brand=NA,
      model=NA,
      family=NA
      ),
    os=list(
      major=NA,
      patch_minor=NA,
      minor=NA,
      family=NA,
      patch=NA
      ),
    user_agent=list(
      major=NA,
      minor=NA,
      family=NA,
      patch=NA
      ),
    string=NA
  )
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
        output = append(output, list(get_empty_list(r_string)))
      } else {
        # output_string = python.call("parse_user_agent", r_string)
        output_string = .py_ua_parser$parse_user_agent(iconv(r_string, to='ASCII//TRANSLIT'))
        output = append(output, list(jsonlite::fromJSON(output_string)))
      }
    }
    output = lapply(output, function(x) lapply(x, function(x) lapply(x, function(x) ifelse(is.null(x), NA, x))))
  } else {
    r_string = str_user_agent
    if (is.na(r_string)) {
      output = get_empty_list(r_string)
    } else {
      # output_string = python.call("parse_user_agent", str_user_agent)
      output_string = .py_ua_parser$parse_user_agent(str_user_agent)
      output = jsonlite::fromJSON(output_string)
    }
    output = lapply(output, function(x) lapply(x, function(x) ifelse(is.null(x), NA, x)))
  }
  return (output)
}
