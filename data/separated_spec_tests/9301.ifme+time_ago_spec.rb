# frozen_string_literal: true

describe TimeAgo do
  describe '#formatted_ago' do
    subject { TimeAgo.formatted_ago(time) }

    context 'in default locale (English)' do
      context 'and the date was more than a week ago' do
        let(:time) { Time.zone.local(2007, 2, 10, 15, 30, 45) }

        it 'formats the whole date but not the time' 

      end

      context 'and the date was less than a week ago' do
        let(:time) { 2.days.ago }

        it 'formats a relative time' 

      end
    end

    context 'in a different locale (Spanish)' do
      before do
        I18n.locale = 'es'
      end

      after do
        I18n.locale = I18n.default_locale
      end

      context 'and the date was more than a week ago' do
        let(:time) { Time.zone.local(2007, 2, 10, 15, 30, 45) }

        it 'formats the whole date but not the time' 

      end

      context 'and the date was less than a week ago' do
        let(:time) { 2.days.ago }

        it 'formats a relative time' 

      end
    end
  end

  describe '#created_or_edited' do
    let(:new_user1) { create(:user1) }
    let(:new_moment) { create(:moment, user_id: new_user1.id) }
    let(:new_category) { create(:category, user_id: new_user1.id) }

    subject { TimeAgo.created_or_edited(new_moment) }

    context 'updated_at does not exist' do
      it 'returns created_at' 

    end

    context 'creating and editing happened on the same day (but not the exact same time)' do
      before do
        new_moment.update(category: Array.new(1, new_category.id))
      end

      it 'returns created_at with (edited)' 

    end

    context 'editing happened on a different day than it was created' do
      let(:new_moment) { create(:moment, user_id: new_user1.id, created_at: '2014-01-01 00:00:00') }

      before do
        new_moment.update(category: Array.new(1, new_category.id))
      end

      it 'returns created_at with updated_at' 

    end
  end
end
