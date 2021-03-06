# frozen_string_literal: true

require 'spec_helper.rb'

describe Issues::ReferencedMergeRequestsService do
  def create_referencing_mr(attributes = {})
    create(:merge_request, attributes).tap do |merge_request|
      create(:note, :system, project: project, noteable: issue, author: user, note: merge_request.to_reference(full: true))
    end
  end

  def create_closing_mr(attributes = {})
    create_referencing_mr(attributes).tap do |merge_request|
      create(:merge_requests_closing_issues, issue: issue, merge_request: merge_request)
    end
  end

  set(:user) { create(:user) }
  set(:project) { create(:project, :public, :repository) }
  set(:other_project) { create(:project, :public, :repository) }
  set(:issue) { create(:issue, author: user, project: project) }

  set(:closing_mr) { create_closing_mr(source_project: project) }
  set(:closing_mr_other_project) { create_closing_mr(source_project: other_project) }

  set(:referencing_mr) { create_referencing_mr(source_project: project, source_branch: 'csv') }
  set(:referencing_mr_other_project) { create_referencing_mr(source_project: other_project, source_branch: 'csv') }

  let(:service) { described_class.new(project, user) }

  describe '#execute' do
    it 'returns a list of sorted merge requests' 


    context 'performance' do
      it 'does not run extra queries when extra namespaces are included', :use_clean_rails_memory_store_caching do
        service.execute(issue) # warm cache
        control_count = ActiveRecord::QueryRecorder.new { service.execute(issue) }.count

        third_project = create(:project, :public)
        create_closing_mr(source_project: third_project)
        service.execute(issue) # warm cache

        expect { service.execute(issue) }.not_to exceed_query_limit(control_count)
      end

      it 'preloads the head pipeline for each merge request, and its routes' 


      it 'only loads issue notes once' 

    end
  end

  describe '#referenced_merge_requests' do
    it 'returns the referenced merge requests' 


    it 'excludes cross project references if the user cannot read cross project' 


    context 'performance' do
      it 'does not run a query for each note author', :use_clean_rails_memory_store_caching do
        service.referenced_merge_requests(issue) # warm cache
        control_count = ActiveRecord::QueryRecorder.new { service.referenced_merge_requests(issue) }.count

        create(:note, project: project, noteable: issue, author: create(:user))
        service.referenced_merge_requests(issue) # warm cache

        expect { service.referenced_merge_requests(issue) }.not_to exceed_query_limit(control_count)
      end
    end
  end

  describe '#closed_by_merge_requests' do
    let(:closed_issue) { build(:issue, :closed, project: project)}

    it 'returns the open merge requests that close this issue' 


    it 'returns an empty array when the current issue is closed already' 


    context 'performance' do
      it 'does not run a query for each note author', :use_clean_rails_memory_store_caching do
        service.closed_by_merge_requests(issue) # warm cache
        control_count = ActiveRecord::QueryRecorder.new { service.closed_by_merge_requests(issue) }.count

        create(:note, :system, project: project, noteable: issue, author: create(:user))
        service.closed_by_merge_requests(issue) # warm cache

        expect { service.closed_by_merge_requests(issue) }.not_to exceed_query_limit(control_count)
      end
    end
  end
end

