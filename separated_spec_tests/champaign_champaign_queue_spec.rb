# frozen_string_literal: true

require 'rails_helper'

describe ChampaignQueue do
  describe '.push' do
    context 'in production' do
      before do
        allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('production'))
      end

      it 'delegates to Client::Sqs' 

    end

    context 'not in production' do
      it 'does nothing' 

    end
  end
end

