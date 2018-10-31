# encoding: UTF-8

require 'rails_helper'

describe Topic do
  let(:job_klass) { Jobs::ToggleTopicClosed }

  context 'creating a topic without auto-close' do
    let(:topic) { Fabricate(:topic, category: category) }

    context 'uncategorized' do
      let(:category) { nil }

      it 'should not schedule the topic to auto-close' 

    end

    context 'category without default auto-close' do
      let(:category) { Fabricate(:category, auto_close_hours: nil) }

      it 'should not schedule the topic to auto-close' 

    end

    context 'jobs may be queued' do
      before do
        freeze_time
      end

      context 'category has a default auto-close' do
        let(:category) { Fabricate(:category, auto_close_hours: 2.0) }

        it 'should schedule the topic to auto-close' 


        context 'topic was created by staff user' do
          let(:admin) { Fabricate(:admin) }
          let(:staff_topic) { Fabricate(:topic, user: admin, category: category) }

          it 'should schedule the topic to auto-close' 


          context 'topic is closed manually' do
            it 'should remove the schedule to auto-close the topic' 

          end
        end

        context 'topic was created by a non-staff user' do
          let(:regular_user) { Fabricate(:user) }
          let(:regular_user_topic) { Fabricate(:topic, user: regular_user, category: category) }

          it 'should schedule the topic to auto-close' 

        end
      end
    end
  end
end

