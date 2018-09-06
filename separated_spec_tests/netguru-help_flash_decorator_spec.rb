require 'rails_helper'

describe FlashDecorator do
  let(:subject) { described_class.decorate flash  }

  describe '#css_class' do
    context "when flash is a 'notice'" do
      let(:flash) { ['notice', 'some message'] }

      it "returns 'alert-success'" 

    end

    context "when flash is an 'error'" do
      let(:flash) { ['error', 'some message'] }

      it "returns 'alert-danger'" 

    end
  end
end

