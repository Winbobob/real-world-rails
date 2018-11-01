require 'rails_helper'

describe Admin::PermalinksController do

  it "is a subclass of AdminController" 


  let(:admin) { Fabricate(:admin) }

  before do
    sign_in(admin)
  end

  describe '#index' do
    it 'filters url' 


    it 'filters external url' 


    it 'filters url and external url both' 

  end
end

