require "rails_helper"

RSpec.describe OrganisationsController do
  before do
    sign_in(create(:admin_user))
  end

  describe "POST create" do
    it "saves the organisation and redirects to index" 


    it "redirects to new if the organisation could not be created" 

  end

  describe "PATCH update" do
    it "updates the organisation and redirects to index" 


    it "redirects to edit if the organisation could not be updated" 

  end

  def stub_organisation(method:, return_value:)
    allow(mock_organisation).to receive(method).and_return(return_value)
  end

  def mock_organisation
    @_mock ||= double(:mock_organisation)
  end

  def stub_organisation_lookup
    allow(Organisation).to receive(:find).
      and_return(mock_organisation)
  end

  def organisation_params
    attributes_for(:organisation)
  end
end

