# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/training_module_due_date_manager"
require "#{Rails.root}/lib/training_module"

describe TrainingModuleDueDateManager do
  let(:t_start)      { Date.new(2015, 8, 25) }
  let(:day_exc)      { nil }
  let(:course) do
    create(:course, timeline_start: t_start, timeline_end: t_start + 3.weeks,
                    day_exceptions: day_exc, weekdays: '0010000')
  end
  let(:t_module)     { TrainingModule.all.first }
  let(:ids)          { [t_module.id] }
  let(:user)         { create(:user) }
  let(:completed_at) { nil }
  let!(:tmu) do
    create(:training_modules_users,
           training_module_id: t_module.id,
           user_id: user&.id,
           completed_at: completed_at)
  end
  let(:due_date) { t_start + 1. week }
  let(:week)     { create(:week, course_id: course.id, order: 1) }
  let!(:block) do
    create(:block, week_id: week.id, training_module_ids: ids, due_date: due_date)
  end

  describe '#computed_due_date' do
    subject do
      described_class.new(course: course, training_module: t_module, user: user)
                     .computed_due_date
    end
    context "module's parent block has a due date" do
      it "uses the parent block's due date" 

    end

    context "module's parent block does not have due date" do
      let(:due_date) { nil }
      let(:expected) { t_start.end_of_week(:sunday) }
      context "block's parent week is not a blackout week" do
        it "uses the last day of the block's parent week" 

        it 'is a Saturday, since weeks run Sun-Sat' 

      end
      context 'week 2 is a blackout week; week in order 2 is actually calendar week 3' do
        let(:week2)    { create(:week, course_id: course.id, order: 2) }
        let(:day_exc)  { (t_start + 1.week).to_s.delete('-') }
        let(:expected) { (t_start + 2.weeks).end_of_week(:sunday) }
        let(:t_module2) { TrainingModule.find(11) }
        let(:ids2) { [t_module2.id] }
        let(:block2) do
          create(:block, week_id: week2.id, training_module_ids: ids2, due_date: nil)
        end

        it 'uses the Saturday of the correct week' 

      end
    end
  end

  describe '#overdue?' do
    before(:all) { Timecop.travel(Date.new(2015, 8, 25)) }
    after(:all)  { Timecop.return }
    subject do
      described_class.new(course: course, training_module: t_module, user: user)
                     .overdue?
    end
    context 'module is not complete' do
      context "today's date is before computed_due_date" do
        it 'returns false' 

      end
      context "today's date is computed_due_date" do
        let(:due_date) { Date.today }
        it 'returns false' 

      end
      context "today's date is after computed_due_date" do
        let(:due_date) { 1.week.ago.to_date }
        it 'returns true' 

      end
    end

    context 'module is complete' do
      let(:completed_at) { 10.days.ago.to_date }
      let(:due_date) { 1.week.ago.to_date }
      it 'returns false' 

    end
  end

  describe '#deadline_status' do
    before(:all) { Timecop.travel(Date.new(2015, 8, 25)) }
    after(:all)  { Timecop.return }

    let(:completed_at) { 1.day.ago }

    subject do
      described_class.new(course: course, training_module: t_module, user: user)
                     .deadline_status
    end
    context 'user is nil' do
      let(:user) { nil }
      it 'returns nil' 

    end
    context 'module completed' do
      it 'returns "complete"' 

    end
    context 'module incomplete' do
      let(:completed_at) { nil }
      context 'due date in future' do
        let(:due_date) { 1.week.from_now }
        it 'returns nil' 

      end
      context 'overdue' do
        let(:due_date) { 1.week.ago }
        it 'returns "overdue"' 

      end
    end
  end

  describe '#overall_due_date' do
    before(:all) { Timecop.travel(Date.new(2015, 8, 25)) }
    after(:all)  { Timecop.return }

    let!(:cu) { create(:courses_user, user_id: user&.id, course_id: course.id) }

    subject do
      described_class.new(course: course, training_module: t_module, user: user)
                     .overall_due_date
    end
    context 'user is nil' do
      let(:user) { nil }
      it 'returns nil' 

    end

    context 'user is present' do
      context 'user belongs to one course with the module assigned' do
        context 'block has a due date' do
          it "returns parent block's due date" 

        end
        context 'block has no due date' do
          let(:due_date) { nil }
          # end of the first week of the course timeline
          let(:expected) { course.timeline_start.end_of_week(:sunday).to_date }
          it "uses the parent week's date" 

        end
      end

      context 'user belongs to two courses with the module assigned' do
        let(:course2)   { create(:course, timeline_start: Date.today, slug: 'foo/2') }
        let!(:cu2)      { create(:courses_user, user_id: user.id, course_id: course2.id) }
        let(:week2)     { create(:week, course_id: course2.id, order: 1) }
        let(:due_date2) { 1.week.ago.to_date }
        let!(:block2)   do
          create(:block, week_id: week2.id, due_date: due_date2, training_module_ids: ids)
        end
        context 'one block has a due date, the other does not' do
          let(:due_date2) { nil }
          it 'uses the earlier of the existent block due date '\
             'or the end of the week of the block without a date' do
            expect(subject).to eq(Date.today.end_of_week(:sunday))
          end
        end

        context 'both blocks have a due date' do
          it 'uses earliest date' 

        end
      end
    end
  end
end
