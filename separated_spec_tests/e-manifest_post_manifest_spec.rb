require 'rails_helper'
include JsonSchemaSpecHelper
include ExampleJsonHelper

describe 'JSON schemas' do
  before(:all) do
    register_schemas_by_uri
  end

  describe 'date fields' do
    it 'allows valid date time strings' 


    it 'gives errors on invalid date time strings' 

  end

  def validate_schema(schema, example)
    JSON::Validator.fully_validate(schema, example, errors_as_objects: true, strict: true, require_all: false)  end
end

