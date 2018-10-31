require 'rails_helper'

describe Analyzer do
  let(:analyzer) { double(:analyzer, track: true, identify: true) }
  let(:subject) { described_class.new(analyzer) }
  let(:user) { double(:user, id: "some_id", ip_address: "some_ip") }

  describe '#track' do
    it 'should identify the user and track the correct attributes' 

  end

  describe '#track_with_attributes' do
    it 'should identify the user and track the attributes given' 

  end

  describe '#track_chain' do
    it 'should identify the user and track all the events given with the correct attributes' 

  end
end

