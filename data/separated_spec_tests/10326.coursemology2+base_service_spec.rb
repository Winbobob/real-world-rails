# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Course::Duplication::BaseService' do
  class self::BadService < Course::Duplication::BaseService
  end

  class self::GoodService < Course::Duplication::BaseService
    def initialize_duplicator(*)
      true
    end
  end

  describe 'correctly implemented duplication services', type: :model do
    subject { self.class::GoodService.new(options) }

    context 'when the options are incorrect' do
      it 'raises an error' 

    end

    context 'when the options includes time_shift' do
      let(:options) { { time_shift: :baz, mode: :foo } }
      it 'does not raise an error' 

    end
  end

  describe 'incorrectly implemented duplication service', type: :model do
    subject { self.class::BadService.new(time_shift: :baz, mode: :foo) }

    it 'raises an error' 

  end
end

