require 'spec_helper'

describe Gitlab::Template::IssueTemplate do
  let(:project) { create(:project, :repository, create_templates: :issue) }

  describe '.all' do
    it 'strips the md suffix' 


    it 'combines the globals and rest' 

  end

  describe '.find' do
    it 'returns nil if the file does not exist' 


    it 'returns the issue object of a valid file' 

  end

  describe '.by_category' do
    it 'return array of templates' 


    context 'when repo is bare or empty' do
      let(:empty_project) { create(:project) }

      it "returns empty array" 

    end
  end

  describe '#content' do
    it 'loads the full file' 


    it 'raises error when file is not found' 


    context "when repo is empty" do
      let(:empty_project) { create(:project) }

      it "raises file not found" 

    end
  end
end

