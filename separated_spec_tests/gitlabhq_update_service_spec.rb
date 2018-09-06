require 'spec_helper'

describe ApplicationSettings::UpdateService do
  let(:application_settings) { Gitlab::CurrentSettings.current_application_settings }
  let(:admin) { create(:user, :admin) }
  let(:params) { {} }

  subject { described_class.new(application_settings, admin, params) }

  before do
    # So the caching behaves like it would in production
    stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'false')
  end

  describe 'updating terms' do
    context 'when the passed terms are blank' do
      let(:params) { { terms: ''  } }

      it 'does not create terms' 

    end

    context 'when passing terms' do
      let(:params) { { terms: 'Be nice!  '  } }

      it 'creates the terms' 


      it 'does not create terms if they are the same as the existing ones' 


      it 'updates terms if they already existed' 


      it 'Only queries once when the terms are changed' 

    end
  end
end

