# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe Config do
    describe ".get" do
      it "should call #show" 


      it "should return the requested part of the config" 

    end

    describe '.main_app_config' do
      let(:main_app_config_path) { "#{Rails.root}/config/alchemy/config.yml" }

      it "should call and return .read_file with the correct config path" 

    end

    describe '.env_specific_config' do
      let(:env_specific_config_path) { "#{Rails.root}/config/alchemy/#{Rails.env}.config.yml" }

      it "should call and return .read_file with the correct config path" 

    end

    describe ".show" do
      context "when ivar @config was not set before" do
        before { Config.instance_variable_set("@config", nil) }

        it "should call and return .merge_configs!" 

      end

      context "when ivar @config was already set" do
        before { Config.instance_variable_set("@config", {setting: 'true'}) }
        after { Config.instance_variable_set("@config", nil) }

        it "should have memoized the return value of .merge_configs!" 

      end
    end

    describe '.read_file' do
      context 'when given path to yml file exists' do
        context 'and file is empty' do
          before do
            # YAML.safe_load returns nil if file is empty.
            allow(YAML).to receive(:safe_load) { nil }
          end

          it "should return an empty Hash" 

        end
      end

      context 'when given path to yml file does not exist' do
        it 'should return an empty Hash' 

      end
    end

    describe '.merge_configs!' do
      let(:config_1) do
        {setting_1: 'same', other_setting: 'something'}
      end

      let(:config_2) do
        {setting_1: 'same', setting_2: 'anything'}
      end

      it "should stringify the keys" 


      context 'when all passed configs are empty' do
        it "should raise an error" 

      end

      context 'when configs containing same keys' do
        it "should merge them together" 

      end
    end
  end
end

