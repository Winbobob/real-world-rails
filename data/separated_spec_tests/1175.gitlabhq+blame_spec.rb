require 'spec_helper'

describe Gitlab::Blame do
  let(:project) { create(:project, :repository) }
  let(:path) { 'files/ruby/popen.rb' }
  let(:commit) { project.commit('master') }
  let(:blob) { project.repository.blob_at(commit.id, path) }

  describe "#groups" do
    let(:subject) { described_class.new(blob, commit).groups(highlight: false) }

    it 'groups lines properly' 

  end
end

