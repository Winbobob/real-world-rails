require 'rails_helper'

describe 'harvests/index.rss.haml' do
  before(:each) do
    controller.stub(:current_user) { nil }
    @member = FactoryBot.create(:member)
    @tomato = FactoryBot.create(:tomato)
    @maize  = FactoryBot.create(:maize)
    @pp = FactoryBot.create(:plant_part)
    page = 1
    per_page = 2
    total_entries = 2
    harvests = WillPaginate::Collection.create(page, per_page, total_entries) do |pager|
      pager.replace([
                      FactoryBot.create(:harvest,
                        crop: @tomato,
                        owner: @member),
                      FactoryBot.create(:harvest,
                        crop: @maize,
                        plant_part: @pp,
                        owner: @member,
                        quantity: 2)
                    ])
    end
    assign(:harvests, harvests)
    render
  end

  it 'shows RSS feed title' 


  it "displays crop's name in title" 


  it 'shows formatted content of harvest posts' 

end

