# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::ModelComponentHost do
  let!(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:course) { create(:course, instance: instance) }

    class self::DummyComponent
      include Course::ModelComponentHost::Component

      class_attribute :called
      self.called = 0

      def self.after_course_create(_)
        self.called += 1
      end
    end

    describe 'Course Component Host' do
      subject { course }

      it 'invokes ::after_course_create on child components' 

    end
  end
end

