require 'spec_helper'

describe 'admin_general/_announcement.html.erb' do

  let(:announcement) do
    FactoryBot.
      create(:announcement,
             visibility: 'admin',
             content: '<b>Exciting news!</b> <script>alert("!")</script>')
  end

  describe 'displaying an announcement' do

    it 'shows the announcement' 


    it 'strips out dangerous tags' 


  end

end

