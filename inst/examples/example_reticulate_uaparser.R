# devtools::install_github("rstudio/reticulate")
library(reticulate)

py = py_run_file("inst/python_lib/ua_parser.py")

r_string = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.104 Safari/537.36'

json = py$parse_user_agent(r_string)
json

list_json = jsonlite::fromJSON(json)
list_json

library(reticulate)

py = py_run_file(paste0(main_folder, cfg$main[i]))