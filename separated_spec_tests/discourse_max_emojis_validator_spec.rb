# encoding: UTF-8

require 'rails_helper'
require 'validators/max_emojis_validator'

describe MaxEmojisValidator do

  # simulate Rails behavior (singleton)
  def validate
    @validator ||= MaxEmojisValidator.new(attributes: :title)
    @validator.validate_each(record, :title, record.title)
  end

  shared_examples "validating any topic title" do
    it 'adds an error when emoji count is greater than SiteSetting.max_emojis_in_title' 

  end

  describe 'topic' do
    let(:record) { Fabricate.build(:topic) }

    it 'does not add an error when emoji count is good' 


    include_examples "validating any topic title"
  end

  describe 'private message' do
    let(:record) { Fabricate.build(:private_message_topic) }

    it 'does not add an error when emoji count is good' 


    include_examples "validating any topic title"
  end
end

