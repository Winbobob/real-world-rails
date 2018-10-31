require 'spec_helper'

describe Import::GoogleCodeController do
  include ImportSpecHelper

  let(:user) { create(:user) }
  let(:dump_file) { fixture_file_upload(Rails.root + 'spec/fixtures/GoogleCodeProjectHosting.json', 'application/json') }

  before do
    sign_in(user)
  end

  describe "POST callback" do
    it "stores Google Takeout dump list in session" 

  end

  describe "GET status" do
    before do
      @repo = OpenStruct.new(name: 'vim')
      stub_client(valid?: true)
    end

    it "assigns variables" 


    it "does not show already added project" 


    it "does not show any invalid projects" 

  end
end

