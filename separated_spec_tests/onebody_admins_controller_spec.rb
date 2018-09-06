require 'rails_helper'

describe Administration::AdminsController, type: :controller do
  before do
    @admin = FactoryGirl.create(:person, :super_admin)
    @user = FactoryGirl.create(:person)
  end

  it 'should add administrator' 


  it 'should remove administrator' 

end

