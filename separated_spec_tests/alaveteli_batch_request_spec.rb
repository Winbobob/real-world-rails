# -*- encoding : utf-8 -*-
require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/../alaveteli_dsl')

def start_batch_request
  visit(alaveteli_pro_batch_request_authority_searches_path)

  # Add some bodies to the batch
  fill_in "Search for an authority by name", with: "Example"
  click_button "Search"
  # We can't rely on Xapina to give us a deterministic search result ordering
  # so we pluck some bodies out of the results we see
  first_page_results = search_results
  first_search_result_body = PublicBody.find_by(name: first_page_results.first)
  last_search_result_body = PublicBody.find_by(name: first_page_results.last)
  add_body_to_pro_batch(first_search_result_body)
  add_body_to_pro_batch(last_search_result_body)
  click_link "Next →"
  second_page_result = search_results.first
  second_page_search_result_body = PublicBody.find_by(name: second_page_result)
  add_body_to_pro_batch(second_page_search_result_body)

  @selected_bodies = [
    first_search_result_body,
    last_search_result_body,
    second_page_search_result_body
  ]

  click_button "Write request"

  # Writing page
  expect(page).to have_content("3 recipients")
end

def fill_in_batch_message
  fill_in "Subject", with: "Does the pro batch request form work?"
  fill_in "Your request", with: "Dear [Authority name], this is a batch request."
  select "3 Months", from: "Privacy"
end

def search_results
  page.find_all(".batch-builder__authority-list__authority__name").map(&:text)
end

describe "creating batch requests in alaveteli_pro" do
  let(:pro_user) do
    user = FactoryGirl.create(:pro_user)
    AlaveteliFeatures.backend.enable_actor(:pro_batch_access, user)
    user
  end

  let!(:pro_user_session) { login(pro_user) }
  let!(:authorities) { FactoryGirl.create_list(:public_body, 26) }

  before :all do
    get_fixtures_xapian_index
  end

  before do
    update_xapian_index
  end

  after do
    authorities.each do |authority|
      authority.destroy
    end
    update_xapian_index
  end

  it "allows the user to build a list of authorities" 


  it "allows the user to save a draft of a message" 


  it "allows the user to save a draft of a message with no embargo" 


  it "allows the user to go back and edit the bodies in the batch" 


  it "allows the user to preview a message before sending" 


  it "allows the user to edit a message after previewing it" 


  it "shows errors if the user tries to preview with fields left blank" 


  it "allows the user to save a draft even with fields left blank" 


  it "provides a template for the users request" 


  it "allows the user to create a batch request" 

end

describe "managing embargoed batch requests" do
  let(:pro_user) { FactoryGirl.create(:pro_user) }
  let!(:pro_user_session) { login(pro_user) }
  let!(:batch) do
    batch = FactoryGirl.create(
      :embargoed_batch_request,
      user: pro_user,
      public_bodies: FactoryGirl.create_list(:public_body, 2))
    batch.create_batch!
    batch
  end

  describe "managing embargoes on a batch request's page" do

    it "allows the user to extend all the embargoes that are near expiry" 


    it "allows the user to publish all the requests" 

  end

  describe "managing embargoes on a specific request in a batch" do
    let(:info_request) { batch.info_requests.first }

    it "allows the user to extend all expiring embargoes from a specific request" 


    it "allows the user to publish a request" 

  end
end

