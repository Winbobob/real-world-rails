require 'rails_helper'

describe FormHelper do
  describe 'form_errors' do
    it 'returns nil when model has no errors' 


    it 'renders an alert div' 


    it 'contains a summary message' 


    it 'renders each message' 


    def errors_stub(*messages)
      ActiveModel::Errors.new(double).tap do |errors|
        messages.each { |msg| errors.add(:base, msg) }
      end
    end
  end
end

