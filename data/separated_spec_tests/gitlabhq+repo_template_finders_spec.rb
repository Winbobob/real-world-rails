require 'spec_helper'

describe Gitlab::Template::Finders::RepoTemplateFinder do
  set(:project) { create(:project, :repository) }

  let(:categories) { { 'HTML' => 'html' } }

  subject(:finder) { described_class.new(project, 'files/', '.html', categories) }

  describe '#read' do
    it 'returns the content of the given path' 


    it 'raises an error if the path does not exist' 

  end

  describe '#find' do
    it 'returns the full path of the found template' 

  end

  describe '#list_files_for' do
    it 'returns the full path of the found files' 

  end
end

