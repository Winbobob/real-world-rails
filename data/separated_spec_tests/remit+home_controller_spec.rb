require "rails_helper"
require "support/shared_examples/controllers/concerns/listing_studies"
require "support/devise"

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    it "returns http success" 


    context "when there are some studies" do
      let!(:studies) { FactoryGirl.create_list(:study, 20) }
      let(:action) { :index }
      let(:params) { {} }

      it_behaves_like "study listing controller"
    end

    context "when a user is logged in" do
      it "sets flagged_studies_count" 

    end

    it_behaves_like "hidden study listing controller"
  end
end

