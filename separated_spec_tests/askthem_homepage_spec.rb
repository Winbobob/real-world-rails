require "spec_helper"
require File.expand_path("../features_helper.rb", __FILE__)

describe "pages#index" do
  before do
    FactoryGirl.create(:metadatum, abbreviation: "ny")
  end

  describe "Get Answers from Elected Officials", :vcr do
    it "can list questions near an address or zipcode" 


    it "can search for federal people matching an address or zipcode" 

  end

  def set_up_ny_local_questions
    @user = FactoryGirl.create(:user)
    @metadatum = FactoryGirl.create(:metadatum, abbreviation: @user.region)
    @person = FactoryGirl.create(:state_legislator_ny_sheldon_silver)
    @local_questions = []
    3.times do
      @local_questions << FactoryGirl.create(:question,
                                             person: @person,
                                             user: @user,
                                             state: @metadatum.abbreviation)
    end
  end

  def set_up_ca_questions
    # create some content that is not "near" our user
    california = FactoryGirl.create(:metadatum, abbreviation: "ca")
    cali_user = FactoryGirl.create(:user,
                                   region: california.abbreviation,
                                   coordinates: [-118.290474, 34.100535])
    cali_person = FactoryGirl.create(:person,
                                     state: california.abbreviation)
    @ca_questions = []
    3.times do
      @ca_questions << FactoryGirl.create(:question,
                                          person: cali_person,
                                          user: cali_user,
                                          state: california.abbreviation)
    end

  end
end

