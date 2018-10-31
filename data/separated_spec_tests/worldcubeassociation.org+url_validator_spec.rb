# frozen_string_literal: true

require 'rails_helper'
require 'relations'

RSpec.describe UrlValidator do
  it "validates urls" 

end

class TestModel
  include ActiveModel::Model

  attr_accessor :url
  validates :url, url: true
end

