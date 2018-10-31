require 'spec_helper'

describe ChefSpec::Matchers::LinkToMatcher do
  let(:from) { '/var/www' }
  let(:to)   { '/var/html' }
  let(:link) do
    Chef::Resource::Link.new(from).tap do |link|
      link.to(to)
      link.perform_action(:create)
    end
  end
  subject { described_class.new(to) }

  describe '#failure_message' do
    it 'has the right value' 

  end

  describe '#failure_message_when_negated' do
    it 'has the right value' 

  end

  describe '#description' do
    it 'has the right value' 

  end

  context 'when the link is correct' do
    it 'matches' 


    it 'adds the link to the coverage report' 

  end

  context 'when the link is not correct' do
    subject { described_class.new('/nope/bad/path/bro') }

    it 'does not match' 

  end
end

