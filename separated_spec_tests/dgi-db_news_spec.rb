require 'spec_helper'

describe 'news' do

  before :all do
    Fabricate(:source_type, type: 'interaction')
    date_stamp = Date.today.stamp('April 1, 2013')
    EXTERNAL_STRINGS['news']['posts'] = [{'headline' => 'test', 'article' => 'test', 'date' => date_stamp }]
  end

  it 'loads succesfully' 



  it 'should set a cookie containing the recent post date when the news page is visited' 


end

