require 'spec_helper'

describe Validators::DateInput do
  include Validators::DateInput

  let(:window)  { Validators::DateInput::WINDOW  + 1.days }
  let(:max_len) { Validators::DateInput::MAX_LEN          }

  it 'should raise an error if the input is above the maximum size' 


  it 'should raise an error if the input cannot be parsed as a date' 


  it 'should raise an error if date is outside the expected window' 


  it 'should raise an error if the time is outside the expected window' 


  context '#parse_datetime' do
    it 'should return a date time if input is correct' 

  end

  context '#parse_date' do
    it 'should return a date if input is correct' 

  end
end

