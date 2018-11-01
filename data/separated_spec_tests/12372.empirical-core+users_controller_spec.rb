require 'rails_helper'

describe Cms::UsersController do
  it { should use_before_filter :signed_in! }
  it { should use_before_action :set_flags }
  it { should use_before_action :set_user }
  it { should use_before_action :set_search_inputs }
  it { should use_before_action :get_subscription_data }
  it { should use_before_action :filter_zeroes_from_checkboxes }

  let!(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    before do
      allow(ActiveRecord::Base.connection).to receive(:execute) { ["results"] }
    end

    it 'should assign the search query, the results, user flags and number of spaces' 

  end

  describe '#search' do
    before do
      allow(ActiveRecord::Base.connection).to receive(:execute).and_return(["results"])
    end

    it 'should search for the users' 

  end

  describe '#create_with_school' do
    let(:new_user) { build(:user) }
    let!(:school) { create(:school) }

    it 'should create the school users and kick of the syn sales contact worker' 

  end

  # there is no route for this action, not sure if its used
  # describe '#show_json' do
  #   let!(:another_user) { create(:user) }
  #
  #   it 'should give the correct json' do
  #     get :show_json, format: :json
  #     expect(JSON.parse(response.body)).to eq(another_user.generate_teacher_account_info)
  #   end
  # end

  describe 'create' do
    let(:new_user) { build(:user) }

    it 'should create the user with the given params' 

  end

  describe '#sign_in' do
    let(:another_user) { create(:user) }

    it 'should set the user id in session' 

  end

  describe '#make_admin' do
    let!(:school) { create(:school) }
    let!(:non_admin) { create(:user) }

    before do
      request.env['HTTP_REFERER'] = 'http://example.com'
    end

    it 'should create a new schoolsadmin for the user given' 

  end

  describe '#remove_admin' do
    let!(:school) { create(:school) }
    let!(:admin) { create(:user) }
    let!(:schools_admin) { create(:schools_admins, user_id: admin.id, school_id: school.id) }

    before do
      request.env['HTTP_REFERER'] = 'http://example.com'
    end

    it 'should destroy the schoolsadmins' 

  end

  describe '#edit_subscription' do
    let!(:another_user) { create(:user) }

    it 'should assign the subscription' 

  end

  describe '#update' do
    let!(:another_user) { create(:user) }

    it 'should update the attributes for the given user' 

  end

  describe '#clear_data' do
    let!(:another_user) { create(:user) }

    it 'should clear the data' 

  end

  # no route for this action
  # describe '#destroy' do
  #   let!(:another_user) { create(:user) }
  #
  #   it 'should destroy the given user' do
  #     delete :destoy, id: another_user.id
  #     expect{User.find another_user.id}.to raise_exception ActiveRecord::RecordNotFound
  #   end
  # end

  describe '#complete_sales_stage' do
    let!(:another_user) { create(:user) }
    let(:updater) { double(:updater, call: true) }

    before do
      allow(UpdateSalesContact).to receive(:new) { updater }
    end

    it 'should create the sales contact updater' 

  end
end

