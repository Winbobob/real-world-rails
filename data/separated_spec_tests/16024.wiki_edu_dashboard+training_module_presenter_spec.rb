# frozen_string_literal: true

require 'rails_helper'

describe TrainingModulePresenter do
  let!(:user)      { create(:user) }
  let(:lib)        { TrainingLibrary.find_by(slug: 'students') }
  let(:library_id) { lib.slug }
  let(:mod)        { TrainingModule.find_by(slug: 'editing-basics') }
  let(:module_id)  { mod.slug }
  let(:mod_params) { { library_id: library_id, module_id: module_id } }

  describe '#cta_button_text' do
    subject { described_class.new(user, mod_params).cta_button_text }

    context 'user has not started module' do
      it 'returns "Start"' 

    end

    context 'module is completed' do
      before do
        TrainingModulesUsers.create(
          user_id: user.id,
          training_module_id: mod.id,
          completed_at: 1.day.ago,
          last_slide_completed: mod.slides.last.slug
        )
      end

      it 'returns "View"' 

    end

    context 'module is in progress' do
      before do
        TrainingModulesUsers.create(
          user_id: user.id,
          training_module_id: mod.id,
          completed_at: nil,
          last_slide_completed: mod.slides[-2].slug
        )
      end

      it 'returns "Continue"' 

    end
  end

  describe '#cta_button_link' do
    subject { described_class.new(user, mod_params).cta_button_link }

    context 'user has not started module' do
      it 'links to first slide' 

    end

    context 'module is completed' do
      before do
        TrainingModulesUsers.create(
          user_id: user.id,
          training_module_id: mod.id,
          completed_at: 1.day.ago,
          last_slide_completed: mod.slides.last.slug
        )
      end

      it 'links to first slide' 

    end

    context 'module is in progress' do
      before do
        TrainingModulesUsers.create(
          user_id: user.id,
          training_module_id: mod.id,
          completed_at: nil,
          last_slide_completed: mod.slides[-2].slug
        )
      end

      it 'links to current slide' 

    end
  end

  describe '#should_show_ttc?' do
    subject { described_class.new(user, mod_params).should_show_ttc? }

    context 'user has not started module' do
      it 'returns true' 

    end

    context 'module is completed' do
      before do
        TrainingModulesUsers.create(
          user_id: user.id,
          training_module_id: mod.id,
          completed_at: 1.day.ago,
          last_slide_completed: mod.slides.last.slug
        )
      end

      it 'returns true' 

    end

    context 'module is in progress' do
      before do
        TrainingModulesUsers.create(
          user_id: user.id,
          training_module_id: mod.id,
          completed_at: nil,
          last_slide_completed: mod.slides[-2].slug
        )
      end

      it 'returns false' 

    end
  end
end
