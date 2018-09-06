require 'rails_helper'

describe Admin::NotesController, type: :controller do
  render_views

  let(:admin) { create(:user, :as_admin, twitter: '@getpublify') }
  let!(:blog) { create(:blog) }

  before(:each) do
    sign_in admin
  end

  context 'with a blog' do
    describe 'index' do
      let!(:notes) { [create(:note), create(:note)] }
      before(:each) { get :index }
      it { expect(response).to render_template('index') }
      it { expect(assigns(:notes).sort).to eq(notes.sort) }
      it { expect(assigns(:note)).to be_a(Note) }
      it { expect(assigns(:note).author).to eq(admin.login) }
      it { expect(assigns(:note).user).to eq(admin) }
    end

    describe 'create' do
      context 'a simple note' do
        before(:each) { post :create, params: { note: { body: 'Emphasis _mine_' } } }
        it { expect(response).to redirect_to(admin_notes_path) }
        it { expect(flash[:notice]).to eq(I18n.t('notice.note_successfully_created')) }
      end

      it 'creates a note' 


      context 'with twitter access configured' do
        before do
          blog.twitter_consumer_key = 'consumer_key'
          blog.twitter_consumer_secret = 'consumer_secret'
          blog.save

          admin.twitter_oauth_token = 'oauth_token'
          admin.twitter_oauth_token_secret = 'oauth_token'
          admin.save
        end

        it 'sends the note to twitter' 

      end
    end

    context 'with an existing note from current user' do
      let(:note) { create(:note, user_id: admin) }

      describe 'edit' do
        before(:each) { get :edit, params: { id: note.id } }
        it { expect(response).to be_success }
        it { expect(response).to render_template('edit') }
        it { expect(assigns(:note)).to eq(note) }
        it { expect(assigns(:notes)).to eq([note]) }
      end

      describe 'update' do
        before(:each) { post :update, params: { id: note.id, note: { body: 'new body' } } }
        it { expect(response).to redirect_to(action: :index) }
        it { expect(note.reload.body).to eq('new body') }
      end

      describe 'show' do
        before(:each) { get :show, params: { id: note.id } }
        it { expect(response).to render_template('show') }
      end

      describe 'Destroying a note' do
        before(:each) { post :destroy, params: { id: note.id } }
        it { expect(response).to redirect_to(admin_notes_path) }
        it { expect(Note.count).to eq(0) }
      end
    end
  end
end

