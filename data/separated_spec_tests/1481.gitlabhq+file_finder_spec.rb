require 'spec_helper'

describe Gitlab::FileFinder do
  describe '#find' do
    let(:project) { create(:project, :public, :repository) }
    subject { described_class.new(project, project.default_branch) }

    it_behaves_like 'file finder' do
      let(:expected_file_by_name) { 'files/images/wm.svg' }
      let(:expected_file_by_content) { 'CHANGELOG' }
    end

    it 'filters by name' 


    it 'filters by path' 


    it 'filters by extension' 

  end
end
