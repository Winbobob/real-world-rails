require 'spec_helper'

describe Metrics::Mail do
  let(:email) { double Email }

  before(:each) do
    allow(Email).to receive(:waiting).and_return([email])
    allow(Email).to receive(:abandoned).and_return([])

    subject.collect!
  end 

  it '#collect! - updates the email and token metrics' 


  context '#email_error?' do
    it 'returns false if abandoned/waiting emails within threshold' 


    it 'returns true if abandoned/waiting emails within threshold' 

  end

  context '#token_error?' do
    it 'returns false if answered tokens within threshold' 


    it 'returns true if answered tokens outside threshold' 

  end
end

