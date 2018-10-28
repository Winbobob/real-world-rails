require 'rails_helper'

describe 'Snippets', js: true do
  before do
    login
    sleep 0.5
  end

  context 'create' do
    it 'untagged snippet' 


    it 'tagged snippet' 

  end

  context 'show' do
    before do
      create_snippet('test snippet', 'test label')
    end

    it 'user able to view raw' 


    it 'user able to delete' 


    it 'user able to cancel delete' 


    it 'user able to edit snippet' 

  end

  private

  def create_snippet(title, label = nil)
    click_on 'Add snippet'
    fill_in 'title', with: title
    fill_in_editor_field
    fill_in 'snippet-labels', with: label unless label.nil?
    click_on 'Create'
  end

  def fill_in_editor_field
    within '.CodeMirror' do
      current_scope.click
      field = current_scope.find('textarea', visible: false)
      field.send_keys 'Test snippet content'
    end
  end
end

