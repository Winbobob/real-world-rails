require 'rails_helper'

describe "members/_location" do
  context "member with location" do
    let(:member) { FactoryBot.create(:london_member) }

    before(:each) { render partial: 'members/location', locals: { member: member } }

    it 'shows location if available' 


    it "links to the places page" 

  end

  context "member with no location" do
    before(:each) do
      member = FactoryBot.create(:member)
      render partial: 'members/location', locals: { member: member }
    end

    it 'shows unknown location' 


    it "doesn't link anywhere" 

  end
end

