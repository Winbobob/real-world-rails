# frozen_string_literal: true

require 'rails_helper'

describe CurationConcerns::Renderers::AttributeRenderer do
  context 'when schema.org locale information is missing' do
    subject { described_class.new(:size, '3').render }

    it 'does not display microdata' 

  end

  context 'when schema.org locale information is present' do
    subject { described_class.new(:creator, 'Joe Schmoe').render }

    it 'displays microdata' 

  end
end

