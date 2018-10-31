require 'rails_helper'

describe Cms::AuthorsController, type: :controller do
  let(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    let(:author) { create(:author) }
    let(:author1) { create(:author) }

    it 'should give all the authors' 

  end

  describe '#create' do
    let(:author) { build(:author) }

    it 'should create the author with the params given' 

  end

  describe '#edit' do
    let!(:author) { create(:author) }

    it 'should find the author' 

  end

  describe '#update' do
    let!(:author) { create(:author) }

    it 'should update the author with the params provided' 

  end
end

