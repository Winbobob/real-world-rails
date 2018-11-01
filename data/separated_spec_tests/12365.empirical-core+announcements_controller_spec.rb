require 'rails_helper'

describe Cms::AnnouncementsController, type: :controller do
  it { should use_before_filter :signed_in! }

  let(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    let!(:announcement) { create(:announcement) }
    let!(:announcement1) { create(:announcement) }

    it 'should give all the announcements' 

  end

  describe '#create' do
    let(:announcement) { build(:announcement) }

    it 'should create the announcement with the given params' 

  end

  describe '#update' do
    let!(:announcement) { create(:announcement) }

    it 'should update the announcement with the params given' 

  end
end

