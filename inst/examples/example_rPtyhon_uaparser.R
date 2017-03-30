# devtools::install_github("cjgb/rPython-win")
# install.packages(paste0("C:/Users/",Sys.info()["login"],"/Downloads/rPython"), repos = NULL, type="source")
library(rPython)

python.load("inst/python_lib/ua_parser.py")

r_string = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.104 Safari/537.36'

json = python.call("parse_user_agent", r_string)
json

list_json = jsonlite::fromJSON(json)
list_json

