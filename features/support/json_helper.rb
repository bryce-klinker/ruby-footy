require 'json'
require 'ostruct'

def get_response_as_hash
  JSON.parse last_response.body, object_class: OpenStruct
end
