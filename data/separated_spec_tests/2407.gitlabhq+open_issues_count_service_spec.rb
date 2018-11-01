require 'spec_helper'

describe Projects::OpenIssuesCountService do
  describe '#count' do
    let(:project) { create(:project) }

    context 'when user is nil' do
      it 'does not include confidential issues in the issue count' 

    end

    context 'when user is provided' do
      let(:user) { create(:user) }

      context 'when user can read confidential issues' do
        before do
          project.add_reporter(user)
        end

        it 'returns the right count with confidential issues' 


        it 'uses total_open_issues_count cache key' 

      end

      context 'when user cannot read confidential issues' do
        before do
          project.add_guest(user)
        end

        it 'does not include confidential issues' 


        it 'uses public_open_issues_count cache key' 

      end
    end

    context '#refresh_cache', :use_clean_rails_memory_store_caching do
      let(:subject) { described_class.new(project) }

      before do
        create(:issue, :opened, project: project)
        create(:issue, :opened, project: project)
        create(:issue, :opened, confidential: true, project: project)
      end

      context 'when cache is empty' do
        it 'refreshes cache keys correctly' 

      end

      context 'when cache is outdated' do
        before do
          subject.refresh_cache
        end

        it 'refreshes cache keys correctly' 

      end
    end
  end
end

