require "rails_helper"

RSpec.describe ProcurementAreasController, type: :controller do
  before do
    sign_in(create(:admin_user))
  end

  describe "POST create" do
    it "saves the procurement area and redirects to index" 


    it "redirects to new if the procurement area could not be created" 

  end

  describe "PATCH update" do
    it "updates the procurement area and redirects to index" 


    it "redirects to new if the procurement area could not be update" 

  end

  def stub_procurement_area(method:, return_value:)
    allow(mock_procurement_area).to receive(method).and_return(return_value)
  end

  def mock_procurement_area
    @_mock ||= double(:mock_procurement_area)
  end

  def stub_procurement_area_lookup
    allow(ProcurementArea).to receive(:find).
      and_return(mock_procurement_area)
  end

  def procurement_area_params
    attributes_for(:procurement_area)
  end
end

