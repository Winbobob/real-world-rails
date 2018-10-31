require 'spec_helper'

describe Gitlab::FileFinder do
  describe '#find' do
    let(:project) { create(:project, :public, :repository) }
    let(:finder) { described_class.new(project, project.default_branch) }

    it 'finds by name' 


    it 'finds by content' 

  end
end

