require 'rails_helper'

describe Cms::SectionsController do
  it { should use_before_action :set_section }

  let(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    let!(:section) { create(:section) }

    it 'should assing the sections' 

  end

  describe '#create' do
    it 'should create the section with the params given' 

  end

  describe  '#update' do
    let!(:section) { create(:section) }

    it 'should update the given section' 

  end

  describe '#destroy' do
    let!(:section) { create(:section) }

    it 'should destroy the given section' 

  end
end

