require 'rails_helper'

describe Cms::TopicCategoriesController do
  it { should use_before_action :set_topic_category }

  let!(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    let!(:category) { create(:topic_category) }

    it 'should assign the topic categories' 

  end

  describe '#create' do
    it 'should create the topic category with the params given' 

  end

  describe '#update' do
    let!(:category) { create(:topic_category) }

    it 'should update the given topic category' 

  end

  describe '#destroy' do
    let!(:category) { create(:topic_category) }

    it 'should destroy the given topic category' 

  end
end

