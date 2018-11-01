require 'rails_helper'

describe "plantings/index" do
  let(:member) { FactoryBot.create(:member) }
  let(:garden) { FactoryBot.create(:garden, owner: member) }
  let(:tomato) { FactoryBot.create(:tomato) }
  let(:maize)  { FactoryBot.create(:maize) }

  before(:each) do
    controller.stub(:current_user) { nil }
    page = 1
    per_page = 3
    total_entries = 3
    plantings = WillPaginate::Collection.create(page, per_page, total_entries) do |pager|
      pager.replace([
                      FactoryBot.create(:planting,
                        garden: garden,
                        crop: tomato,
                        owner: member),
                      FactoryBot.create(:planting,
                        garden: garden,
                        crop: maize,
                        owner: garden.owner,
                        description: '',
                        planted_at: Time.zone.local(2013, 1, 13)),
                      FactoryBot.create(:planting,
                        garden: garden,
                        owner: garden.owner,
                        crop: tomato,
                        planted_at: Time.zone.local(2013, 1, 13),
                        finished_at: Time.zone.local(2013, 1, 20),
                        finished: true)
                    ])
    end
    assign(:plantings, plantings)
    render
  end

  it "renders a list of plantings" 


  it "displays planting time" 


  it "displays finished time" 


  it "provides data links" 


  it "displays member's name in title" 


  it "displays crop's name in title" 

end

