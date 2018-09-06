require 'spec_helper'

describe WelcomeController do
  describe 'index' do
    it 'renders' 

  end

  describe 'bike_creation_graph' do
    it 'renders embed without xframe block' 

  end

  describe 'goodbye' do
    it 'renders' 

  end

  describe 'choose registration' do
    context 'user not present' do
      it 'redirects' 

    end
    context 'user present' do
      it 'renders' 

    end
  end

  describe 'user_home' do
    context 'user not present' do
      it 'redirects' 

    end

    context 'when user is present' do
      let(:user) { FactoryGirl.create(:user) }
      context 'without anything' do
        it 'renders' 

      end
      context 'with stuff' do
        let(:ownership) { FactoryGirl.create(:ownership, user_id: user.id, current: true) }
        let(:bike) { ownership.bike }
        let(:bike_2) { FactoryGirl.create(:bike) }
        let(:lock) { FactoryGirl.create(:lock, user: user) }
        before do
          allow_any_instance_of(User).to receive(:bikes) { [bike, bike_2] }
          allow_any_instance_of(User).to receive(:locks) { [lock] }
          set_current_user(user)
        end
        it 'renders and user things are assigned' 

      end
    end
  end
end

