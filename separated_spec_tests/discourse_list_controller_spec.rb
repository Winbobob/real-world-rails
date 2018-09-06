require 'rails_helper'

describe ListController do

  # we need some data
  before do
    @user = Fabricate(:coding_horror)
    @post = Fabricate(:post, user: @user)

    SiteSetting.top_menu = 'latest|new|unread|categories'
  end

  describe 'indexes' do

    (Discourse.anonymous_filters - [:categories]).each do |filter|
      context "#{filter}" do
        before { get filter }
        it { is_expected.to respond_with(:success) }
      end
    end

    it 'allows users to filter on a set of topic ids' 

  end

  describe 'RSS feeds' do
    it 'renders latest RSS' 


    it 'renders top RSS' 


    it 'renders all time top RSS' 


    it 'renders yearly top RSS' 


    it 'renders quarterly top RSS' 


    it 'renders monthly top RSS' 


    it 'renders weekly top RSS' 


    it 'renders daily top RSS' 

  end

  context 'category' do

    context 'in a category' do
      let(:category) { Fabricate(:category) }

      context 'without access to see the category' do
        before do
          Guardian.any_instance.expects(:can_see?).with(category).returns(false)
          get :category_latest, params: { category: category.slug }
        end

        it { is_expected.not_to respond_with(:success) }
      end

      context 'with access to see the category' do
        before do
          get :category_latest, params: { category: category.slug }
        end

        it { is_expected.to respond_with(:success) }
      end

      context 'with a link that includes an id' do
        before do
          get :category_latest, params: {
            category: "#{category.id}-#{category.slug}"
          }
        end

        it { is_expected.to respond_with(:success) }
      end

      context 'with a link that has a parent slug, slug and id in its path' do
        let(:child_category) { Fabricate(:category, parent_category: category) }

        context "with valid slug" do
          before do
            get :category_latest, params: {
              parent_category: category.slug,
              category: child_category.slug,
              id: child_category.id
            }
          end

          it { is_expected.to redirect_to(child_category.url) }
        end

        context "with invalid slug" do
          before do
            get :category_latest, params: {
              parent_category: 'random slug',
              category: 'random slug',
              id: child_category.id
            }
          end

          it { is_expected.to redirect_to(child_category.url) }
        end
      end

      context 'another category exists with a number at the beginning of its name' do
        # One category has another category's id at the beginning of its name
        let!(:other_category) { Fabricate(:category, name: "#{category.id} name") }

        it 'uses the correct category' 

      end

      context 'a child category' do
        let(:sub_category) { Fabricate(:category, parent_category_id: category.id) }

        context 'when parent and child are requested' do
          before do
            get :category_latest, params: {
              parent_category: category.slug, category: sub_category.slug
            }
          end

          it { is_expected.to respond_with(:success) }
        end

        context 'when child is requested with the wrong parent' do
          before do
            get :category_latest, params: {
              parent_category: 'not_the_right_slug', category: sub_category.slug
            }
          end

          it { is_expected.not_to respond_with(:success) }
        end
      end

      describe 'feed' do
        it 'renders RSS' 

      end

      describe "category default views" do
        it "has a top default view" 


        it "has a default view of nil" 


        it "has a default view of ''" 


        it "has a default view of latest" 

      end

      describe "renders canonical tag" do
        render_views

        it 'for category default view' 


        it 'for category latest view' 

      end
    end
  end

  describe "topics_by" do
    let!(:user) { log_in }

    it "should respond with a list" 

  end

  context "private_messages" do
    let!(:user) { log_in }

    it "raises an error when can_see_private_messages? is false " 


    it "succeeds when can_see_private_messages? is false " 

  end

  context "private_messages_sent" do
    let!(:user) { log_in }

    it "raises an error when can_see_private_messages? is false " 


    it "succeeds when can_see_private_messages? is false " 

  end

  context "private_messages_unread" do
    let!(:user) { log_in }

    it "raises an error when can_see_private_messages? is false " 


    it "succeeds when can_see_private_messages? is false " 

  end

  context 'read' do
    it 'raises an error when not logged in' 


    context 'when logged in' do
      before do
        log_in_user(@user)
        get :read
      end

      it { is_expected.to respond_with(:success) }
    end
  end

  describe "best_periods_for" do

    it "returns yearly for more than 180 days" 


    it "includes monthly when less than 180 days and more than 35 days" 


    it "includes weekly when less than 35 days and more than 8 days" 


    it "includes daily when less than 8 days" 


    it "returns default even for more than 180 days" 


    it "returns default even when less than 180 days and more than 35 days" 


    it "returns default even when less than 35 days and more than 8 days" 


    it "doesn't return default when set to all" 


    it "doesn't return value twice when matches default" 

  end

  describe "categories suppression" do
    let(:category_one) { Fabricate(:category) }
    let(:sub_category) { Fabricate(:category, parent_category: category_one, suppress_from_latest: true) }
    let!(:topic_in_sub_category) { Fabricate(:topic, category: sub_category) }

    let(:category_two) { Fabricate(:category, suppress_from_latest: true) }
    let!(:topic_in_category_two) { Fabricate(:topic, category: category_two) }

    it "suppresses categories from the latest list" 


    it "does not suppress" 


  end

  describe "safe mode" do
    render_views

    it "handles safe mode" 


  end

end

