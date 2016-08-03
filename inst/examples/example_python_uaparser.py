from ua_parser import user_agent_parser

ua_string = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.104 Safari/537.36'
parsed_string = user_agent_parser.Parse(ua_string)

print(parsed_string)
