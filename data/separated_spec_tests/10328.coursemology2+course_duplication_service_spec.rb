# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Duplication::CourseDuplicationService, type: :service do
  let(:instance) { create(:instance) }
  with_tenant(:instance) do
    let(:admin) { create(:administrator) }
    let(:course) { create(:course) }
    let(:time_shift) { 3.days }
    let(:new_course) do
      options = {
        current_user: admin,
        new_start_at: (course.start_at + time_shift).iso8601,
        new_title: I18n.t('course.duplications.show.new_course_title_prefix')
      }
      Course::Duplication::CourseDuplicationService.duplicate_course(course, options)
    end
    let!(:assessment) { create(:assessment, *assessment_traits, course: course) }
    let(:assessment_traits) { [] }
    let!(:survey) { create(:survey, course: course) }

    describe '#duplicate_course' do
      context 'when saving fails' do
        let!(:invalid_event) do
          create(:course_lesson_plan_event, course: course).tap do |event|
            event.acting_as.update_columns(time_bonus_exp: 1)
            event.acting_as.default_reference_time.update_columns(bonus_end_at: nil)
          end
        end

        it 'rolls back the whole transaction' 

      end

      context 'when children are simple' do
        let!(:forum) { create(:forum, course: course) }
        let!(:milestones) { create_list(:course_lesson_plan_milestone, 3, course: course) }
        let!(:event) { create(:course_lesson_plan_event, course: course) }
        let!(:video) { create(:video, course: course) }

        it 'duplicates a course with the new title' 


        it 'sets the creator of the new course to the current user' 


        it 'time shifts the new course' 


        it 'duplicates levels within the course' 


        it 'duplicates forums' 


        it 'duplicates lesson plan events' 


        it 'duplicates lesson plan milestones' 


        it 'duplicates video tabs' 


        it 'duplicates videos' 

      end

      context 'when assessment has no children' do
        it 'duplicates assessment attributes' 


        it 'duplicates lesson plan items acting as assessments' 

      end

      context 'when assessment has all question types' do
        let(:assessment_traits) { [:with_all_question_types] }

        it 'duplicates questions' 


        it 'duplicates the attachment reference but not the attachment' 

      end

      context 'when assessment has attachments' do
        let(:assessment_traits) { [:with_attachments] }

        it 'duplicates the attachment reference but not the attachment' 

      end

      context 'when course has extra material folders' do
        let!(:creator) { create(:course_manager, course: course).user }
        let!(:updater) { create(:course_teaching_assistant, course: course).user }
        let!(:folders) do
          create_list(:course_material_folder, 3, parent: course.root_folder,
                                                  course: course, creator: creator)
        end

        let!(:content) { create(:course_material, folder: folders[0], creator: creator) }

        before do
          # Updater cannot be assigned in `create` as it will be overwritten.
          content.update_column(:updater_id, updater.id)
          folders.each.map { |folder| folder.update_column(:updater_id, updater.id) }

          # Fix creator/updater for attachment reference
          content.attachment.update_column(:creator_id, creator.id)
          content.attachment.update_column(:updater_id, updater.id)

          course.reload
          new_course.reload

          @new_folders = new_course.material_folders
          @original_folders = course.material_folders
          # Retrieve duplicated material through the folders of the duplicated course
          @new_content = @new_folders.select { |f| f.name == folders[0].name }[0].materials.first
          # Retrieve original material from the database so the timestamp precisions will match
          @content = @original_folders.select { |f| f.name == folders[0].name }[0].materials.first
        end

        it 'duplicates the folders and their contents' 


        it 'keeps the original updater/creator and updated/created time'\
           'for folders and materials' do
          # Check material's updater/creator and updated/created time
          expect(@new_content.updated_at).to eq @content.updated_at
          expect(@new_content.updater_id).to eq @content.updater_id
          expect(@new_content.created_at).to eq @content.created_at
          expect(@new_content.creator_id).to eq @content.creator_id

          # Check folders' updater/creator and updated/created time
          expect(@new_folders.map(&:updated_at)).to match_array @original_folders.map(&:updated_at)
          expect(@new_folders.map(&:updater_id)).to match_array @original_folders.map(&:updater_id)
          expect(@new_folders.map(&:created_at)).to match_array @original_folders.map(&:created_at)
          expect(@new_folders.map(&:creator_id)).to match_array @original_folders.map(&:creator_id)
        end

        it 'keeps the original updater/creator and updated/created time'\
           'for attachment references' do
          expect(@new_content.attachment.updated_at).to eq @content.attachment.updated_at
          expect(@new_content.attachment.updater).to eq @content.attachment.updater
          expect(@new_content.attachment.created_at).to eq @content.attachment.created_at
          expect(@new_content.attachment.creator).to eq @content.attachment.creator
        end

        it 'shifts the start and end times for non-root folders' 

      end

      context 'when course has assessment skills and skill branch' do
        let!(:branch) { create(:course_assessment_skill_branch, :with_skill, course: course) }
        let!(:standalone_skill) { create(:course_assessment_skill, course: course) }

        it 'duplicates skills and skill branches' 

      end

      context 'when course has achievements' do
        # Create 2 achievements. The first depends on the second achievement and a level.
        let!(:achievements) { create_list(:course_achievement, 2, course: course) }
        let!(:achievement_with_badge) { create(:course_achievement, :with_badge, course: course) }
        let!(:achievement_condition) do
          create(:course_condition_achievement, course: course, achievement: achievements[1],
                                                conditional: achievements[0])
        end
        let!(:level_condition) do
          create(:course_condition_level, course: course, conditional: achievements[0])
        end
        # This condition is necessary to make sure achievements are declared after material_folders
        # in the definition of the Course model.
        let!(:assessment_condition) do
          create(:course_condition_assessment, course: course, assessment: assessment,
                                               conditional: achievements[0])
        end

        it 'duplicates achievements' 


        it 'duplicates achievement with attached badge' 


        it 'duplicates achievement conditions' 

      end

      context 'when survey has no children' do
        let!(:survey) { create(:survey, section_count: 0, course: course) }
        it 'duplicates assessment attributes' 


        it 'duplicates lesson plan items acting as assessments' 

      end

      context 'when survey has all question types' do
        let!(:survey) do
          create(:survey, section_traits: [:with_all_question_types], course: course)
        end

        it 'duplicates questions' 

      end

      context 'when survey question options has attachments' do
        let!(:survey_question) do
          create(:survey_question, :multiple_choice, section: survey.sections.first,
                                                     option_traits: [:with_attachment])
        end

        it 'duplicates the question options' 


        it 'duplicates the attachment references but not the attachments' 

      end

      context 'when assessment categories have settings' do
        let!(:categories) { create_list(:course_assessment_category, 2, course: course) }

        before do
          context = OpenStruct.new(key: Course::AssessmentsComponent.key, current_course: course)
          settings_interface = Course::Settings::AssessmentsComponent.new(context)
          course.assessment_categories.each do |category|
            setting = {
              'key' => 'new_comment', 'enabled' => false, 'options' => { 'category_id' => category.id }
            }
            settings_interface.update_email_setting(setting)
          end
          course.save!
        end

        it 'duplicates the settings' 

      end

      context 'when sidebar settings have multiple assessment categories' do
        let!(:categories) { create_list(:course_assessment_category, 2, course: course) }

        before do
          # Assign sidebar settings for original course by setting the weight to the old
          # category ID.
          course.assessment_categories.each do |category|
            course.settings(:sidebar).settings("assessments_#{category.id}").weight = category.id
          end
          course.save!
        end

        it 'updates the sidebar setting keys with the new assessment category IDs' 

      end
    end
  end
end

