require 'rails_helper'

feature 'User edits snippet', :js do
  include DropzoneHelper

  let(:file_name) { 'test.rb' }
  let(:content) { 'puts "test"' }

  let(:user) { create(:user) }
  let(:snippet) { create(:personal_snippet, :public, file_name: file_name, content: content, author: user) }

  before do
    sign_in(user)

    visit edit_snippet_path(snippet)
    wait_for_requests
  end

  it 'updates the snippet' 


  it 'updates the snippet with files attached' 


  it 'updates the snippet to make it internal' 


  it 'updates the snippet to make it public' 

end

