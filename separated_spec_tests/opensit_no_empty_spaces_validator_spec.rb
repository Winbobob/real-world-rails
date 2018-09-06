require 'spec_helper'

class ValidatableSpaces
  include ActiveModel::Validations
  attr_accessor :string
  validates :string, no_empty_spaces: true
end

describe NoEmptySpacesValidator do
  let(:validatable) { ValidatableSpaces.new }

  context "when given a string with no spaces" do
    it "is valid" 

  end

  context "when given a string with spaces" do
    it "is not valid" 

  end
end

