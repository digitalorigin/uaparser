from ua_parser import user_agent_parser

import json

def parse_user_agent(x): 
    parsed_string = user_agent_parser.Parse(x)
    parsed_string = str(json.dumps(parsed_string))
    return parsed_string
