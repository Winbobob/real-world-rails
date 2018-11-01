require 'rails_helper'

describe AskForSupport do

  subject { described_class.new(User.new, Topic.new, {}) }
  let(:user) { User.new }

  describe '#commence!' do
    before do
      allow(subject).to receive(:supporter).and_return(user)
      allow(subject).to receive(:deliver_email).and_return(true)
      allow(subject).to receive(:send_notification).and_return(true)
    end

    it "saves new_support" 


    it "sends email out" 


    it "sends notification" 

  end
end

