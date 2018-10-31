# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Duplication::ObjectDuplicationService, type: :service do
  let(:instance) { create(:instance) }
  with_tenant(:instance) do
    let(:source_course) { create(:course) }
    let(:destination_course) { create(:course) }
    let(:source_objects) { [] }
    let(:excluded_objects) { [] }

    describe '#duplicate_objects' do
      let(:duplicate_objects) do
        Course::Duplication::ObjectDuplicationService.
          duplicate_objects(source_course, destination_course, source_objects, {})
      end

      context 'when an item fails to duplicate' do
        let(:milestone) { create(:course_lesson_plan_milestone, course: source_course) }
        let(:invalid_skill) do
          create(:course_assessment_skill, course: source_course).tap do |skill|
            skill.title = nil
          end
        end
        let(:source_objects) { [invalid_skill, milestone] }

        it 'rolls back the whole transaction' 

      end

      context 'when an achievement is selected' do
        let(:achievement) { create(:course_achievement, :with_badge, course: source_course) }
        let(:source_objects) { [achievement] }

        it 'duplicates it' 

      end

      context 'when an assessments are present' do
        let!(:assessments) { create_list(:assessment, 2, course: source_course) }
        let(:assessment) { assessments.first }
        let(:tab) { assessment.tab }
        let(:category) { tab.category }

        context 'when only a category is selected' do
          let(:source_objects) { category }

          it 'creates a default tab for it' 

        end

        context 'when only a tab is selected' do
          let(:source_objects) { tab }
          before { category.update!(title: 'Non-default title') }

          it "adds it to the destination course's default category without assessments" 

        end

        context 'when an assessment is selected, but not its tab' do
          let(:source_objects) { [category, assessment] }
          before { tab.update!(title: 'Non-default title') }

          it "adds it to the destination course's default tab" 

        end

        context 'when a category is duplicated after its tab' do
          let(:source_objects) { [assessment, tab, category] }

          it 'associates the duplicates' 

        end

        context 'when a tab is duplicated after its category' do
          let(:source_objects) { [assessment, category, tab] }

          it 'associates the duplicates' 

        end

        context 'when an assessment is duplicated after its tab' do
          let(:source_objects) { [tab, assessment] }

          it 'associates the duplicates' 

        end

        context 'when a tab is duplicated after its assessment' do
          let(:source_objects) { [assessment, tab] }

          it 'associates the duplicates' 

        end
      end

      context 'when assessment skills and branches are present' do
        let(:branch) do
          create(:course_assessment_skill_branch, :with_skill, course: source_course, skill_count: 2)
        end
        let(:skill) { branch.skills.first }

        context 'when an assessment skill is selected but not its branch' do
          let(:source_objects) { skill }

          it 'duplicates the skill but not the branch' 

        end

        context 'when an assessment skill branch is selected but not the skills under it' do
          let(:source_objects) { branch }

          it 'duplicates the branch but not its skills' 

        end

        context 'when a skill is duplicated after its branch' do
          let(:source_objects) { [branch, skill] }

          it 'forms the association with the duplicate branch' 

        end

        context 'when a branch is duplicated after a skill under it' do
          let(:source_objects) { [skill, branch] }

          it 'forms associations with all its skills that are duplicated' 

        end

        context 'when a skill has an associated question_assessment' do
          let(:assessment) { create(:assessment, :with_mcq_question, course: source_course) }
          before do
            skill.question_assessments << assessment.questions.first.question_assessments.first
            skill.save!
          end

          context 'when a skill is duplicated after its associated question assessment' do
            let(:source_objects) { [assessment, skill] }

            it 'associates the duplicates' 

          end

          context 'when a question is duplicated after its associated skill' do
            let(:source_objects) { [skill, assessment] }

            it 'associates the duplicates' 

          end
        end
      end

      context 'when conditions are present' do
        let(:required_achievement) { create(:course_achievement, course: source_course) }
        let(:required_assessment) { create(:assessment, course: source_course) }
        let(:unlockable_achievement) do
          create(:course_achievement, course: source_course).tap do |unlockable|
            create(:assessment_condition,
                   assessment: required_assessment, conditional: unlockable, course: source_course)
            create(:achievement_condition,
                   achievement: required_achievement, conditional: unlockable, course: source_course)
          end
        end
        let(:unlockable_assessment) do
          create(:assessment, course: source_course).tap do |unlockable|
            create(:assessment_condition,
                   assessment: required_assessment, conditional: unlockable, course: source_course)
            create(:achievement_condition,
                   achievement: required_achievement, conditional: unlockable, course: source_course)
          end
        end
        let!(:unlockable_achievement_level_condition) do
          create(:course_condition_level, minimum_level: 2, conditional: unlockable_achievement, course: source_course)
        end
        let!(:unlockable_assessment_level_condition) do
          create(:course_condition_level, minimum_level: 2, conditional: unlockable_assessment, course: source_course)
        end

        context 'when conditionals are duplicated but not their required items' do
          let(:source_objects) { [unlockable_achievement, unlockable_assessment] }

          it 'does not duplicate any conditions' 

        end

        context 'when required items are duplicated but not their conditionals' do
          let(:source_objects) { [required_achievement, required_assessment] }

          it 'does not duplicate any conditions' 

        end

        context 'when conditionals are duplicated after their required items' do
          let(:source_objects) do
            [required_achievement, required_assessment, unlockable_achievement, unlockable_assessment]
          end

          it 'duplicates all conditions except level conditions' 

        end

        context 'when conditionals are duplicated before their required items' do
          let(:source_objects) do
            [unlockable_achievement, unlockable_assessment, required_achievement, required_assessment]
          end

          it 'duplicates all conditions except level conditions' 

        end
      end

      context 'when a forum is selected' do
        let(:forum) { create(:forum, course: source_course) }
        let(:source_objects) { [forum] }

        it 'duplicates it' 

      end

      context 'when a lesson plan event is selected' do
        let(:event) { create(:course_lesson_plan_event, course: source_course) }
        let(:source_objects) { [event] }

        it 'duplicates it' 

      end

      context 'when a lesson plan milestone is selected' do
        let(:milestone) { create(:course_lesson_plan_milestone, course: source_course) }
        let(:source_objects) { [milestone] }

        it 'duplicates it' 

      end

      context 'when levels are selected' do
        let(:levels) { create_list(:course_level, 3, course: source_course) }
        let(:source_objects) { levels }

        it 'duplicates them' 

      end

      context 'when materials and folders are present' do
        let(:grandparent_folder) { create(:course_material_folder, course: source_course) }
        let(:parent_folder) do
          create(:course_material_folder, course: source_course, parent: grandparent_folder)
        end
        let(:folder) do
          create(:course_material_folder, course: source_course, parent: parent_folder)
        end
        let!(:material) { create(:course_material, folder: folder) }

        context 'when a folder is duplicated' do
          context 'when its containing folder is also duplicated' do
            context 'when folder is duplicated before its parent' do
              let(:source_objects) { [folder, parent_folder, grandparent_folder] }

              it 'associates them' 

            end

            context 'when folder is duplicated after its parent' do
              let(:source_objects) { [grandparent_folder, parent_folder, folder] }

              it 'associates them' 

            end
          end

          context 'when its containing folder is not duplicated' do
            let(:source_objects) { [grandparent_folder, folder] }

            it 'duplicates it to destination course root folder' 

          end

          context 'when it does not have a containing folder' do
            let(:source_objects) { source_course.root_folder }

            it 'duplicates it to destination course root folder' 

          end
        end

        context 'when a material is duplicated' do
          context 'when its containing folder is also duplicated' do
            context 'when material is duplicated before its folder' do
              let(:source_objects) { [material, folder] }

              it 'associates them' 

            end

            context 'when material is duplicated after its folder' do
              let(:source_objects) { [folder, material] }

              it 'associates them' 

            end
          end

          context 'when its containing folder is not duplicated' do
            let(:source_objects) { material }

            it 'duplicates it to destination course root folder' 

          end
        end

        context 'when there are items with conflicting filenames' do
          let(:source_objects) { [material, parent_folder] }
          let(:conflicting_folder) do
            create(:course_material_folder, course: destination_course,
                                            parent: destination_course.root_folder, name: parent_folder.name)
          end
          let(:conflicting_material) do
            create(:course_material, folder: destination_course.root_folder, name: material.name)
          end

          before do
            conflicting_folder
            conflicting_material
          end

          it 'gives the duplicated items unique names' 

        end
      end

      context 'when a survey is selected' do
        let(:survey) { create(:survey, course: source_course) }
        let(:source_objects) { [survey] }

        it 'duplicates it' 

      end

      context 'when a video tab is selected' do
        let(:video_tab) { create(:video_tab, course: source_course, title: 'TEST') }
        let(:source_objects) { [video_tab] }

        it 'duplicates it' 


        context 'when a video under the tab is also selected' do
          let(:video) { create(:video, course: source_course, tab: video_tab) }
          let(:source_objects) { [video_tab, video] }

          it 'duplicates the video to the right tab' 


          context 'when a tab is duplicated after its video' do
            let(:source_objects) { [video, video_tab] }

            it 'associates the duplicates' 

          end
        end
      end

      context 'when a video is selected' do
        let(:video) { create(:video, course: source_course) }
        let(:source_objects) { [video] }

        it 'duplicates it' 

      end
    end
  end
end

