# frozen_string_literal: true

require "rails_helper"

RSpec.describe HooksController, type: :controller do
  before do
    set_http_header("HTTP_X_HUB_SIGNATURE", "sha1=#{GitHub::WebHook.generate_hmac('{"foo":"bar"}')}")
  end

  describe "invalid webhook request" do
    it "responds with a 400 if there is not payload" 


    it "responds with :forbidden if the signatures are not a match" 

  end

  describe "valid webhook request" do
    it "responds :ok for a valid request" 


    GitHub::WebHook::ACCEPTED_EVENTS.map do |event|
      it "queues a job for the '#{event}' event" 

    end
  end

  private

  def set_http_header(header, value)
    request.env[header] = value
  end

  def send_webhook(payload)
    post :receive, body: payload.to_json, as: :json
  end
end

