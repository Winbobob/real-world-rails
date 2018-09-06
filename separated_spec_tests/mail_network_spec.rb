# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

class MyDelivery; def initialize(settings); end; end

class MyRetriever; def initialize(settings); end; end

describe "Mail" do

  before(:each) do
    # Reset all defaults back to original state
    Mail.defaults do
      delivery_method :smtp, { :address              => "localhost",
                               :port                 => 25,
                               :domain               => 'localhost.localdomain',
                               :user_name            => nil,
                               :password             => nil,
                               :authentication       => nil,
                               :enable_starttls_auto => true  }

      retriever_method :pop3, { :address             => "localhost",
                                :port                => 110,
                                :user_name           => nil,
                                :password            => nil,
                                :enable_ssl          => true }
    end
  end

  describe "default delivery and retriever methods" do

    it "should set the delivery method" 


    it "should default to settings for smtp" 


    it "should set the retriever method" 


    it "should default to settings for pop3" 


    it "should allow us to overwrite anything we need on SMTP" 


    it "should allow us to overwrite anything we need on POP3" 


    it "should allow you to pass in your own delivery method" 


    it "should ask the custom delivery agent for its settings" 


    it "should allow you to pass in your own retriever method" 


    it "should ask the custom retriever agent for its settings" 


  end

  describe "instance delivery methods" do

    it "should copy the defaults defined by Mail.defaults" 


    it "should be able to change the delivery_method" 


    it "should be able to change the delivery_method and pass in settings" 


    it "should not change the default when it changes the delivery_method" 


    it "should not change the default settings when it changes the delivery_method settings" 


  end

  describe "retrieving emails via POP3" do
    it "should retrieve all emails via POP3" 

  end

  describe "sending emails via SMTP" do

    before(:each) do
      # Set the delivery method to test as the default
      MockSMTP.clear_deliveries
    end

    it "should deliver a mail message" 


    it "should deliver itself" 


  end

  describe "deliveries" do

    class MyDeliveryMethod
      attr_accessor :settings
      def initialize(values = {}); end
      def deliver!(message); true; end
    end

    class MyObserver
      def self.delivered_email(message); end
    end

    class MyDeliveryHandler
      def deliver_mail(mail)
        postman = MyDeliveryMethod.new
        postman.deliver!(mail)
      end
    end

    class MyYieldingDeliveryHandler
      def deliver_mail(mail)
        yield
      end
    end

    before(:each) do
      @message = Mail.new do
        from 'mikel@test.lindsaar.net'
        to 'ada@test.lindsaar.net'
        subject 'Re: No way!'
        body 'Yeah sure'
      end
      @message.delivery_method :test
    end

    describe "adding to Mail.deliveries" do
      it "should add itself to the deliveries collection on mail on delivery" 

    end

    describe "perform_deliveries" do
      it "should call deliver! on the delivery method by default" 


      it "should not call deliver if perform deliveries is set to false" 


      it "should add to the deliveries array if perform_deliveries is true" 


      it "should not add to the deliveries array if perform_deliveries is false" 

    end

    describe "observers" do
      it "should tell its observers that it was told to deliver an email" 


      it "should tell its observers that it was told to deliver an email even if perform_deliveries is false" 


      it "should tell its observers that it was told to deliver an email even if it is using a delivery_handler" 


    end

    describe "raise_delivery_errors" do
      it "should pass on delivery errors if raised" 


      it "should not pass on delivery errors if raised raise_delivery_errors is set to false" 


      it "should pass through Exceptions even when raise_delivery_errors is set to false" 

    end

    describe "delivery_handler" do

      it "should allow you to hand off performing the actual delivery to another object" 


      it "mail should be told to :deliver once and then :deliver! once by the delivery handler" 


      it "mail only call its delivery_method once" 


      it "mail should not catch any exceptions when using a delivery_handler" 


      it "mail should not modify the Mail.deliveries object if using a delivery_handler that does not append to deliveries" 


      it "should be able to just yield and let mail do its thing" 


    end

  end

end

