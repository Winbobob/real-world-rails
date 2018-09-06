# frozen_string_literal: true

require 'rails_helper'

describe Analytics do
  before do
    Analytics.store.flushdb
  end

  let(:start_date) { Time.utc('2000/01/01') }

  subject { Analytics::Page.new('1') }

  describe 'totals' do
    before do
      subject.increment_actions(new_member: true)
      2.times { subject.increment_actions(new_member: false) }
    end

    it 'counts actions' 


    it 'counts new members' 

  end

  describe 'totals over time' do
    context 'by day' do
      before do
        Timecop.freeze(start_date) do
          2.times { subject.increment_actions }
          subject.increment_actions(new_member: true)

          Timecop.travel(1.day.ago) do
            5.times { subject.increment_actions }
            3.times { subject.increment_actions(new_member: true) }
          end

          Timecop.travel(3.days.ago) do
            3.times { subject.increment_actions }
          end
        end
      end

      it 'counts actions by day' 


      it 'counts new members by day' 

    end

    context 'by hour' do
      before do
        Timecop.freeze(start_date) do
          2.times { subject.increment_actions }
          subject.increment_actions(new_member: true)

          Timecop.travel(1.hour.ago) do
            5.times { subject.increment_actions }
            3.times { subject.increment_actions(new_member: true) }
          end

          Timecop.travel(3.hours.ago) do
            3.times { subject.increment_actions }
          end
        end
      end

      it 'has 12 data points' 


      it 'actions by hour' 


      it 'members by hour' 

    end
  end
end

