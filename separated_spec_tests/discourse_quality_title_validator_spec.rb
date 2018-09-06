# encoding: UTF-8

require 'rails_helper'
require 'validators/quality_title_validator'
require 'ostruct'

module QualityTitleValidatorSpec
  class Validatable < OpenStruct
    include ActiveModel::Validations
    validates :title, quality_title: { unless: :private_message? }
  end
end

describe "A record validated with QualityTitleValidator" do
  let(:valid_title) { "hello this is my cool topic! welcome: all;" }
  let(:short_title) { valid_title.slice(0, SiteSetting.min_topic_title_length - 1) }
  let(:long_title) { valid_title.center(SiteSetting.max_topic_title_length + 1, 'x') }
  let(:xxxxx_title) { valid_title.gsub(/./, 'x') }

  subject(:topic) { QualityTitleValidatorSpec::Validatable.new }

  before(:each) do
    topic.stubs(private_message?: false)
  end

  it "allows a regular title with a few ascii characters" 


  it "allows non ascii" 


  it 'allows Chinese characters' 


  it "allows anything in a private message" 


  it "strips a title when identifying length" 


  it "doesn't allow a long title" 


  it "doesn't allow a short title" 


  it "doesn't allow a title of one repeated character" 


  # describe "with a name" do
  #   it "is not valid without a name" do
  #     subject.stub(:name => nil)
  #     subject.should_not be_valid
  #     subject.should have(1).error_on(:name)
  #     subject.errors[:name].first.should == "can't be blank"
  #   end
  # end
end

