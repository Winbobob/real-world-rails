require 'rails_helper'

describe NewsController, type: :controller do
  before do
    @person = FactoryGirl.create(:person)
    @news_item = FactoryGirl.create(:news_item)
  end

  it 'should list all items by js' 

end

