require 'spec_helper'

describe 'The CLI', :type => :integration do
  before do
    @result = %x(rspec -fd examples/*.feature)
  end

  it "shows the correct description" 


  it "prints out failures and successes" 


  it "includes features in backtraces" 


  it "includes the right step name when steps call steps" 


  it 'prints line numbers of pending/failure scenario' 


  it 'conforms to line-number option' 

end

