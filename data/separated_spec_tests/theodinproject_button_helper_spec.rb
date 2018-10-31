require 'rails_helper'

RSpec.describe ButtonHelper do
  describe '#signup_button' do
    let(:signup_button) {
      '<a class="button button--primary" href="/sign_up">Sign Up</a>'
    }

    it 'returns a sign up button' 

  end

  describe '#gitter_button' do
    let(:gitter_button) {
      '<a class="button button--secondary" target="_blank" href="https://gitter.im/TheOdinProject/theodinproject">Open Gitter</a>'
    }

    before do
      allow(helper).to receive(:chat_link).and_return('https://gitter.im/TheOdinProject/theodinproject')
    end

    it 'returns a gitter button' 

  end

  describe '#contribute_button' do
    let(:contribute_button) {
      '<a class="button button--primary" href="/contributing">Contribute</a>'
    }

    it 'returns a contribute button' 

  end
end

