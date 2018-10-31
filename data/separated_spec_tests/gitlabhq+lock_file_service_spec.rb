require 'spec_helper'

describe Lfs::LockFileService do
  let(:project)      { create(:project) }
  let(:current_user) { create(:user) }

  subject { described_class.new(project, current_user, params) }

  describe '#execute' do
    let(:params) { { path: 'README.md' } }

    context 'when not authorized' do
      it "doesn't succeed" 

    end

    context 'when authorized' do
      before do
        project.add_developer(current_user)
      end

      context 'with an existent lock' do
        let!(:lock) { create(:lfs_file_lock, project: project) }

        it "doesn't succeed" 


        it "doesn't create the Lock" 

      end

      context 'without an existent lock' do
        it "succeeds" 


        it "creates the Lock" 

      end

      context 'when an error is raised' do
        it "doesn't succeed" 

      end
    end
  end
end

