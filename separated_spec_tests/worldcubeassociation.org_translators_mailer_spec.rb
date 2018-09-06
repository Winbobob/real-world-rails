# frozen_string_literal: true

require "rails_helper"

RSpec.describe TranslatorsMailer, type: :mailer do
  describe "notify_translators_of_changes" do
    let(:mail) { TranslatorsMailer.notify_translators_of_changes }

    it "renders the headers" 

  end
end

