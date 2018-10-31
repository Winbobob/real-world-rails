# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContactMailer do

  describe :to_admin_message do

    it 'correctly quotes the name in a "from" address' 


    it 'sets the "From" address to the blackhole address' 


    it 'sets the "Reply-To" header header to the sender' 


    it 'sets the "Return-Path" header to the blackhole address' 


    it 'does not add HTMLEntities to an update public body email subject' 


    it 'does not add HTMLEntities to an add public body email subject' 


    context "when the user is a pro user" do
      let(:pro_user) { FactoryBot.create(:pro_user) }

      it "sends messages to the pro contact address" 

    end

    context "when the user is a normal user" do
      let(:user) { FactoryBot.create(:user) }

      it "sends messages to the normal contact address" 

    end

    context "when no user is a provided" do
      let(:user) { FactoryBot.create(:user) }

      it "sends messages to the normal contact address" 

    end

  end

  describe "#from_admin_message" do
    context "when the receiving user is a pro user" do
      let(:pro_user) { FactoryBot.create(:pro_user) }

      it "sends messages from the pro contact address" 

    end

    context "when the receiving user is a normal user" do
      let(:user) { FactoryBot.create(:user) }

      it "sends messages from the normal contact address" 

    end

    context "when no receiving user can be found" do
      it "sends messages from the normal contact address" 

    end
  end

end

