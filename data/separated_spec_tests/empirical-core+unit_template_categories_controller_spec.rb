require 'rails_helper'

describe Cms::UnitTemplateCategoriesController do
  it { should use_before_action :set_unit_template_category }

  let(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    let!(:category) { create(:unit_template_category) }

    it 'should assign all the unit template categories' 

  end

  describe '#create' do
    it 'should create the unit template category with the given params' 

  end

  describe '#update' do
    let(:category) { create(:unit_template_category) }

    it 'should update the given unit template category' 

  end

  describe '#destroy' do
    let(:category) { create(:unit_template_category) }

    it 'should destory the given category' 

  end
end

