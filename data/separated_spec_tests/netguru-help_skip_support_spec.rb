require 'rails_helper'

describe SkipSupport do
  let(:candidates) { 2.times.map { double(:user, present?: true) } }
  let(:support) { double(:support, user: double(:user)) }
  let(:skip!) { subject.commence! }

  subject { described_class.new support }

  describe '#skip!' do
    context 'with available candidates' do
      before { allow(subject).to receive(:candidates).and_return(candidates) }

      it 'assigns and save new user to support' 


      it 'sends email out to the new assignee' 


      it 'leaves a comment about skipped support' 

    end
  end

  describe '#success?' do
    it 'is true when there are some candidates available' 


    it 'is false when there is no candidate available' 

  end

  def any_of(allowed_values)
    satisfy do |arg|
      expect(allowed_values).to include arg
    end
  end
end


