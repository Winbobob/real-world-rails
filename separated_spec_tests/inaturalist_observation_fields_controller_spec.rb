require File.dirname(__FILE__) + '/../spec_helper'

describe ObservationFieldsController do
  describe "destroy" do
    it "should not work if the field is in use" 

  end

  describe "merge_field" do
    let(:user) { make_curator }
    let(:of) { ObservationField.make! }
    let(:reject) { ObservationField.make! }
    it "should only work for curators" 


    it "should destroy the primary resource" 


    it "should keep requested fields from the keeper" 


    it "should keep requested fields from the reject" 


    it "should allow merged allowed_values" 

  end
end

