require 'spec_helper'

describe 'alaveteli_pro/dashboard/_announcements.html.erb' do

  let(:announcement) do
    FactoryBot.
      create(:announcement,
             content: '<b>Exciting news!</b> <script>alert("!")</script>')
  end

  before do
    assign :user, FactoryBot.create(:pro_user)
    assign :announcements, [announcement]
  end

  describe 'displaying an announcement' do

    it 'shows the announcement' 


    it 'strips out dangerous tags' 


  end

end

