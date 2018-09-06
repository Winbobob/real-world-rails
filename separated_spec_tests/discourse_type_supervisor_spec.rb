require 'rails_helper'
require_dependency 'site_settings/type_supervisor'

describe SiteSettings::TypeSupervisor do
  let :provider_local do
    SiteSettings::LocalProcessProvider.new
  end

  def new_settings(provider)
    Class.new do
      extend SiteSettingExtension
      self.provider = provider
    end
  end

  let :settings do
    new_settings(provider_local)
  end

  subject { SiteSettings::TypeSupervisor }

  describe 'constants' do
    it 'validator opts are the subset of consumed opts' 

  end

  describe '#types' do
    context "verify enum sequence" do
      it "'string' should be at 1st position" 

      it "'time' should be at 2nd position" 

      it "'integer' should be at 3rd position" 

      it "'float' should be at 4th position" 

      it "'bool' should be at 5th position" 

      it "'null' should be at 6th position" 

      it "'enum' should be at 7th position" 

      it "'list' should be at 8th position" 

      it "'url_list' should be at 9th position" 

      it "'host_list' should be at 10th position" 

      it "'category_list' should be at 11th position" 

      it "'value_list' should be at 12th position" 

      it "'regex' should be at 13th position" 

      it "'email' should be at 14th position" 

      it "'username' should be at 15th position" 

    end
  end

  describe '#parse_value_type' do
    it 'returns :null type when the value is nil' 


    it 'returns :integer type when the value is int' 


    it 'returns :integer type when the value is large int' 


    it 'returns :float type when the value is float' 


    it 'returns :bool type when the value is true' 


    it 'returns :bool type when the value is false' 


    it 'raises when the value is not listed' 


  end

  context 'with different data types' do
    class TestEnumClass
      def self.valid_value?(v)
        self.values.include?(v)
      end
      def self.values
        ['en']
      end
      def self.translate_names?
        false
      end
    end

    class TestSmallThanTenValidator
      def initialize(opts)
      end
      def valid_value?(v)
        v < 10
      end
      def error_message
        ''
      end
    end

    before do
      settings.setting(:type_null, nil)
      settings.setting(:type_int, 1)
      settings.setting(:type_true, true)
      settings.setting(:type_false, false)
      settings.setting(:type_float, 2.3232)
      settings.setting(:type_string, 'string')
      settings.setting(:type_enum_default_string, '2', type: 'enum', choices: ['2'])
      settings.setting(:type_enum_class, 'en', enum: 'TestEnumClass')
      settings.setting(:type_validator, 5, validator: 'TestSmallThanTenValidator')
      settings.setting(:type_mock_validate_method, 'no_value')
      settings.setting(:type_custom, 'custom', type: 'list')
      settings.refresh!
    end

    describe '.to_db_value' do
      let(:true_val) { 't' }
      let(:false_val) { 'f' }

      it 'returns nil value' 


      it 'gives a second chance to guess even told :null type' 


      it 'writes `t` or `f` given the possible bool value' 


      it 'writes `f` if given not `true` value' 


      it 'returns floats value' 


      it 'returns string value' 


      it 'returns enum value with string default' 


      it 'raises when it does not in the enum choices' 


      it 'returns enum value for the given enum class' 


      it 'raises when it does not in the enum class' 


      it 'validates value by validator' 


      it 'raises when the validator says so' 


      it 'tries invoke validate methods' 

    end

    describe '.to_rb_value' do
      let(:true_val) { 't' }
      let(:false_val) { 'f' }

      it 'the type can be overriden by a parameter' 


      it 'returns nil value' 


      it 'returns true when it is true or `t` or `true`' 


      it 'returns false if not one of `true` value' 


      it 'returns float value' 


      it 'returns string value' 


      it 'returns value with string default' 


      it 'returns value with a custom type' 

    end
  end

  describe '.type_hash' do
    class TestEnumClass2
      def self.valid_value?(v)
        self.values.include?(v)
      end
      def self.values
        ['a', 'b']
      end
      def self.translate_names?
        false
      end
    end

    before do
      settings.setting(:type_null, nil)
      settings.setting(:type_int, 1)
      settings.setting(:type_true, true)
      settings.setting(:type_float, 2.3232)
      settings.setting(:type_string, 'string')
      settings.setting(:type_url_list, 'string', type: 'url_list')
      settings.setting(:type_enum_choices, '2', type: 'enum', choices: ['1', '2'])
      settings.setting(:type_enum_class, 'a', enum: 'TestEnumClass2')
      settings.setting(:type_list, 'a', type: 'list', choices: ['a', 'b'])
      settings.refresh!
    end

    it 'returns null type' 

    it 'returns int type' 

    it 'returns bool type' 

    it 'returns float type' 

    it 'returns string type' 

    it 'returns url_list type' 

    it 'returns enum type' 


    it 'returns list choices' 


    it 'returns enum choices' 


    it 'returns enum class' 


  end

end

