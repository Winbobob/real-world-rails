require 'rails_helper'

describe Cms::TopicsController do
  it { should use_before_action :set_topic }

  let(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    let!(:topic) { create(:topic) }
    let!(:topic1) { create(:topic) }

    it 'sould give all the topics' 

  end

  describe '#edit' do
    let!(:topic) { create(:topic) }

    it 'should find the topic' 

  end

  describe '#create' do
    let(:topic) { build(:topic) }

    it 'should create the topic with the given params' 

  end

  describe '#update' do
    let!(:topic) { create(:topic) }
    
    it 'should update the given topic' 

  end

  describe '#destroy' do
    let!(:topic) { create(:topic) }

    it 'should destroy the given topic' 

  end
end

