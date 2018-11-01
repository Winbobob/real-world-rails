require 'rails_helper'

describe Cms::ActivityCategoriesController, type: :controller do
  it { should use_before_filter :set_activity_category }

  let(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    let!(:category) { create(:activity_category) }
    let!(:category1) { create(:activity_category) }

    it 'should give all the categories' 

  end

  describe '#show' do
    let!(:category) { create(:activity_category) }

    before do
      allow_any_instance_of(GetActivitiesQuery).to receive(:run) { "activities" }
    end

    it 'should fetch the category and activityes' 

  end

  describe '#update_order_numbers' do
    let!(:category) { create(:activity_category) }
    let!(:category1) { create(:activity_category) }

    it 'should update the order number in the categories given and return all the categories' 

  end

  describe '#destroy_and_recreate_acas' do
    let(:category) { create(:activity_category) }
    let(:activites) { double(:activities, destroy_all: true) }
    let(:found_record) { double(:records, activity_category_activities: activites) }

    before do
      allow(ActivityCategory).to receive(:find) { found_record }
      allow_any_instance_of(GetActivitiesQuery).to receive(:run) { "activities" }
    end

    it 'should destroy the old category and recreate new category activity with the same id and order number' 

  end

  describe '#create' do
    it 'should create the activity category with the params' 

  end

  describe '#destroy' do
    let!(:category) { create(:activity_category) }

    it 'should destroy the given category' 

  end
end

