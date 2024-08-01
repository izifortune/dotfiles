import json
from urllib.parse import urlparse


# Load the Postman collection JSON file
with open('/Users/fortunatof/Downloads/OMS.postman_collection.json', 'r') as file:
    postman_collection = json.load(file)

# Open the .rest file for writing
with open('/Users/fortunatof/Downloads/OMS.rest', 'w') as rest_file:
    rest_variables = ""
    for variable in postman_collection['variable']:
        name = variable['key']
        value = variable['value']
        rest_variables += f"{name} = {value}\n"
    rest_variables += f"--silent\n"
    rest_variables += f"--\n"

    rest_file.write(rest_variables)
    for item in postman_collection['item']:
        for subitem in item['item']:
            request = subitem['request']
            method = request['method']
            url = request['url']['raw']
            headers = request.get('header', [])
            body = request.get('body', {}).get('raw', '')
            auth = request.get('auth', None)

            parsed_url = urlparse(url)
            host = parsed_url.netloc
            path = parsed_url.path
            query = parsed_url.query
            if query:
                query = f"?{query}"


            rest_request = ""

            # Write the request method and URL
            rest_request += f"https://{host}\n"

            for header in headers:
                rest_request += f"{header['key']}: {header['value']}\n"

            if auth:
                if auth['type'] == 'basic':
                    username = auth['basic'][0]['value']
                    password = auth['basic'][1]['value']
                    rest_request += f"Authorization: Basic {username}:{password}\n"
                if auth['type'] == 'bearer':
                    token = auth['bearer'][0]['value']
                    rest_request += f"Authorization: {token}\n"

            rest_request += f"{method} {path}{query}\n"


            # Write the body if it exists
            if body:
                rest_request += "\n"
                rest_request +=body
            
            # Separate requests with a new line
            rest_request += "\n\n"

            rest_file.write(rest_request)


