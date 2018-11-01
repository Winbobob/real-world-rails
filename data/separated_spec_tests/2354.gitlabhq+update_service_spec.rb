require 'spec_helper'

describe ApplicationSettings::UpdateService do
  let(:application_settings) { create(:application_setting) }
  let(:admin) { create(:user, :admin) }
  let(:params) { {} }

  subject { described_class.new(application_settings, admin, params) }

  before do
    # So the caching behaves like it would in production
    stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'false')

    # Creating these settings first ensures they're used by other factories
    application_settings
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

  describe 'performance bar settings' do
    using RSpec::Parameterized::TableSyntax

    where(:params_performance_bar_enabled,
      :params_performance_bar_allowed_group_path,
      :previous_performance_bar_allowed_group_id,
      :expected_performance_bar_allowed_group_id) do
      true | '' | nil | nil
      true | '' | 42_000_000 | nil
      true | nil | nil | nil
      true | nil | 42_000_000 | nil
      true | 'foo' | nil | nil
      true | 'foo' | 42_000_000 | nil
      true | 'group_a' | nil | 42_000_000
      true | 'group_b' | 42_000_000 | 43_000_000
      true | 'group_a' | 42_000_000 | 42_000_000
      false | '' | nil | nil
      false | '' | 42_000_000 | nil
      false | nil | nil | nil
      false | nil | 42_000_000 | nil
      false | 'foo' | nil | nil
      false | 'foo' | 42_000_000 | nil
      false | 'group_a' | nil | nil
      false | 'group_b' | 42_000_000 | nil
      false | 'group_a' | 42_000_000 | nil
    end

    with_them do
      let(:params) do
        {
          performance_bar_enabled: params_performance_bar_enabled,
          performance_bar_allowed_group_path: params_performance_bar_allowed_group_path
        }
      end

      before do
        if previous_performance_bar_allowed_group_id == 42_000_000 || params_performance_bar_allowed_group_path == 'group_a'
          create(:group, id: 42_000_000, path: 'group_a')
        end

        if expected_performance_bar_allowed_group_id == 43_000_000 || params_performance_bar_allowed_group_path == 'group_b'
          create(:group, id: 43_000_000, path: 'group_b')
        end

        application_settings.update!(performance_bar_allowed_group_id: previous_performance_bar_allowed_group_id)
      end

      it 'sets performance_bar_allowed_group_id when present and performance_bar_enabled == true' 

    end

    context 'when :performance_bar_allowed_group_path is not present' do
      let(:group) { create(:group) }

      before do
        application_settings.update!(performance_bar_allowed_group_id: group.id)
      end

      it 'does not change the performance bar settings' 

    end

    context 'when :performance_bar_enabled is not present' do
      let(:group) { create(:group) }
      let(:params) { { performance_bar_allowed_group_path: group.full_path } }

      it 'implicitely defaults to true' 

    end
  end
end

