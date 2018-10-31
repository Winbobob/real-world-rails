require "rails_helper"

describe UserFullNameValidator do
  let(:validator) { described_class.new(attributes: :name) }
  subject(:validate) { validator.validate_each(record, :name, @name) }
  let(:record) { Fabricate.build(:user, name: @name) }

  context "name not required" do
    before { SiteSetting.full_name_required = false }

    it "allows no name" 


    it "allows name being set" 

  end

  context "name required" do
    before { SiteSetting.full_name_required = true }

    it "adds error for nil name" 


    it "adds error for empty string name" 


    it "allows name being set" 

  end
end

