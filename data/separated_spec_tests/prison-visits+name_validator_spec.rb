require 'rails_helper'
require 'name_validator'

RSpec.describe NameValidator do
  subject do
    described_class.new(attributes: [:first_name])
  end

  let! :model do
    Visitor.new
  end

  it "doesn't allow for special characters in names" 


  it "enforces that names should be under 30 bytes in length" 


  it "allows legitimate names" 

end

