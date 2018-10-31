require 'rails_helper'

describe PagesController do
  it { should use_before_filter :determine_js_file }
  it { should use_before_filter :determine_flag }

  # no route for this action
  # describe '#home' do
  #   context 'when signed in' do
  #     let(:user) { create(:user) }
  #
  #     before do
  #       allow(controller).to receive(:current_user) { user }
  #     end
  #
  #     it 'should redirect to profile path' do
  #       get :home
  #       expect(response).to redirect_to profile_path
  #     end
  #   end
  #
  #   context 'when no user is signed in' do
  #     it 'should set the body class and activity' do
  #       get :home
  #       expect(assigns(:body_class)).to eq("home-page")
  #       expect(assigns(:activity)).to eq Activity.with_classification.find_by_uid(ENV.fetch('HOMEPAGE_ACTIVITY_UID', ''))
  #     end
  #   end
  # end

  describe '#home_new' do
    context 'when user is signed in' do
      before do
        allow(controller).to receive(:signed_in?) { true }
      end

      it 'should redirect to profile path' 

    end

    context 'when user is not signed in' do
      it 'should set the title and description' 

    end
  end

  describe '#ideas' do
    let(:page) { double(:page, body: [{id: "some_id"}, {id: "some_other_id"}].to_json) }

    before do
      allow(HTTParty).to receive(:get) { page }
    end

    it 'should return the parsed body' 

  end

  describe '#play' do
    let!(:activity) { create(:activity, uid: "-K0rnIIF_iejGqS3XPJ8") }

    it 'should assign the activity and module url and redirect to the same url' 

  end

  # no route for this action
  # describe '#about' do
  #   it 'should set the body class' do
  #     get :about
  #     expect(assigns(:body_class)).to eq 'full-width-page white-page'
  #   end
  # end

  describe '#faq' do
    it 'should assign the sections' 

  end

  describe '#tos' do
    it 'should assign the body class' 

  end

  describe '#privacy' do
    it 'should set the body class' 

  end

  describe '#diagnostic_tool' do
    it 'should set the title and description' 

  end

  describe '#grammar_tool' do
    it 'should set the title and description' 

  end

  describe '#proofreader_tool' do
    it 'should set the title and description' 

  end

  describe '#connect_tool' do
    it 'should set the title and description' 

  end

  describe '#lessons_tool' do
    it 'should set the title and description' 

  end

  describe '#activities' do
    let!(:section) { create(:section) }

    it 'should set the body class, section and topics' 

  end

  describe '#premium' do
    let!(:user) { create(:user) }

    before do
      allow(controller).to receive(:current_user) { user }
    end

    it 'should set the variables' 

  end

  describe '#press' do
    let!(:post) { create(:blog_post, draft: false, topic: "Press") }

    it 'should assign the blog posts' 

  end

  describe '#announcements' do
    let!(:post) { create(:blog_post, draft: false, topic: "Announcements") }

    it 'should assign the blog posts' 

  end
end

