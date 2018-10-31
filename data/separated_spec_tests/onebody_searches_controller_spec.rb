require 'rails_helper'

describe SearchesController, type: :controller do
  before do
    @user = FactoryGirl.create(:person)
    @person = FactoryGirl.create(:person, alias: 'Tim', first_name: 'Timothy', last_name: 'Morgan')
  end

  it 'renders the create template' 


  context 'when direct=true is specified' do
    it 'redirects to the person if the name matches' 

  end
end

