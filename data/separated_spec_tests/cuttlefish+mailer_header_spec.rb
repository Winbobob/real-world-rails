# frozen_string_literal: true

require "spec_helper"

describe Filters::MailerHeader do
  let(:mail) do
    Mail.new do
      text_part do
        body "An email with some text and headers"
      end
    end
  end
  let(:filter) { Filters::MailerHeader.new(version: APP_VERSION) }

  describe "#data" do
    context "Version 1.2 of the app" do
      before(:each) { filter.version = "1.2" }

      it "should add an X-Mailer header" 


      it "shouldn't alter anything else" 

    end
  end
end

