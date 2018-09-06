require 'rails_helper'

describe Admin::SettingsController, type: :controller do
  render_views

  let!(:blog) { create(:blog) }

  before(:each) do
    alice = create(:user, :as_admin, login: 'alice')
    sign_in alice
  end

  describe '#index' do
    before(:each) { get :index }
    it { expect(response).to render_template('index') }
  end

  describe '#write' do
    before(:each) { get :write }
    it { expect(response).to render_template('write') }
  end

  describe '#display' do
    before(:each) { get :display }
    it { expect(response).to render_template('display') }
  end

  describe '#feedback' do
    before(:each) { get :feedback }
    it { expect(response).to render_template('feedback') }
  end

  describe '#update' do
    it 'updates the settings' 


    it 'redirects to :index by default' 


    context 'when updating the language' do
      after do
        I18n.locale = :en
      end

      it 'sets the flash in the new language' 

    end
  end
end
