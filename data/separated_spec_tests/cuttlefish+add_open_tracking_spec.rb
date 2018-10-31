# frozen_string_literal: true

require "spec_helper"

describe Filters::AddOpenTracking do
  let(:tracking_domain_info) { { protocol: "https", domain: "localhost" } }
  let(:filter) do
    Filters::AddOpenTracking.new(
      delivery_id: 673,
      enabled: true,
      tracking_domain_info: tracking_domain_info
    )
  end

  describe "#url" do
    it "should normally be an https url to the default domain" 


    context "using a different domain over http" do
      let(:tracking_domain_info) do
        { protocol: "http", domain: "email.planningalerts.org.au" }
      end

      it "should use a custom domain if it is set (and also not use ssl)" 

    end
  end

  describe "#data" do
    context "An html email with no text part" do
      let(:mail) do
        Mail.new do
          html_part do
            content_type "text/html; charset=UTF-8"
            body "<h1>This is HTML with “some” UTF-8</h1>"
          end
        end
      end

      it "should insert an image at the bottom of the html" 


      context "app has disabled open tracking" do
        before :each do
          filter.enabled = false
        end
      end
    end

    context "a text email with no html part" do
      let(:mail) do
        Mail.new do
          text_part do
            body "Some plain text"
          end
        end
      end

      it "should do nothing to the content of the email" 

    end

    context "a text email with a single part" do
      let(:mail) do
        Mail.new do
          body "Some plain text"
        end
      end

      it "should do nothing to the content of the email" 

    end

    context "an html email with one part" do
      let(:body) do
        <<~EMAIL
          From: They Vote For You <contact@theyvoteforyou.org.au>
          To: matthew@openaustralia.org
          Subject: An html email
          Mime-Version: 1.0
          Content-Type: text/html;
           charset=UTF-8
          Content-Transfer-Encoding: 7bit

          <p>Hello This an html email</p>
        EMAIL
      end

      let(:mail) do
        Mail.new(body)
      end

      it "should add an image" 

    end

    context "an email with a text part and an html part" do
      let(:mail) do
        Mail.new do
          text_part do
            body "Some plain text"
          end
          html_part do
            content_type "text/html; charset=UTF-8"
            body "<table>I like css</table>"
          end
        end
      end

      it "should do nothing to the text part of the email" 


      it "should append an image to the html part of the email" 

    end
  end
end

