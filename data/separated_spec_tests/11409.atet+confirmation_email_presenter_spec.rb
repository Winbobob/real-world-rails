require 'rails_helper'

RSpec.describe ConfirmationEmailPresenter, type: :presenter do
  let(:confirmation_email_presenter) { described_class.new Claim.create }

  describe '#text_email_line_break' do
    it "provides a sequence of fifty '=' to form a line break" 

  end
end

