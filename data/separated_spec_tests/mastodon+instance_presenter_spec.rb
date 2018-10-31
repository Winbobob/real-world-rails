require 'rails_helper'

describe InstancePresenter do
  let(:instance_presenter) { InstancePresenter.new }

  context do
    around do |example|
      site_description = Setting.site_description
      example.run
      Setting.site_description = site_description
    end

    it "delegates site_description to Setting" 

  end

  context do
    around do |example|
      site_extended_description = Setting.site_extended_description
      example.run
      Setting.site_extended_description = site_extended_description
    end

    it "delegates site_extended_description to Setting" 

  end

  context do
    around do |example|
      open_registrations = Setting.open_registrations
      example.run
      Setting.open_registrations = open_registrations
    end

    it "delegates open_registrations to Setting" 

  end

  context do
    around do |example|
      closed_registrations_message = Setting.closed_registrations_message
      example.run
      Setting.closed_registrations_message = closed_registrations_message
    end

    it "delegates closed_registrations_message to Setting" 

  end

  context do
    around do |example|
      site_contact_email = Setting.site_contact_email
      example.run
      Setting.site_contact_email = site_contact_email
    end

    it "delegates contact_email to Setting" 

  end

  describe "contact_account" do
    around do |example|
      site_contact_username = Setting.site_contact_username
      example.run
      Setting.site_contact_username = site_contact_username
    end

    it "returns the account for the site contact username" 

  end

  describe "user_count" do
    it "returns the number of site users" 

  end

  describe "status_count" do
    it "returns the number of local statuses" 

  end

  describe "domain_count" do
    it "returns the number of known domains" 

  end
end

