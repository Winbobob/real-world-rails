require 'rails_helper'

RSpec.describe 'Groups API' do
  describe 'GET show' do
    it 'returns a group', :show_in_doc do
      sign_in_as create :staff, :admin
      group = create(:group)

      get group_path(group, format: :json)

      expect(response.body).to match_serialized_json(group)
    end
  end

  describe 'GET index' do
    it 'returns a list of groups' 

  end

  describe 'POST create' do
    it 'creates a group' 

  end

  describe 'DELETE destroy' do
    it 'deletes a group' 

  end
end

