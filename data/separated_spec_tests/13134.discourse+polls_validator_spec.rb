require 'rails_helper'

describe ::DiscoursePoll::PollsValidator do
  let(:post) { Fabricate(:post) }
  subject { described_class.new(post) }

  describe "#validate_polls" do
    it "should ensure that polls have unique names" 


    it 'should ensure that polls have unique options' 


    it 'should ensure that polls have at least 2 options' 


    it "should ensure that polls' options do not exceed site settings" 


    describe 'multiple type polls' do
      it "should ensure that min should not be greater than max" 


      it "should ensure max setting is greater than 0" 


      it "should ensure that max settings is smaller or equal to the number of options" 


      it "should ensure that min settings is not negative" 


      it "should ensure that min settings it not equal to zero" 


      it "should ensure that min settings is not equal to the number of options" 


      it "should ensure that min settings is not greater than the number of options" 

    end
  end
end

