#config/initializers/jsonapi_resouces.rb
require 'jsonapi/resource_controller'


JSONAPI.configure do |config|
  config.resource_key_type = :string
end


module JSONAPI
  class ResourceController

    def create_operations_processor
      JSONAPI::OperationsProcessor.new
    end

  end
end