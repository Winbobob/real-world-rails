# frozen_string_literal: true
require 'rake_helper'

describe 'rake gitlab:refresh_site_statistics' do
  before do
    Rake.application.rake_require 'tasks/gitlab/site_statistics'

    create(:project)
    SiteStatistic.fetch.update(repositories_count: 0)
  end

  let(:task) { 'gitlab:refresh_site_statistics' }

  it 'recalculates existing counters' 


  it 'displays message listing counters' 

end

