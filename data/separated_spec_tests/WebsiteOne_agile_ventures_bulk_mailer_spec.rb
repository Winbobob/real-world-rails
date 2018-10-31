require 'spec_helper'

describe AgileVentures::BulkMailer do
  before(:each) do
    2.times { FactoryBot.create(:user) }

    @opts = { subject: 'my subject',
              heading: 'my heading',
              content: 'my multiline\ntext block' }
  end

  it 'can be initialized' 


  it 'will return num sent mails' 


  it 'responds to #num_sent' 


  it 'responds to #used_addresses' 


  it 'returns email-addresses' 


  it 'creates and applies instance vars' 

  
  describe 'missing arguments' do
    it 'raises KeyError without :heading' 

  
    it 'raises KeyError without :content' 

  end
  
end

