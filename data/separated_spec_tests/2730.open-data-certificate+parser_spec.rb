# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Surveyor::Parser do
  let(:parser){ Surveyor::Parser.new }
  it "should translate shortcuts into full model names" 

  it "should translate 'condition' based on context" 

  it "should not translate bad shortcuts" 

  it "should identify models that take blocks" 

  it "should return a survey object" 

  describe 'reference checking' do
    it 'accepts Answer#reference_identifier via underscore or hash syntax' 

  end
END
      survey = Surveyor::Parser.new.parse(survey_text)
      survey.is_a?(Survey).should == true
    end

  end
end

