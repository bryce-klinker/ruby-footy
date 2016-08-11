require 'json'

def get_response_as_json
  JSON.parse last_response.body
end
