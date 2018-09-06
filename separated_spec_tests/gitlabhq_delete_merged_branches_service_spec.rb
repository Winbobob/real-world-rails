require 'spec_helper'

describe DeleteMergedBranchesService do
  include ProjectForksHelper

  subject(:service) { described_class.new(project, project.owner) }

  let(:project) { create(:project, :repository) }

  context '#execute' do
    it 'deletes a branch that was merged' 


    it 'keeps branch that is unmerged' 


    it 'keeps "master"' 


    it 'keeps protected branches' 


    it 'keeps wildcard protected branches' 


    it 'ignores protected tags' 


    context 'user without rights' do
      let(:user) { create(:user) }

      it 'cannot execute' 

    end

    context 'open merge requests' do
      it 'does not delete branches from open merge requests' 

    end
  end

  context '#async_execute' do
    it 'calls DeleteMergedBranchesWorker async' 

  end
end

