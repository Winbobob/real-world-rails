require 'spec_helper'

describe GraphHelper do
  describe '#get_refs' do
    let(:project) { create(:project, :repository) }
    let(:commit)  { project.commit("master") }
    let(:graph) { Network::Graph.new(project, 'master', commit, '') }

    it 'filters our refs used by GitLab' 

  end
end

