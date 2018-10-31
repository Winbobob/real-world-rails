require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET #show' do
    let(:status) { create(:status, :published) }
    let(:category) { create(:category, name: 'Test Category') }

    it 'redirects with a normalized slug' 


    it 'renders on a category with articles' 


    it 'redirects on an empty category' 

  end

  describe 'GET #feed' do
    let(:status) { create(:status, name: 'published') }
    let(:published) { status.published }
    let(:category) { create(:category, name: 'Test Category') }

    it 'renders on a category with articles' 

  end
end

