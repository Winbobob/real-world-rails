require 'rails_helper'

describe PrivaciesController, type: :controller do
  let(:group)      { FactoryGirl.create(:group) }
  let(:user)       { FactoryGirl.create(:person) }
  let(:membership) { group.memberships.create(person: user) }

  describe '#edit' do
    context 'editing my own profile' do
      before do
        get :edit,
            params: { person_id: user.id },
            session: { logged_in_id: user.id }
      end

      it 'renders the edit template' 

    end

    context "editing someone else's profile" do
      let(:stranger) { FactoryGirl.create(:person) }

      before do
        get :edit,
            params: { person_id: stranger.id },
            session: { logged_in_id: user.id }
      end

      it 'returns unauthorized' 


      context 'user is an adult in the same family' do
        let(:user) { FactoryGirl.create(:person, family: stranger.family) }

        it 'renders the edit template' 

      end

      context 'user is an admin' do
        let(:user) { FactoryGirl.create(:person, :admin_edit_profiles) }

        it 'renders the edit template' 

      end
    end
  end

  describe '#update' do
    context "editing someone else's profile" do
      let(:stranger) { FactoryGirl.create(:person) }

      before do
        patch :update,
              params: {
                person_id: stranger.id,
                family: { visible: '0' }
              },
              session: { logged_in_id: user.id }
      end

      it 'returns unauthorized' 

    end

    context 'updating my own profile' do
      before do
        patch :update,
              params: {
                person_id: user.id,
                family: {
                  people_attributes: {
                    '0' => {
                      id:                 user.id,
                      share_mobile_phone: '1',
                      share_home_phone:   '0'
                    }
                  }
                }
              },
              session: { logged_in_id: user.id }
      end

      it 'updates privacy on the person record and redirects' 

    end

    context 'updating group membership privacy' do
      before do
        patch :update,
              params: {
                person_id: user.id,
                family: {
                  people_attributes: {
                    '0' => {
                      id:                 user.id,
                      share_mobile_phone: '0'
                    }
                  }
                },
                memberships: {
                  membership.id => {
                    share_mobile_phone: '1'
                  }
                }
              },
              session: { logged_in_id: user.id }
      end

      it 'updates privacy on the group membership record' 

    end

    context 'updating family visibility' do
      before do
        patch :update,
              params: {
                person_id: user.id,
                family: { visible: '0' }
              },
              session: { logged_in_id: user.id }
      end

      it 'changes family visibility' 

    end

    context 'giving parental consent' do
      let(:child) { FactoryGirl.create(:person, family: user.family, child: true) }

      before do
        patch :update,
              params: {
                person_id: child.id,
                agree: I18n.t('privacies.i_agree') + '.',
                agree_commit: true
              },
              session: { logged_in_id: user.id }
      end

      it 'saves the consent on the child' 

    end
  end
end

