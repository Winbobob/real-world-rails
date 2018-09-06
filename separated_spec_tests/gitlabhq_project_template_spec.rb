require 'spec_helper'

describe Gitlab::ProjectTemplate do
  describe '.all' do
    it 'returns a all templates' 

  end

  describe '.find' do
    subject { described_class.find(query) }

    context 'when there is a match' do
      let(:query) { :rails }

      it { is_expected.to be_a(described_class) }
    end

    context 'when there is no match' do
      let(:query) { 'no-match' }

      it { is_expected.to be(nil) }
    end
  end

  describe 'instance methods' do
    subject { described_class.new('phoenix', 'Phoenix Framework', 'Phoenix description', 'link-to-template') }

    it { is_expected.to respond_to(:logo, :file, :archive_path) }
  end

  describe 'validate all templates' do
    set(:admin) { create(:admin) }

    described_class.all.each do |template|
      it "#{template.name} has a valid archive" 


      context 'with valid parameters' do
        it 'can be imported' 

      end
    end
  end
end

