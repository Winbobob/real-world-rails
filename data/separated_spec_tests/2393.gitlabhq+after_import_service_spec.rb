require 'spec_helper'

describe Projects::AfterImportService do
  include GitHelpers

  subject { described_class.new(project) }

  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }
  let(:sha) { project.commit.sha }
  let(:housekeeping_service) { double(:housekeeping_service) }

  describe '#execute' do
    before do
      allow(Projects::HousekeepingService)
        .to receive(:new).with(project).and_return(housekeeping_service)

      allow(housekeeping_service)
        .to receive(:execute).and_yield
    end

    it 'performs housekeeping' 


    context 'with some refs in refs/pull/**/*' do
      before do
        repository.write_ref('refs/pull/1/head', sha)
        repository.write_ref('refs/pull/1/merge', sha)

        subject.execute
      end

      it 'removes refs/pull/**/*' 

    end

    Repository::RESERVED_REFS_NAMES.each do |name|
      context "with a ref in refs/#{name}/tmp" do
        before do
          repository.write_ref("refs/#{name}/tmp", sha)

          subject.execute
        end

        it "does not remove refs/#{name}/tmp" 

      end
    end

    def rugged
      rugged_repo(repository)
    end
  end
end

