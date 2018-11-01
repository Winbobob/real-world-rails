require 'rails_helper'

describe ChaptersController do
  let(:organization) { create(:organization, name: 'SpaceBridge') }
  let(:user) { create(:user, admin: true) }

  before do
    sign_in user
  end

  describe '#index' do
    let!(:chapter) { create(:chapter) }

    it 'shows all the chapters' 

  end

  describe '#show' do
    let!(:chapter) { create(:chapter) }
    before do
      @draft_event = create(:event, current_state: :draft, chapter: chapter)
      @pending_event = create(:event, current_state: :pending_approval, chapter: chapter)
      @published_event = create(:event, chapter: chapter)

      expect(chapter.events).to match_array([@draft_event, @pending_event, @published_event])
    end

    describe 'as an admin' do
      it 'shows all events' 

    end

    describe 'as a regular user' do
      let(:user) { create(:user) }

      it 'shows a list of published events' 

    end
  end

  describe '#new' do
    it 'shows an empty chapter' 

  end

  describe '#create' do
    it 'creates a new chapter' 

  end

  describe '#edit' do
    let!(:chapter) { create(:chapter) }

    it "shows a chapter edit form" 

  end

  describe '#update' do
    let!(:chapter) { create(:chapter) }

    it "changes chapter details" 

  end

  describe "#destroy" do
    let!(:chapter) { create(:chapter) }

    it "can delete a chapter that belongs to no events" 


    it "cannot delete a chapter that belongs to a event" 

  end
end

