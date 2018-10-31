# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminPublicBodyChangeRequestsController, "editing a change request" do

  it "should render the edit template" 


end

describe AdminPublicBodyChangeRequestsController, 'updating a change request' do

  before do
    @change_request = FactoryGirl.create(:add_body_request)
  end

  it 'should close the change request' 


  context 'when a response and subject are passed' do

    it 'should send a response email to the user who requested the change' 


  end

  context 'when no response or subject are passed' do

    it 'should send a response email to the user who requested the change' 

  end

end

