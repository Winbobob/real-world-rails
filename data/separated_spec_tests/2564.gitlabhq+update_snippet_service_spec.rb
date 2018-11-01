require 'spec_helper'

describe UpdateSnippetService do
  before do
    @user = create :user
    @admin = create :user, admin: true
    @opts = {
      title: 'Test snippet',
      file_name: 'snippet.rb',
      content: 'puts "hello world"',
      visibility_level: Gitlab::VisibilityLevel::PRIVATE
    }
  end

  context 'When public visibility is restricted' do
    before do
      stub_application_setting(restricted_visibility_levels: [Gitlab::VisibilityLevel::PUBLIC])

      @snippet = create_snippet(@project, @user, @opts)
      @opts.merge!(visibility_level: Gitlab::VisibilityLevel::PUBLIC)
    end

    it 'non-admins should not be able to update to public visibility' 


    it 'admins should be able to update to pubic visibility' 

  end

  def create_snippet(project, user, opts)
    CreateSnippetService.new(project, user, opts).execute
  end

  def update_snippet(project, user, snippet, opts)
    UpdateSnippetService.new(project, user, snippet, opts).execute
  end
end

