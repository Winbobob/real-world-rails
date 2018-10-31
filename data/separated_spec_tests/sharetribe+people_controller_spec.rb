# == Schema Information
#
# Table name: people
#
#  id                                 :string(22)       not null, primary key
#  uuid                               :binary(16)       not null
#  community_id                       :integer          not null
#  created_at                         :datetime
#  updated_at                         :datetime
#  is_admin                           :integer          default(0)
#  locale                             :string(255)      default("fi")
#  preferences                        :text(65535)
#  active_days_count                  :integer          default(0)
#  last_page_load_date                :datetime
#  test_group_number                  :integer          default(1)
#  username                           :string(255)      not null
#  email                              :string(255)
#  encrypted_password                 :string(255)      default(""), not null
#  legacy_encrypted_password          :string(255)
#  reset_password_token               :string(255)
#  reset_password_sent_at             :datetime
#  remember_created_at                :datetime
#  sign_in_count                      :integer          default(0)
#  current_sign_in_at                 :datetime
#  last_sign_in_at                    :datetime
#  current_sign_in_ip                 :string(255)
#  last_sign_in_ip                    :string(255)
#  password_salt                      :string(255)
#  given_name                         :string(255)
#  family_name                        :string(255)
#  display_name                       :string(255)
#  phone_number                       :string(255)
#  description                        :text(65535)
#  image_file_name                    :string(255)
#  image_content_type                 :string(255)
#  image_file_size                    :integer
#  image_updated_at                   :datetime
#  image_processing                   :boolean
#  facebook_id                        :string(255)
#  authentication_token               :string(255)
#  community_updates_last_sent_at     :datetime
#  min_days_between_community_updates :integer          default(1)
#  deleted                            :boolean          default(FALSE)
#  cloned_from                        :string(22)
#
# Indexes
#
#  index_people_on_authentication_token          (authentication_token)
#  index_people_on_community_id                  (community_id)
#  index_people_on_email                         (email) UNIQUE
#  index_people_on_facebook_id                   (facebook_id)
#  index_people_on_facebook_id_and_community_id  (facebook_id,community_id) UNIQUE
#  index_people_on_id                            (id)
#  index_people_on_reset_password_token          (reset_password_token) UNIQUE
#  index_people_on_username                      (username)
#  index_people_on_username_and_community_id     (username,community_id) UNIQUE
#  index_people_on_uuid                          (uuid) UNIQUE
#

require 'spec_helper'

describe PeopleController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:person]
  end

  describe "#check_email_availability" do
    before(:each) do
      community = FactoryGirl.create(:community)
      @request.host = "#{community.ident}.lvh.me"
      @request.env[:current_marketplace] = community
    end

    it "should return available if email not in use" 

  end

  describe "#check_email_availability" do
    before(:each) do
      @community = FactoryGirl.create(:community)
      @request.host = "#{@community.ident}.lvh.me"
      @request.env[:current_marketplace] = @community
    end

    it "should return unavailable if email is in use" 


    it "should return NOT available for user's own adress" 


  end

  describe "#create" do
    let(:ordinary_community) { FactoryGirl.create(:community) }
    let(:no_allowed_emails_community) { FactoryGirl.create(:community, allowed_emails: "@examplecompany.co") }
    let(:field1) do
      FactoryGirl.create(:person_custom_text_field, community: ordinary_community)
    end
    let(:field2) do
      FactoryGirl.create(:person_custom_dropdown_field, community: ordinary_community)
    end
    let(:field3) do
      FactoryGirl.create(:custom_numeric_field, community: ordinary_community)
    end
    let(:field4) do
      FactoryGirl.create(:custom_checkbox_field, community: ordinary_community)
    end
    let(:field5) do
      FactoryGirl.create(:custom_date_field, community: ordinary_community)
    end

    it "creates a person" 


    it "doesn't create a person for community if email is not allowed" 


    it "creates a person with custom fields" 


    it "not creates a person with invalid custom fields" 

  end

  describe "#destroy" do
    before(:each) do
      @community = FactoryGirl.create(:community)
      @request.host = "#{@community.ident}.lvh.me"
      @request.env[:current_marketplace] = @community
      @location = FactoryGirl.create(:location)
      @person = FactoryGirl.create(:person,
                                   community_id: @community.id,
                                   location: @location,
                                   display_name: "A User",
                                   description: "My bio.")
      @community.members << @person
      @id = @person.id
      @username = @person.username
      expect(Person.find_by(username: @username, community_id: @community.id)).not_to be_nil
    end

    it "deletes the person" 


    it "doesn't delete if not logged in as target person" 


  end

  def community_host(community)
    @request.host = "#{community.ident}.lvh.me"
    @request.env[:current_marketplace] = community
  end
end

