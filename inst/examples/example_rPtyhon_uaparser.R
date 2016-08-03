library(rPython)

python.load("C:/Alabern/ua_parser.py")

r_string = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.104 Safari/537.36'
python.call("parse_user_agent", r_string)


