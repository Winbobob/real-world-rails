require 'rails_helper'

describe Admin::ColorSchemesController do
  it "is a subclass of AdminController" 


  context "while logged in as an admin" do
    let(:admin) { Fabricate(:admin) }
    let(:valid_params) { { color_scheme: {
        name: 'Such Design',
        colors: [
          { name: 'primary', hex: 'FFBB00' },
          { name: 'secondary', hex: '888888' }
        ]
      }
    } }

    before do
      sign_in(admin)
    end

    describe "#index" do
      it "returns JSON" 

    end

    describe "#create" do
      it "returns JSON" 


      it "returns failure with invalid params" 

    end

    describe "#update" do
      let(:existing) { Fabricate(:color_scheme) }

      it "returns success" 


      it "returns failure with invalid params" 

    end

    describe "#destroy" do
      let!(:existing) { Fabricate(:color_scheme) }

      it "returns success" 

    end
  end
end

