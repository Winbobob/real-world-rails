require 'rails_helper'

describe Cms::UnitTemplatesController, type: :controller do
  let!(:staff) { create(:staff)}

  let(:parsed_body) { JSON.parse(response.body) }

  before do
    allow(controller).to receive(:current_user) { staff }
  end

  describe '#index, format: :json' do
    let!(:author) {create(:author)}
    let!(:unit_template1) { create(:unit_template, author_id: author.id) }
    let!(:unit_template2) { create(:unit_template, author_id: author.id) }

    it 'responds with list of unit_templates' 

  end

  describe '#create' do
    let(:template) { build(:unit_template) }

    it 'should create the unit template category with the given params' 

  end

  describe '#update' do
    let(:template) { create(:unit_template) }

    it 'should update the given template' 

  end

  describe '#update_order_numbers' do
    let(:template) { create(:unit_template) }

    it 'should update the order number for the given unit templates' 

  end

  describe '#destroy' do
    let(:template) { create(:unit_template) }

    it 'should destroy the given unit template' 

  end
end

