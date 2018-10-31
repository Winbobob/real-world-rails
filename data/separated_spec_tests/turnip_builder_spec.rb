require 'spec_helper'

describe Turnip::Builder do
  let(:feature) { Turnip::Builder.build(feature_file) }

  context 'blank file' do
    let(:feature_file) { File.expand_path('../examples/blank.feature', File.dirname(__FILE__)) }

    it 'has no feature' 


  end

  context 'simple scenarios' do
    let(:feature_file) { File.expand_path('../examples/simple_feature.feature', File.dirname(__FILE__)) }
    let(:steps) { feature.scenarios.first.steps }

    it 'extracts step description' 


    it 'extracts step line' 


    it 'extracts step keyword' 


    it 'extracts full description' 

  end

  context 'with tags' do
    let(:feature_file) { File.expand_path('../examples/tags.feature', File.dirname(__FILE__)) }

    it 'extracts tags' 

  end

  context "with scenario outlines" do
    let(:feature_file) { File.expand_path('../examples/scenario_outline.feature', File.dirname(__FILE__)) }

    it "extracts scenarios" 


    it "replaces placeholders in steps" 

  end

  context "with example tables in scenario outlines" do
    let(:feature_file) { File.expand_path('../examples/scenario_outline_table_substitution.feature', File.dirname(__FILE__)) }

    it "replaces placeholders in tables in steps" 

  end

  context 'with example multiline in scenario outlines' do
    let(:feature_file) { File.expand_path('../examples/scenario_outline_multiline_string_substitution.feature', File.dirname(__FILE__)) }
    let(:steps) { feature.scenarios[1].steps }

    it 'replaces placeholders in multiline in steps' 

  end
end

