# frozen_string_literal: true

require 'rails_helper'

describe ErrorPresenter do
  context 'with an class exception' do
    subject { described_class.new(ActiveFedora::ObjectNotFoundError) }

    its(:status)  { is_expected.to eq(404) }
    its(:title)   { is_expected.to eq('Not Found') }
    its(:message) { is_expected.to eq('This item is not available') }

    it 'logs the error' 

  end

  context 'with an instance exception' do
    subject { described_class.new(ActionController::RoutingError.new(nil)) }

    its(:status)  { is_expected.to eq(404) }
    its(:title)   { is_expected.to eq('Not Found') }
    its(:message) { is_expected.to eq('This item is not available') }

    it 'logs the error' 

  end

  context 'with no exception' do
    subject { described_class.new }

    its(:status)  { is_expected.to eq(404) }
    its(:title)   { is_expected.to eq('Not Found') }
    its(:message) { is_expected.to eq('This item is not available') }

    it 'logs the error use Scholarsphere::Error' 

  end

  context 'when the i18n key is missing' do
    subject { described_class.new(Fixnum) }

    its(:status)  { is_expected.to eq(500) }
    its(:title)   { is_expected.to eq('Error') }
    its(:message) { is_expected.to eq('There was an error with your request') }

    it "logs that the key isn't there" 

  end
end

