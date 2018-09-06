# EDSC-15 As a user, I want to search for collections by simple temporal date
#         range so that I may limit my results the relevant time span

require "spec_helper"

describe "Temporal" do
  before :each do
    load_page :search
  end

  # TODO: RDA // These modals don't appear appear in webkit
  # so testing visibility of the items won't work (Failure 
  # was being masked by a failed assertion in the before block)
  # context 'When opening the temporal dropdown' do
  #   before :all do
  #     load_page :search
  #     click_link 'Temporal'
  #   end

  #   it 'displays the temporal dropdown' do
  #     expect(page).to have_content('Start')
  #   end

  #   context 'Then opening the Spatial dropdown' do
  #     before do
  #       click_link 'Spatial'
  #     end

  #     it 'closes the temporal dropdown' do
  #       expect(page).to have_no_content('Start')
  #     end
  #   end
  # end

  context "range selection" do
    it "allows the user to search from a start date time to the present" 


    it "allows the user to search up to the end date time" 


    it "allows the user to search from a start date time to an end date time" 


    it "allows the user to clear the date time range" 


    it "validates incorrect user input" 

  end

  context "recurring range selection" do
    it "allows the user to search by recurring date time range" 


    it 'allows the user to clear the recurring date time search' 


    it "validates incorrect user input" 


    it "validates both start and end are present" 

  end
end

