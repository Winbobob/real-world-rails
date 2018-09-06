require 'rails_helper'
require 'has_errors'

describe HasErrors do

  class ErrorTestClass
    include HasErrors
  end

  let(:error_test) { ErrorTestClass.new }
  let(:title_error) { "Title can't be blank" }

  # No title is invalid
  let(:invalid_topic) { Fabricate.build(:topic, title: '') }

  it "has no errors by default" 


  context "validate_child" do
    it "adds the errors from invalid AR objects" 


    it "doesn't add the errors from valid AR objects" 

  end

  context "rollback_from_errors!" do
    it "triggers a rollback" 

  end

  context "rollback_with_error!" do
    it "triggers a rollback" 

  end

end

