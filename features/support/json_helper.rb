require 'json'

def get_response_as_hash
  JSON.parse last_response.body
end
