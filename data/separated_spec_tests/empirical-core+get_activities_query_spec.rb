require 'rails_helper'

describe GetActivitiesQuery do
  describe '#run' do
    let(:activity) { create(:activity) }
    let(:activity_category) { create(:activity_category) }
    let!(:activity_category_activity) { create(:activity_category_activity, activity: activity, activity_category: activity_category) }
    let(:subject) { described_class.new(activity_category.id) }

    it 'should get the activity id and name and activity category activity order number' 

  end
end

