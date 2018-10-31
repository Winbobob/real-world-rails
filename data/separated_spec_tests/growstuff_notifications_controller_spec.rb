require 'rails_helper'

describe NotificationsController do
  login_member

  def valid_attributes
    {
      "recipient_id" => subject.current_member.id,
      "sender_id" => FactoryBot.create(:member).id,
      "subject" => 'test'
    }
  end

  # this gets a bit confused because for most of the notification tests
  # (reading, etc) the logged in member needs to be the recipient.
  # However, for sending private messages (create, etc) the logged in
  # member needs to be the sender.  Hence this separate set of
  # attributes.
  def valid_attributes_for_sender
    {
      "sender_id" => subject.current_member.id,
      "recipient_id" => FactoryBot.create(:member).id,
      "subject" => 'test'
    }
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all notifications as @notifications" 

  end

  describe "GET show" do
    it "assigns the requested notification as @notification" 


    it "assigns the reply link for a post comment" 


    it "marks notifications as read" 

  end

  describe "GET reply" do
    it "marks notifications as read" 

  end

  describe "GET new" do
    it "assigns a recipient" 

  end

  describe "POST create" do
    describe "with valid params" do
      it "redirects to the recipient's profile" 

    end
  end
end

