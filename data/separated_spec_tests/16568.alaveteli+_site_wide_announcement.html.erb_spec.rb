require 'spec_helper'

describe 'general/_site_wide_announcement.html.erb' do

  let(:announcement) do
    FactoryBot.
      create(:announcement,
             content: '<b>Exciting news!</b> <script>alert("!")</script>')
  end

  before do
    allow(view).to receive(:current_user).and_return(FactoryBot.build(:user))
  end

  describe 'displaying an announcement' do

    it 'shows the announcement' 


    it 'strips out dangerous tags' 


  end

end

