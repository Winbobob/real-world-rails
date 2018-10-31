# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::ControllerComponentHost, type: :controller do
  controller(Course::Controller) do
  end

  class self::DummyCourseModule < SimpleDelegator
    include Course::ControllerComponentHost::Component

    NORMAL_SIDEBAR_ITEM = {
      key: :normal_item,
      title: 'DummyCourseModule',
      type: :normal,
      weight: 1,
      unread: -1
    }.freeze

    ADMIN_SIDEBAR_ITEM = {
      key: :admin_item,
      title: 'DummyCourseModule',
      type: :admin,
      weight: 10,
      unread: -1
    }.freeze

    SETTINGS_SIDEBAR_ITEM = {
      title: 'DummyCourseModule',
      type: :settings,
      weight: 1
    }.freeze

    def sidebar_items
      [NORMAL_SIDEBAR_ITEM, ADMIN_SIDEBAR_ITEM, SETTINGS_SIDEBAR_ITEM]
    end
  end

  class self::DummyGamifiedCourseModule
    include Course::ControllerComponentHost::Component

    def self.gamified?
      true
    end

    def initialize(*)
    end
  end

  class self::DummyCoreCourseModule
    include Course::ControllerComponentHost::Component

    def self.can_be_disabled_for_course?
      false
    end

    def initialize(*)
    end
  end

  class Course::Settings::DummyCourseModule
    def initialize(*)
    end
  end

  let!(:instance) { create(:instance) }
  with_tenant(:instance) do
    let(:user) { create(:administrator) }
    before { sign_in(user) }
    let(:course) { create(:course, instance: instance) }
    before { controller.instance_variable_set(:@course, course) }

    let(:component_host) { Course::ControllerComponentHost.new(controller) }
    let(:default_enabled_components) do
      Course::ControllerComponentHost.components.select(&:enabled_by_default?)
    end

    describe 'Components' do
      subject do
        component_host.components.find do |component|
          component.class == self.class::DummyCourseModule
        end
      end

      it 'has an autogenerated key' 


      describe '.settings_class' do
        context 'when the settings interface class is defined' do
          it 'returns it' 

        end

        context 'when the settings interface class is not defined' do
          subject do
            component_host.components.find do |component|
              component.class == self.class::DummyGamifiedCourseModule
            end
          end

          it 'returns nil' 

        end
      end

      describe '#settings' do
        context 'when the settings interface class is defined' do
          it 'returns a settings object' 

        end

        context 'when the settings interface class is not defined' do
          subject do
            component_host.components.find do |component|
              component.class == self.class::DummyGamifiedCourseModule
            end
          end

          it 'returns nil' 

        end
      end
    end

    describe '#initialize' do
      it 'instantiates all enabled components' 

    end

    describe '#components' do
      subject { component_host.components }

      it 'includes instances of every enabled component' 


      it 'memoises its result' 

    end

    describe '#[]' do
      subject { component_host }

      context 'when the key refers to a disabled component' do
        let(:disabled_component) { self.class::DummyCourseModule }
        before { course.set_component_enabled_boolean(disabled_component.key, false) }

        it 'returns nil' 

      end

      context 'when the key is invalid' do
        it 'raises an error' 

      end

      context 'when the key provided is a string' do
        it 'returns the correct component' 

      end

      context 'when the key provided is a symbol' do
        it 'returns the correct component' 

      end
    end

    describe '#enabled_components' do
      subject { component_host.enabled_components }

      it 'memoises its result' 


      context 'without preferences' do
        it 'returns the default enabled components' 

      end

      context 'with preferences' do
        let(:course_disableable_component) do
          default_enabled_components.find(&:can_be_disabled_for_course?)
        end
        let(:course_undisableable_component) do
          default_enabled_components.drop_while(&:can_be_disabled_for_course?).first
        end

        context 'when a component is disabled for the course' do
          before { course.set_component_enabled_boolean(course_disableable_component.key, false) }

          it 'does not include the disabled component' 

        end

        context 'disable an undisableable component in course' do
          before do
            course.send(:unsafe_set_component_enabled_boolean, course_undisableable_component.key, false)
          end

          it 'ignores the setting and includes the disabled component' 

        end

        context 'when a component is disabled for the instance' do
          before { instance.set_component_enabled_boolean(course_disableable_component.key, false) }

          it 'does not include the disabled component' 

        end

        context 'when a component is enabled' do
          before { course.set_component_enabled_boolean(course_disableable_component.key, true) }

          it 'includes the component' 

        end
      end

      context 'when the gamified flag for the course is set to false' do
        let(:course) { create(:course, instance: instance, gamified: false) }
        let(:gamified_component) { default_enabled_components.find(&:gamified?) }

        it 'does not include gamified components' 

      end
    end

    describe '#sidebar_items' do
      subject { component_host.sidebar_items }
      context 'when there are no components included' do
        it 'returns an empty array' 

      end

      it "gathers all modules' sidebar items" 

    end
  end
end

