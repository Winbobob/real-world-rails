require 'rails_helper'

RSpec.describe FeedbackForm, type: :form do
  describe '#save' do
    let(:feedback_form) {
      described_class.new \
        comments: 'lél', suggestions: 'lewl', email_address: 'hue@example.com'
    }

    it 'enqueues a feedback submission job' 

  end
end

