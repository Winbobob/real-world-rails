require 'spec_helper'

describe SystemVariablesController, :type => :controller do

  before :each do
    fake_admin_login
    SystemVariable.all.all.each(&:destroy)
  end

  it 'should render the defined system variables' 


  it 'should update defined system variables' 


  it 'should trigger update of potential matches when the score threshold changes.' 


  it 'should not trigger an update of potential matches when the other variables are updated' 


  it 'should not trigger an update for potential matches when the score threshold value doesnot change' 

end

