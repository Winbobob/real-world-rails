require 'spec_helper'

describe Projects::BatchOpenIssuesCountService do
  let!(:project_1) { create(:project) }
  let!(:project_2) { create(:project) }

  let(:subject) { described_class.new([project_1, project_2]) }

  context '#refresh_cache', :use_clean_rails_memory_store_caching do
    before do
      create(:issue, project: project_1)
      create(:issue, project: project_1, confidential: true)

      create(:issue, project: project_2)
      create(:issue, project: project_2, confidential: true)
    end

    context 'when cache is clean' do
      it 'refreshes cache keys correctly' 

    end

    context 'when issues count is already cached' do
      before do
        create(:issue, project: project_2)
        subject.refresh_cache
      end

      it 'does update cache again' 

    end
  end

  def get_cache_key(subject, project, public_key = false)
    service = subject.count_service.new(project)

    if public_key
      service.cache_key(service.class::PUBLIC_COUNT_KEY)
    else
      service.cache_key(service.class::TOTAL_COUNT_KEY)
    end
  end
end

