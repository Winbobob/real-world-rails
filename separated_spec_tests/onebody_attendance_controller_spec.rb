require 'rails_helper'

describe AttendanceController, type: :controller do
  render_views

  let(:group) { FactoryGirl.create(:group) }

  describe '#index' do
    context 'given user is a group admin' do
      let!(:user)       { FactoryGirl.create(:person) }
      let!(:membership) { group.memberships.create!(person: user, admin: true) }

      context do
        before do
          get :index,
              params: {
                attended_at: '2009-12-01',
                group_id: group.id
              },
              session: { logged_in_id: user.id }
        end

        it 'renders the index template' 

      end

      context 'given no date' do
        before do
          get :index,
              params: {
                group_id: group.id
              },
              session: { logged_in_id: user.id }
        end

        it 'uses the current date' 

      end

      context 'given an invalid date' do
        before do
          get :index,
              params: {
                attended_at: '2009',
                group_id: group.id
              },
              session: { logged_in_id: user.id }
        end

        it 'uses the current date and shows a warning' 

      end
    end

    context 'given public=true and token' do
      before do
        get :index,
            params: { attended_at: '2009-12-01',
                      group_id: group.id,
                      public: 'true',
                      token: group.share_token }
      end

      it 'renders the public_index template' 

    end

    context 'given user is not a group admin' do
      let!(:user)       { FactoryGirl.create(:person) }
      let!(:membership) { group.memberships.create!(person: user) }

      before do
        get :index,
            params: {
              attended_at: '2009-12-01',
              group_id: group.id
            },
            session: { logged_in_id: user.id }
      end

      it 'renders an error message' 

    end

    context 'given attendance is disabled on the group' do
      let!(:group)      { FactoryGirl.create(:group, attendance: false) }
      let!(:user)       { FactoryGirl.create(:person) }
      let!(:membership) { group.memberships.create!(person: user, admin: true) }

      before do
        get :index,
            params: {
              attended_at: '2009-12-01',
              group_id: group.id
            },
            session: { logged_in_id: user.id }
      end

      it 'renders an error' 

    end
  end

  describe '#create' do
    context 'user is administrator' do
      let!(:user)       { FactoryGirl.create(:person) }
      let!(:membership) { group.memberships.create!(person: user, admin: true) }
      let(:attendee1)   { FactoryGirl.create(:person) }
      let(:attendee2)   { FactoryGirl.create(:person) }

      context do
        before do
          post :create,
               params: {
                 attended_at: '2009-12-01 09:00',
                 group_id: group.id,
                 ids: [attendee1.id]
               },
               session: { logged_in_id: user.id }
        end

        it 'creates attendance records' 

      end

      context 'given format is json' do
        before do
          post :create,
               params: {
                 attended_at: '2009-12-01 09:00',
                 group_id: group.id,
                 ids: [attendee1.id],
                 format: :json
               },
               session: { logged_in_id: user.id }
        end

        it 'renders json response' 

      end

      context 'given check-in time without date' do
        before do
          post :create,
               params: {
                 attended_at: '9:30 AM',
                 group_id: group.id,
                 ids: [attendee1.id]
               },
               session: { logged_in_id: user.id }
        end

        it 'creates attendance records' 

      end

      context 'given existing records for this time' do
        let!(:existing1) { group.attendance_records.create!(person: attendee1, attended_at: Time.new(2009, 12, 1, 9, 0)) }
        let!(:existing2) { group.attendance_records.create!(person: attendee2, attended_at: Time.new(2009, 12, 1, 9, 0)) }

        before do
          post :create,
               params: {
                 attended_at: '2009-12-01 09:00',
                 group_id: group.id,
                 ids: [attendee1.id]
               },
               session: { logged_in_id: user.id }
        end

        it 'deletes old records for the same person' 

      end

      context 'given person not in database' do
        before do
          post :create,
               params: {
                 attended_at: '2009-12-01 09:00',
                 group_id: group.id,
                 person: {
                   first_name: 'John',
                   last_name:  'Smith'
                 }
               },
               session: { logged_in_id: user.id }
        end

        it 'creates a record not attached to a person record' 

      end
    end

    context 'user is not administrator' do
      let!(:user) { FactoryGirl.create(:person) }

      before do
        post :create,
             params: {
               attended_at: '2009-12-01 09:00',
               group_id: group.id,
               ids: [1]
             },
             session: { logged_in_id: user.id }
      end

      it 'renders an error message' 

    end

    context 'group_id is 0 (bogus submission from legacy check-in software)' do
      let!(:user) { FactoryGirl.create(:person) }

      before do
        post :create,
             params: {
               attended_at: '2009-12-01 09:00',
               group_id: '0',
               ids: [1]
             },
             session: { logged_in_id: user.id }
      end

      it 'renders 404' 

    end
  end

  describe '#batch' do
    let(:attendee) { FactoryGirl.create(:person) }
    let(:attendee2) { FactoryGirl.create(:person) }

    context 'from logged in user' do
      let!(:user)       { FactoryGirl.create(:person) }
      let!(:membership) { group.memberships.create!(person: user, admin: true) }

      context do
        before do
          post :batch,
               params: {
                 attended_at: '2009-12-01',
                 group_id: group.id,
                 ids: [attendee.id]
               },
               session: { logged_in_id: user.id }
        end

        it 'creates attendance records' 


        it 'emails the report' 

      end

      context 'given an existing record' do
        let!(:existing) do
          group.attendance_records.create!(person: attendee2, attended_at: Time.new(2009, 12, 1, 0, 0))
        end

        context 'when the record is not changed on the page' do
          before do
            post :batch,
                 params: {
                   attended_at: '2009-12-01',
                   group_id: group.id,
                   ids: [attendee.id]
                 },
                 session: { logged_in_id: user.id }
          end

          it 'does not delete the existing record' 

        end

        context 'when the record is unchecked on the page' do
          before do
            post :batch,
                 params: {
                   attended_at: '2009-12-01',
                   group_id: group.id,
                   ids: [attendee.id],
                   unchecked_ids: [attendee2.id]
                 },
                 session: { logged_in_id: user.id }
          end

          it 'deletes the existing record' 

        end
      end

      context 'given invalid date format' do
        before do
          post :batch,
               params: {
                 attended_at: '99-99-99',
                 group_id: group.id,
                 ids: [attendee.id]
               },
               session: { logged_in_id: user.id }
        end

        render_views

        it 'renders an error' 

      end
    end

    context 'using public interface and share token' do
      context 'using valid token' do
        context do
          before do
            post :batch,
                 params: { group_id:    group.id,
                           public:      true,
                           token:       group.share_token,
                           ids:         [attendee.id],
                           attended_at: '01/13/2020' }
          end

          render_views

          it 'returns success' 

        end

        context 'with notes' do
          before do
            post :batch,
                 params: { group_id:    group.id,
                           public:      true,
                           token:       group.share_token,
                           ids:         [attendee.id],
                           attended_at: '01/13/2020',
                           notes:       'test note' }
          end

          render_views

          it 'emails the note' 

        end
      end

      context 'using bad token' do
        before do
          post :batch,
               params: { group_id:    group.id,
                         public:      true,
                         token:       'abc',
                         ids:         [attendee.id],
                         attended_at: '01/13/2020' }
        end

        it 'returns unauthorized' 

      end
    end
  end
end

