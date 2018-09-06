require 'spec_helper'

feature 'RavenJS' do
  let(:raven_path) { '/raven.chunk.js' }

  it 'should not load raven if sentry is disabled' 


  it 'should load raven if sentry is enabled' 


  def has_requested_raven
    page.all('script', visible: false).one? do |elm|
      elm[:src] =~ /#{raven_path}$/
    end
  end
end

