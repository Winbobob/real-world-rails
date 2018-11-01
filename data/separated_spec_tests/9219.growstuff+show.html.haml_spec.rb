require 'rails_helper'

describe "scientific_names/show" do
  before(:each) do
    controller.stub(:current_user) { nil }
    @scientific_name = assign(:scientific_name,
      FactoryBot.create(:zea_mays))
  end

  it "renders attributes in <p>" 


  context 'signed in' do
    before :each do
      @wrangler = FactoryBot.create(:crop_wrangling_member)
      sign_in @wrangler
      controller.stub(:current_user) { @wrangler }
      render
    end

    it 'should have an edit button' 

  end
end

