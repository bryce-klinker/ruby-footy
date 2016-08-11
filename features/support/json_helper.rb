require 'json'

def get_response_as_json_array
  json_array = JSON.parse last_response.body
  json_array.map{ |i| JSON.parse i }
end