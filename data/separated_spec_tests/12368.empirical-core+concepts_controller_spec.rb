require 'rails_helper'

describe Cms::ConceptsController do
  let!(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#new' do
    let!(:level2_concept) { create(:concept) }

    before do
      level2_concept.update(parent_id: nil)
    end

    it 'should assign the level 2 concepts and concepts' 

  end

  describe '#create' do
    it 'should create the concept with the params given' 

  end
end

