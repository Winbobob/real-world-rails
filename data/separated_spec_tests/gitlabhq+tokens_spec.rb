require 'rake_helper'

describe 'tokens rake tasks' do
  let!(:user) { create(:user) }

  before do
    Rake.application.rake_require 'tasks/tokens'
  end

  describe 'reset_all_email task' do
    it 'invokes create_hooks task' 

  end

  describe 'reset_all_feed task' do
    it 'invokes create_hooks task' 

  end
end

