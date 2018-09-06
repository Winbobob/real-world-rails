require 'rails_helper'

describe UserPagePresenter do

  describe '.build' do
    subject { described_class.build(user, current_user, page, per_page) }

    let(:user) { double('user', decorate: decorated_user) }
    let(:decorated_user) { double('decorated_user') }
    let(:current_user) { double('current_user') }
    let(:page) { 2 }
    let(:per_page) { 5 }

    it "builds presenter with given user decorated" 


    it "builds presenter with given current_user" 


    it "builds presenter with given page" 


    context "when page is nil" do
      let(:page) { nil }

      it "builds presenter with page = 1" 

    end

    it "builds presenter with given per_page" 


    context "when per_page is nil" do
      let(:per_page) { nil }

      it "builds presenter with per_page = PER_PAGE" 

    end
  end

  let(:presenter) { described_class.new(user, current_user, policy, page,
                                        per_page) }
  let(:user) { stub_model(User, username: 'cartman').decorate }
  let(:current_user) { stub_model(User) }
  let(:policy) { double('policy') }
  let(:page) { 2 }
  let(:per_page) { 5 }

  let(:view_context) {
    controller = ApplicationController.new
    controller.request = ActionController::TestRequest.new
    controller.view_context
  }

  describe '#title' do
    subject { presenter.title }

    it { should eq("cartman's profile") }
  end

  describe '#user_full_name' do
    subject { presenter.user_full_name }

    before do
      allow(user).to receive(:full_name) { 'E.C.' }
    end

    it { should eq('E.C.') }
  end

  describe '#user_joined_at' do
    subject { presenter.user_joined_at }

    before do
      allow(user).to receive(:joined_at) { 'Jan 1, 1970' }
    end

    it { should eq('Jan 1, 1970') }
  end

  describe '#user_avatar_image_tag' do
    subject { presenter.user_avatar_image_tag }

    before do
      allow(user).to receive(:avatar_image_tag) { '<img...>' }
    end

    it { should eq('<img...>') }
  end

  describe '#show_settings?' do
    subject { presenter.show_settings? }

    context "when policy allows for update" do
      before do
        allow(policy).to receive(:update?) { true }
      end

      it { should be(true) }
    end

    context "when policy doesn't allow for update" do
      before do
        allow(policy).to receive(:update?) { false }
      end

      it { should be(false) }
    end
  end

  describe '#asciicast_count_text' do
    subject { presenter.asciicast_count_text(view_context) }

    context 'for non author' do
      before do
        allow(user).to receive(:public_asciicast_count) { 2 }
      end

      it { should match(/2.+cartman/) }
    end

    context 'for author' do
      let(:current_user) { user }

      before do
        allow(user).to receive(:asciicast_count) { 3 }
      end

      it { should match(/you.+3/i) }
    end
  end

  describe '#user_username' do
    subject { presenter.user_username }

    it { should eq('cartman') }
  end

  describe '#asciicasts' do
    subject { presenter.asciicasts }

    let(:collection) { [asciicast] }
    let(:asciicast) { double('asciicast', decorate: double(title: 'quux')) }

    before do
      allow(user).to receive(:paged_asciicasts) { collection }
    end

    it "gets user's asciicasts paged" 


    it "wraps the asciicasts with paginating decorator" 

  end

  describe '#current_users_profile?' do
    subject { presenter.current_users_profile? }

    context "when current_user is the same user" do
      let(:current_user) { user }

      it { should be(true) }
    end

    context "when current_user is a different user" do
      let(:current_user) { stub_model(User) }

      it { should be(false) }
    end

    context "when current_user is nil" do
      let(:current_user) { nil }

      it { should be_falsy }
    end
  end

end

