# encoding: UTF-8

require 'rails_helper'
require 'validators/topic_title_length_validator'

describe TopicTitleLengthValidator do

  # simulate Rails behavior (singleton)
  def validate
    @validator ||= TopicTitleLengthValidator.new(attributes: :title)
    @validator.validate_each(record, :title, record.title)
  end

  shared_examples "validating any topic title" do
    it 'adds an error when topic title is greater than SiteSetting.max_topic_title_length' 

  end

  describe 'topic' do
    let(:record) { Fabricate.build(:topic) }

    it 'adds an error when topic title is shorter than SiteSetting.min_topic_title_length' 


    it 'does not add an error when length is good' 


    it 'is up to date' 


    include_examples "validating any topic title"
  end

  describe 'private message' do
    let(:record) { Fabricate.build(:private_message_topic) }

    it 'adds an error when topic title is shorter than SiteSetting.min_personal_message_title_length' 


    it 'does not add an error when topic title is shorter than SiteSetting.min_topic_title_length' 


    include_examples "validating any topic title"
  end

end

