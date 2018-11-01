#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

describe OpenProject::Configuration do
  describe '.load_config_from_file' do
    let(:file_contents) {
      <<-EOS
      default:

        test:
        somesetting: foo
      EOS
    }
    before do
      allow(File).to receive(:read).and_call_original
      allow(File).to receive(:read).with('configfilename').and_return(file_contents)
      allow(File).to receive(:file?).with('configfilename').and_return(true)

      OpenProject::Configuration.load(file: 'configfilename')
    end

    it 'should merge the config from the file into the given config hash' 

  end

  describe '.load_env_from_config' do
    describe 'with a default setting' do
      let(:config) {
        OpenProject::Configuration.send(:load_env_from_config, {
                                          'default' => { 'somesetting' => 'foo' },
                                          'test' => {},
                                          'someother' => { 'somesetting' => 'bar' }
                                        }, 'test')}

      it 'should load a default setting' 

    end

    describe 'with an environment-specific setting' do
      let(:config) {
        OpenProject::Configuration.send(:load_env_from_config, {
                                          'default' => {},
                                          'test' => { 'somesetting' => 'foo' }
                                        }, 'test')}

      it 'should load a setting' 

    end

    describe 'with a default and an overriding environment-specific setting' do
      let(:config) {
        OpenProject::Configuration.send(:load_env_from_config, {
                                          'default' => { 'somesetting' => 'foo' },
                                          'test' => { 'somesetting' => 'bar' }
                                        }, 'test')}

      it 'should load the overriding value' 

    end
  end

  describe '.load_overrides_from_environment_variables' do
    let(:config) {
      {
        'someemptysetting' => nil,
        'nil' => 'foobar',
        'str_empty' => 'foobar',
        'somesetting' => 'foo',
        'some_list_entry' => nil,
        'nested' => {
          'key' => 'value',
          'hash' => 'somethingelse',
          'deeply_nested' => {
            'key' => nil
          }
        },
        'foo' => {
          'bar' => {
            'hash_with_symbols': 1234
          }
        }
      }
    }

    let(:env_vars) {
      {
        'SOMEEMPTYSETTING' => '',
        'SOMESETTING' => 'bar',
        'NIL' => '!!null',
        'STR_EMPTY' => '!!str',
        'OPTEST_SOME__LIST__ENTRY' => '[foo, bar , xyz, whut wat]',
        'OPTEST_NESTED_KEY' => 'baz',
        'OPTEST_NESTED_DEEPLY__NESTED_KEY' => '42',
        'OPTEST_NESTED_HASH' => '{ foo: bar, xyz: bla }',
        'OPTEST_FOO_BAR_HASH__WITH__SYMBOLS' => '{ foo: !ruby/symbol foobar }'
      }
    }

    before do
      stub_const('OpenProject::Configuration::ENV_PREFIX', 'OPTEST')

      OpenProject::Configuration.send :override_config!, config, env_vars
    end

    it 'should not parse the empty value' 


    it 'should parse the null identifier' 


    it 'should parse the empty string' 


    it 'should override the previous setting value' 


    it 'should override a nested value' 


    it 'should override values nested several levels deep' 


    it 'should parse simple comma-separated lists' 


    it 'should parse simple hashes' 


    it 'should parse hashes with symbols and non-string values' 

  end

  describe '.with' do
    before do
      expect(OpenProject::Configuration).to receive(:load_config_from_file) do |_filename, _env, config|
        config.merge!('somesetting' => 'foo')
      end
      OpenProject::Configuration.load(env: 'test')
    end

    it 'should return the overriden the setting within the block' 

  end

  describe '.convert_old_email_settings' do
    let(:settings) {
      {
        'email_delivery' => {
          'delivery_method' => :smtp,
          'perform_deliveries' => true,
          'smtp_settings' => {
            'address' => 'smtp.example.net',
            'port' => 25,
            'domain' => 'example.net'
          } } }
    }

    context 'with delivery_method' do
      before do
        OpenProject::Configuration.send(:convert_old_email_settings, settings,
                                        disable_deprecation_message: true)
      end

      it 'should adopt the delivery method' 


      it 'should convert smtp settings' 

    end

    context 'without delivery_method' do
      before do
        settings['email_delivery'].delete('delivery_method')
        OpenProject::Configuration.send(:convert_old_email_settings, settings,
                                        disable_deprecation_message: true)
      end

      it 'should convert smtp settings' 

    end
  end

  describe '.migrate_mailer_configuration!' do
    after do
      # reset this setting value
      Setting[:email_delivery_method] = nil
      # reload configuration to isolate specs
      OpenProject::Configuration.load
      # clear settings cache to isolate specs
      Setting.clear_cache
    end

    it 'does nothing if no legacy configuration given' 


    it 'does nothing if email_delivery_configuration forced to legacy' 


    it 'does nothing if setting already set' 


    it 'migrates the existing configuration to the settings table' 

  end

  describe '.reload_mailer_configuration!' do
    let(:action_mailer) { double('ActionMailer::Base', smtp_settings: {}) }

    before do
      stub_const('ActionMailer::Base', action_mailer)
    end

    after do
      # reload configuration to isolate specs
      OpenProject::Configuration.load
      # clear settings cache to isolate specs
      Setting.clear_cache
    end

    it 'uses the legacy method to configure email settings' 


    it 'allows settings smtp_authentication to none' 


    it 'correctly sets the action mailer configuration based on the settings' 

  end

  describe '.configure_legacy_action_mailer' do
    let(:action_mailer) { double('ActionMailer::Base') }
    let(:config) {
      { 'email_delivery_method' => 'smtp',
        'smtp_address' => 'smtp.example.net',
        'smtp_port' => '25' }
    }

    before do
      stub_const('ActionMailer::Base', action_mailer)
    end

    it 'should enable deliveries and configure ActionMailer smtp delivery' 

  end

  describe '.configure_cache' do
    let(:application_config) { Rails::Application::Configuration.new }

    after do
      # reload configuration to isolate specs
      OpenProject::Configuration.load
    end

    context 'with cache store already set' do
      before do
        application_config.cache_store = 'foo'
      end

      context 'with additional cache store configuration' do
        before do
          OpenProject::Configuration['rails_cache_store'] = 'bar'
        end

        it 'changes the cache store' 

      end

      context 'without additional cache store configuration' do
        before do
          OpenProject::Configuration['rails_cache_store'] = nil
        end

        it 'does not change the cache store' 

      end
    end

    context 'without cache store already set' do
      before do
        application_config.cache_store = nil
      end

      context 'with additional cache store configuration' do
        before do
          OpenProject::Configuration['rails_cache_store'] = 'bar'
        end

        it 'changes the cache store' 

      end

      context 'without additional cache store configuration' do
        before do
          OpenProject::Configuration['rails_cache_store'] = nil
        end
        it 'defaults the cache store to :file_store' 

      end
    end
  end
end

