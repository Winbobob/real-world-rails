# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::OptionTypesController, type: :request do
    let(:attributes) { [:id, :name, :position, :presentation] }
    let!(:option_value) { create(:option_value) }
    let!(:option_type) { option_value.option_type }

    before do
      stub_authentication!
    end

    def check_option_values(option_values)
      expect(option_values.count).to eq(1)
      expect(option_values.first).to have_attributes([:id, :name, :presentation,
                                                      :option_type_name, :option_type_id])
    end

    it "can list all option types" 


    it "can search for an option type" 


    it "can retrieve a list of specific option types" 


    it "can list a single option type" 


    it "cannot create a new option type" 


    it "cannot alter an option type" 


    it "cannot delete an option type" 


    context "as an admin" do
      sign_in_as_admin!

      it "can create an option type" 


      it "cannot create an option type with invalid attributes" 


      it "can update an option type" 


      it "cannot update an option type with invalid attributes" 


      it "can delete an option type" 

    end
  end
end

