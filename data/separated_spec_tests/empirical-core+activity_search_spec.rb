require 'rails_helper'

describe ActivitySearch do
  describe 'search' do
    let!(:activity_classification) { create(:activity_classification) }
    let!(:topic) { create(:topic) }
    let!(:section) { create(:section) }
    let!(:activity) { create(:activity, activity_categories: [], flags: %w{beta production}, activity_classification_id: activity_classification.id, topic: topic, section: section) }
    let!(:activity_category) { create(:activity_category, activities: [activity]) }
    let!(:activity_category_activity) { create(:activity_category_activity, activity_category: activity_category, activity: activity) }

    it 'should get the correct attributes based on the flag given' 

  end
end

