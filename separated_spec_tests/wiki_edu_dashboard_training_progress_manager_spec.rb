# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/training_progress_manager"
require "#{Rails.root}/lib/training_module"

describe TrainingProgressManager do
  let(:user)     { create(:user) }
  # first and last slide
  let(:t_module) { TrainingModule.find_by(slug: 'editing-basics') }
  let(:slides)   { [t_module.slides.first, t_module.slides.last] }
  let(:slide)    { slides.first }
  let(:last_slide_completed) { slides.first.slug }
  let!(:tmu) do
    create(:training_modules_users, user_id: user&.id, training_module_id: t_module.id,
                                    last_slide_completed: last_slide_completed,
                                    completed_at: completed_at)
  end
  let(:completed_at) { nil }
  let(:ids) { [t_module.id] }
  let(:week) { create(:week, course: course) }
  let(:course) { create(:course) }
  let!(:block) do
    create(:block, training_module_ids: ids, week_id: week.id)
  end

  subject { described_class.new(user, t_module) }

  describe '#slide_completed?' do
    context 'tmu is nil' do
      let(:tmu) { nil }
      it 'returns false' 

    end

    context 'last slide completed is nil' do
      let(:last_slide_completed) { nil }
      it 'returns false' 

    end

    context 'last slide completed is first slide' do
      it 'returns true' 

    end

    context 'last slide completed is first slide; slide in question is last slide' do
      let(:last_slide_completed) { slides.first.slug }
      let(:slide) { slides.last }
      it 'returns false' 

    end
  end

  describe '#slide_enabled?' do
    context 'user (current_user) is nil (if user is not signed in, all of training is available' do
      let(:user) { nil }
      it 'returns true' 

    end

    context 'tmu is nil (user has not started module yet)' do
      let(:tmu) { nil }
      context 'slide is first slide' do
        it 'returns true' 

      end
      context 'slide is not first slide' do
        let(:slide) { slides.last }
        it 'returns false' 

      end
    end

    context 'slide is first slide; no slides viewed for this module' do
      let(:last_slide_completed) { nil }
      it 'returns true' 

    end

    context 'slide has been seen' do
      let(:last_slide_completed) { slides.first.slug }
      let(:slide) { slides.first }
      it 'returns true' 

    end

    context 'slide has not been seen' do
      let(:last_slide_completed) { slides.first.slug }
      let(:slide) { slides.last }
      it 'returns false' 

    end
  end

  describe '#module_completed?' do
    context 'user is nil' do
      let(:user) { nil }
      it 'returns false' 

    end

    context 'tmu is nil' do
      before { TrainingModulesUsers.where(user_id: user.id).destroy_all }
      it 'returns false' 

    end

    context 'completed_at is nil for tmu' do
      it 'returns false' 

    end

    context 'completed_at is present for tmu' do
      let(:completed_at) { Time.now }
      it 'returns true' 

    end
  end

  describe '#assignment_status' do
    subject { described_class.new(user, t_module).assignment_status }

    context 'no blocks with this module assigned' do
      before { Block.destroy_all }
      let(:ids) { nil }
      it 'returns nil' 

    end

    context 'module is completed' do
      let(:completed_at) { Time.now }
      before do
        allow_any_instance_of(TrainingModuleDueDateManager)
          .to receive(:blocks_with_module_assigned).with(t_module).and_return([block])
        allow_any_instance_of(TrainingModuleDueDateManager)
          .to receive(:computed_due_date).and_return(Date.yesterday)
      end
      it 'returns "Training Assignment (completed)"' 

    end
  end

  describe '#module_progress' do
    context 'user is nil' do
      let(:user) { nil }
      it 'returns nil' 

    end

    context 'completed' do
      let(:completed_at) { Time.now }
      let(:last_slide_completed) { slides.last.slug }
      it 'returns "completed"' 

    end

    context 'not started' do
      let(:completed_at) { nil }
      let(:last_slide_completed) { nil }
      it 'returns nil' 

    end

    context 'partial completion' do
      context 'round down' do
        let(:completed_at) { nil }
        context 'roughly one third' do
          let(:index) { t_module.slides.length / 3 }
          let(:last_slide_completed) { t_module.slides[index].slug }
          let(:target_percentage) { 33 }
          it 'returns a percentage' 

        end
      end

      context 'round up' do
        let(:completed_at) { nil }
        context 'roughly two thirds' do
          let(:index) { t_module.slides.length / 3 }
          let(:last_slide_completed) { t_module.slides[index * 2].slug }
          let(:target_percentage) { 66 }
          it 'returns a percentage' 

        end
      end
    end
  end
end

