# frozen_string_literal: true

require 'rails_helper'

class TestMailer < ApplicationMailer
  def send_mail(body)
    mail(
      to: "receiver@example.com",
      subject: "RSpec email",
    ) do |format|
      format.html { render html: body.html_safe }
    end
  end

  def send_mail_with_attachment(body)
    attachments['attachment.rb'] = File.read(__FILE__)
    send_mail(body)
  end
end

RSpec.describe IframeMailInterceptor do
  it "replaces iframes with corresponding links" 


  it "converts embedded YouTube video into normal URL" 


  it "converts embedded Google Maps into normal URL" 


  it "works when attachments are present" 

end

