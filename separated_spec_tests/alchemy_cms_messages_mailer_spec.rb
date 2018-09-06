# frozen_string_literal: true

require 'spec_helper'

def reload_mailer_class(class_name)
  Alchemy.send(:remove_const, class_name)
  load("app/mailers/alchemy/#{class_name.underscore}.rb")
end

module Alchemy
  describe MessagesMailer do
    let(:message) { Message.new(email: 'jon@doe.com', message: 'Lorem ipsum') }
    let(:mail) { MessagesMailer.contact_form_mail(message, 'admin@page.com', 'contact@page.com', 'Subject') }

    it "inherits from ActionMailer::Base" 


    context "with ApplicationMailer defined" do
      before do
        class ::ApplicationMailer; end
        reload_mailer_class("BaseMailer")
        reload_mailer_class("MessagesMailer")
      end

      it "inherits from ApplicationMailer" 

    end

    it "delivers a mail to owner" 


    it "reply_to should be set to senders email" 


    it "mail body includes message" 

  end
end

