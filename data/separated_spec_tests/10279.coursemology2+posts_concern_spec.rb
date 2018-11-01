# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Discussion::PostsConcern do
  let!(:instance) { Instance.default }
  with_tenant(:instance) do
    describe 'default behaviours' do
      class self::DummyController < ApplicationController
        include Course::Discussion::PostsConcern
      end

      let(:dummy_controller) { self.class::DummyController.new }

      describe '#discussion_topic' do
        it 'raises an error' 

      end

      describe '#create_topic_subscription' do
        it 'raises an error' 

      end
    end
  end
end

