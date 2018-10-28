require 'rails_helper'

describe 'Labels', js: true do
  before do
    create(:snippet_with_tag)
    login
  end

  it 'user able to edit' 


  # it 'user able to delete' do
  #   find('#snippet-edit').click
  #   fill_in 'snippet-labels', with: ''
  #   click 'Update'
  #   # expect
  # end
end

