require 'rails_helper'

describe Cms::SchoolsController do
  it { should use_before_filter :signed_in! }
  it { should use_before_action :text_search_inputs }
  it { should use_before_action :set_school }
  it { should use_before_action :get_subscription_data }

  let(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe "SCHOOLS_PER_PAGE" do
    it 'should have the correct value' 

  end

  describe '#index' do
    let(:school_hash) { {school_zip: "1234", number_teachers: 23, number_admins: 5, frl: "frl"} }

    before do
      allow(ActiveRecord::Base.connection).to receive(:execute) { [school_hash] }
    end

    it 'should allows staff memeber to view and search through school' 

  end

  describe '#search' do
    let(:school_hash) { {school_zip: 1234, number_teachers: 23, number_admins: 5, frl: "frl"} }

    before do
      allow(ActiveRecord::Base.connection).to receive(:execute).and_return([school_hash])
    end

    it 'should search for the school and give the results' 

  end

  describe '#show' do
    let!(:school) { create(:school) }

    before do
      allow_any_instance_of(Cms::TeacherSearchQuery).to receive(:run) { "teacher data" }
    end

    it 'should assignt the correct values' 

  end

  describe '#edit' do
    let!(:school) { create(:school) }

    it 'should assign the school and editable attributes' 

  end

  describe '#update' do
    let!(:school) { create(:school) }

    it 'should update the given school' 

  end

  describe '#edit_subscription' do
    let!(:school) { create(:school) }

    it 'should assing the subscription' 

  end

  describe '#create' do
    it 'should create the school with the given params and kick off sync sales account worker' 

  end

  describe '#add_by_admin' do
    let!(:another_user) { create(:user) }
    let!(:school) { create(:school) }

    it 'should create the schools admin and redirect to cms school path' 

  end
end

