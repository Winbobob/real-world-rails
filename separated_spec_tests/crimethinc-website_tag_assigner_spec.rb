require "rails_helper"

describe TagAssigner do
  describe 'parse_glob' do
    subject { described_class.parse_glob(glob) }

    it 'can parse a single tag name' 


    it 'can parse a comma separated list of tags' 


    it 'will drop blank tags' 

  end

  describe 'assign_tags_to!' do
    subject { described_class.new(tag1, tag2, tag3) }
    let(:tag1) { double }
    let(:tag2) { double }
    let(:tag3) { double }
    let(:taggable) { double }

    it 'assigns tags which have not been assigned' 

  end
end

