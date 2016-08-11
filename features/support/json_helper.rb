require 'json'

def get_response_as_array
  json_array = JSON.parse last_response.body
  json_array.map{ |i| JSON.parse i }
end

def get_response_as_hash
  JSON.parse last_response.body
end