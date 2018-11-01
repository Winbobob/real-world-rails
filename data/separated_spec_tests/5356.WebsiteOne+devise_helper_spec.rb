require 'spec_helper'


describe DeviseHelper do

  describe 'when no error' do

    before(:each) do
      helper.stub_chain(:resource, :errors, :empty?).and_return true
    end

    it '#devise_error_messages_flash' 


    it '#devise_error_simple_message' 


  end

  describe 'when there are errors' do
    before(:each) do
      @messages = ["error 1","error 2" ]
      helper.stub_chain(:resource, :errors, :empty?).and_return false
      helper.stub_chain(:resource, :errors, :full_messages).and_return @messages
    end

    it '#devise_error_messages_flash' 

    it '#devise_error_simple_message' 

  end

end

def acts_well_when_no_error?(method_name)
  result = helper.send(method_name)
  expect(result).to eq ""
end

