require 'spec_helper'
require File.expand_path("../features_helper.rb", __FILE__)

describe "people" do
  describe '#show' do
    context "when has a staff inspected user account" do
      let(:identity) { FactoryGirl.create(:identity, status: 'verified') }
      let(:person) { identity.person }

      it "is listed as verified" 

    end

    context "when does not staff inspected user account" do
      let(:person) { FactoryGirl.create(:person) }

      it "doesn't list as verified" 

    end
  end

  def set_up_person_and_metadatum(person)
    person.write_attribute :active, true
    person.save
    stub_metadatum_chambers(person)
  end

  def stub_metadatum_chambers(person)
    person.metadatum.write_attribute(:chambers, { "lower" =>
                                       { "name"=>"House",
                                         "title"=>"Representative" } })
    person.metadatum.save
  end
end

