require 'rails_helper'

describe Administration::SettingsController, type: :controller do
  let(:admin) { FactoryGirl.create(:person, :super_admin) }

  describe '#index' do
    before do
      get :index,
          session: { logged_in_id: admin.id }
    end

    render_views

    it 'renders the index template' 

  end

  describe '#batch' do
    let(:suffixes_setting) { Site.current.settings.where(name: 'Suffixes').first! }

    context 'given valid settings' do
      before do
        put :batch,
            params: {
              'hostname' => 'church.io',
              suffixes_setting.id.to_s => "Jr.\r\nSr."
            },
            session: { logged_in_id: admin.id }
      end

      after do
        Site.current.update_attributes!(host: 'example.com')
      end

      it 'redirects to the index' 


      it 'updates settings' 

    end

    context 'given invalid settings' do
      before do
        put :batch,
            params: {
              'hostname' => 'http://www.example.com'
            },
            session: { logged_in_id: admin.id }
      end

      after do
        Site.current.update_attributes!(host: 'example.com')
      end

      it 'adds errors to the flash and redirects' 

    end
  end

  describe '#reload' do
    before do
      Timecop.freeze(Time.now)
      put :reload,
          session: { logged_in_id: admin.id }
    end

    after do
      Timecop.return
    end

    it 'updates the settings_changed_at timestamp and redirects' 

  end
end

