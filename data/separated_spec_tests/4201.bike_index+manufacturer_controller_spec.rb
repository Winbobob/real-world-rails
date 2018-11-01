require 'spec_helper'

describe Admin::ManufacturersController, type: :controller do
  let(:subject) { FactoryGirl.create(:manufacturer) }
  include_context :logged_in_as_super_admin

  let(:permitted_attributes) do
    {
      name: 'new name and things',
      slug: 'new_name_and_things',
      website: 'http://stuff.com',
      frame_maker: true,
      open_year: 1992,
      close_year: 89898,
      description: 'new description'
    }
  end

  describe 'index' do
    it 'renders' 

  end

  describe 'show' do
    it 'renders' 

  end

  describe 'edit' do
    context 'slug' do
      it 'renders' 

    end
    context 'id' do
      it 'renders' 

    end
  end

  describe 'update' do
    it 'updates available attributes' 

  end

  describe 'create' do
    it 'creates with available attributes' 

  end
end

