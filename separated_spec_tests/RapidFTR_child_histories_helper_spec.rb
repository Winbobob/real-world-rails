require 'spec_helper'

describe ChildHistoriesHelper, :type => :helper do
  before do
    @view = Object.new
    @view.extend(ChildHistoriesHelper)
    @view.extend(ChildrenHelper)
  end

  it "should have change wording when 'from' and 'to' values exist" 


  it "should have initial wording when 'from' value is empty" 


  it "should have initial wording when 'from' value is nil" 


  describe '#new_value_for' do

    it 'should get the flag change message from the history' 


    it 'should return an empty string if no changes have been made' 

  end
end

