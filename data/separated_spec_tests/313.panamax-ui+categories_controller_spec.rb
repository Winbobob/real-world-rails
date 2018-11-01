require 'spec_helper'

describe CategoriesController do
  let(:dummy_category) { Category.new(name: 'Web', id: 77) }

  describe 'POST #create' do
    let(:category_form_params) do
      {
        format: :json,
        'app_id' => 77,
        'category' =>
          {
            'name' => 'Web'
          }
      }
    end

    before do
      allow(Category).to receive(:find).and_return(dummy_category)
      allow(Category).to receive(:create).and_return(dummy_category)
    end

    it 'creates the category' 


    it 'renders json response when format is json' 

  end

  describe 'PUT #update' do
    let(:attributes) do
      {
        'category' => {
          'name' => 'Web',
          'id' => '77'
        }
      }
    end

    before do
      allow(Category).to receive(:find).and_return(dummy_category)
      allow(dummy_category).to receive(:save)
    end

    it 'retrieves the category to be updated' 


    it 'writes the attributes' 


    it 'saves the record' 

  end

  describe 'DELETE #destroy' do
    before do
      allow(Category).to receive(:find).and_return(dummy_category)
      allow(dummy_category).to receive(:destroy)
    end

    it 'retrieves the category to be updated' 


    it 'destroys the record' 

  end
end

