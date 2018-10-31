require 'spec_helper'

describe GradersController do
  context 'An authenticated and authorized student doing a ' do

    before(:each) do
      @student = create(:student)
    end

    it 'GET on :groups_coverage_dialog' 


    it 'GET on :grader_criteria_dialog' 


    it 'GET on :set_assign_criteria' 


    it 'GET on :index' 


    it 'GET on :csv_upload_grader_groups_mapping' 


    it 'GET on :add_grader_to_grouping' 


    it 'GET on :global_actions' 


    it 'POST on :groups_coverage_dialog' 


    it 'POST on :grader_criteria_dialog' 


    it 'POST on :set_assign_criteria' 


    it 'POST on :csv_upload_grader_groups_mapping' 


    it 'POST on :add_grader_to_grouping' 


    it 'POST on :global_actions' 

  end # student context

  context 'An authenticated and authorized admin' do

    before :each do
      @admin = create(:admin)
      @assignment = create(:assignment)
    end

    it 'doing a GET on :index(graders_controller)' 


    context 'doing a POST on :set_assign_criteria' do

      it 'and value is true' 


      it 'and value is nil' 

    end

    context 'doing a POST on :csv_upload_grader_groups_mapping' do

      before :each do
        # Contents: test_group,g9browni,g9younas
        #           second_test_group,g9browni
        #           Group 3,c7benjam
        @group_grader_map_file = fixture_file_upload(
          File.join('group_csvs',
                    'group_grader_map.csv')
        )
      end

      it 'and all graders and groups are valid' 


      it 'and some graders are invalid' 


      it 'and some groupings are invalid' 


      it 'gracefully handle malformed csv files' 


      it 'gracefully handle a non csv file with a csv extension' 

    end #groups csv upload

    context 'doing a POST on :csv_upload_grader_criteria_mapping' do

      before :each do
        # Contents: correctness,g9browni,g9younas
        #           style,g9browni
        #           class design,c7benjam
        @criteria_grader_map_file = fixture_file_upload(
          File.join('group_csvs',
                    'criteria_grader_map.csv'))
      end

      context 'with rubric criteria' do
        before :each do
          @assignment = create(:assignment, assign_graders_to_criteria: true)
        end

        it 'and all graders and criteria are valid' 


        it 'and some graders are invalid' 


        it 'and some criteria are invalid' 

      end # rubric criteria

      context 'with flexible criteria' do
        before :each do
          @assignemnt = create(:assignment, assign_graders_to_criteria: true)
        end

        it 'and all graders and criteria are valid' 


        it 'and some graders are invalid' 


        it 'and some criteria are invalid' 

      end # flexible criteria

      it 'gracefully handle malformed csv files' 


      it 'gracefully handle a non csv file with a csv extension' 

    end # criteria csv upload

    context 'doing a GET on :download_grader_groupings_mapping' do
      before :each do
        @assignment = create(:assignment, assign_graders_to_criteria: true)
      end

      it 'routing properly' 

    end

    context 'doing a GET on :download_grader_criteria_mapping' do
      before :each do
        @assignment = create(:assignment, assign_graders_to_criteria: true)
      end

      it 'routing properly' 

    end

    it 'doing a POST on :add_grader_to_grouping' 


    context 'with groups table selected doing a' do

      context 'POST on :global_actions on random_assign' do
        before :each do
          @grouping1 = create(:grouping, assignment: @assignment)
          @grouping2 = create(:grouping, assignment: @assignment)
          @grouping3 = create(:grouping, assignment: @assignment)
          @ta1 = create(:ta)
          @ta2 = create(:ta)
          @ta3 = create(:ta)
        end

        it 'and no graders selected' 


        it 'and no groups selected, at least one grader' 


        it 'and no graders are selected, at least one grouping' 


        it 'and one grader and one grouping is selected' 


        it 'and one grader and multiple groupings are selected' 


        it 'and two graders and one grouping is selected' 


        it 'and two graders and two groupings are selected' 


        it 'and multiple graders and multiple groupings are selected' 

      end #random assign

      context 'POST on :global_actions on assign' do
        before :each do
          @grouping1 = create(:grouping, assignment: @assignment)
          @grouping2 = create(:grouping, assignment: @assignment)
          @grouping3 = create(:grouping, assignment: @assignment)
          @ta1 = create(:ta)
          @ta2 = create(:ta)
          @ta3 = create(:ta)
        end

        it 'and no graders selected' 


        it 'and no groupings selected, at least one grader' 


        it 'and no graders are selected, at least one grouping' 


        it 'and one grader and one grouping is selected' 


        it 'and one grader and two groupings are selected' 


        it 'and two graders and one grouping is selected' 


        it 'and two graders and two groupings are selected' 


        it 'and multiple graders and multiple groupings are selected' 


        it 'and some graders are already assigned to some groups' 

      end #assign

      context 'POST on :global_actions on unassign' do
        before :each do
          @grouping1 = create(:grouping, assignment: @assignment)
          @grouping2 = create(:grouping, assignment: @assignment)
          @grouping3 = create(:grouping, assignment: @assignment)
          @ta1 = create(:ta)
          @ta2 = create(:ta)
          @ta3 = create(:ta)
        end

        it 'and no graders or groupings are selected' 


        it 'and all graders from one grouping are selected' 


        it 'and all groupings from one grader are selected' 


        it 'and one grader and one grouping is selected where the grader and grouping have other memberships' 


        it 'and multiple graders and multiple groupings are selected' 

      end #unassign

    end #groupings table

    context 'With criteria table selected' do
      context 'with rubric marking scheme doing a' do
        context 'POST on :global_actions on random_assign' do
          before :each do
            @criterion1 = create(:rubric_criterion, assignment: @assignment)
            @criterion2 = create(:rubric_criterion, assignment: @assignment)
            @criterion3 = create(:rubric_criterion, assignment: @assignment)
            @ta1 = create(:ta)
            @ta2 = create(:ta)
            @ta3 = create(:ta)
          end

          it 'and no graders selected' 


          it 'and no criteria selected, at least one grader' 


          it 'and no graders are selected, at least one criterion' 


          it 'and one grader and one criterion is selected' 


          it 'and one grader and multiple criteria are selected' 


          it 'and two graders and one criterion is selected' 


          it 'and two graders and two criteria are selected' 


          it 'and multiple graders and multiple criteria are selected' 

        end #random assign

        context 'POST on :global_actions on assign' do
          before :each do
            @criterion1 = create(:rubric_criterion, assignment: @assignment)
            @criterion2 = create(:rubric_criterion, assignment: @assignment)
            @criterion3 = create(:rubric_criterion, assignment: @assignment)
            @ta1 = create(:ta)
            @ta2 = create(:ta)
            @ta3 = create(:ta)
          end

          it 'and no graders selected' 


          it 'and no criteria selected, at least one grader' 


          it 'and no graders are selected, at least one criterion' 


          it 'and one grader and one criterion is selected' 


          it 'and one grader and two criteria are selected' 


          it 'and two graders and one criterion is selected' 


          it 'and two graders and two criteria are selected' 


          it 'and multiple graders and multiple criteria are selected' 


          it 'and some graders are already assigned to some criteria' 

        end #assign

        context 'POST on :global_actions on unassign' do
          before :each do
            @criterion1 = create(:rubric_criterion, assignment: @assignment)
            @criterion2 = create(:rubric_criterion, assignment: @assignment)
            @criterion3 = create(:rubric_criterion, assignment: @assignment)
            @ta1 = create(:ta)
            @ta2 = create(:ta)
            @ta3 = create(:ta)
          end

          it 'and no graders or criteria are selected' 


          it 'and all graders from one criterion are selected' 


          it 'and all criteria from one grader are selected' 


          it 'and one grader and one criterion is selected where the grader and criterion have other memberships' 


          it 'and multiple graders and multiple criteria are selected' 

        end #unassign

      end #rubric scheme

      context 'with flexible marking scheme doing a' do
        before :each do
          @assignment = create(:assignment)
        end

        context 'POST on :global_actions on random_assign' do
          before :each do
            @criterion1 = create(:flexible_criterion, assignment: @assignment)
            @criterion2 = create(:flexible_criterion, assignment: @assignment)
            @criterion3 = create(:flexible_criterion, assignment: @assignment)
            @ta1 = create(:ta)
            @ta2 = create(:ta)
            @ta3 = create(:ta)
          end

          it 'and no graders selected' 


          it 'and no criteria selected, at least one grader' 


          it 'and no graders are selected, at least one criterion' 


          it 'and one grader and one criterion is selected' 


          it 'and one grader and multiple criteria are selected' 


          it 'and two graders and one criterion is selected' 


          it 'and two graders and two criteria are selected' 


          it 'and multiple graders and multiple criteria are selected' 

        end #random assign

        context 'POST on :global_actions on assign' do
          before :each do
            @criterion1 = create(:flexible_criterion, assignment: @assignment)
            @criterion2 = create(:flexible_criterion, assignment: @assignment)
            @criterion3 = create(:flexible_criterion, assignment: @assignment)
            @ta1 = create(:ta)
            @ta2 = create(:ta)
            @ta3 = create(:ta)
          end

          it 'and no graders selected' 


          it 'and no criteria selected, at least one grader' 


          it 'and no graders are selected, at least one criterion' 


          it 'and one grader and one criterion is selected' 


          it 'and one grader and two criteria are selected' 


          it 'and two graders and one criterion is selected' 


          it 'and two graders and two criteria are selected' 


          it 'and multiple graders and multiple criteria are selected' 


          it 'and some graders are already assigned to some criteria' 

        end #assign

        context 'POST on :global_actions on unassign' do
          before :each do
            @criterion1 = create(:flexible_criterion, assignment: @assignment)
            @criterion2 = create(:flexible_criterion, assignment: @assignment)
            @criterion3 = create(:flexible_criterion, assignment: @assignment)
            @ta1 = create(:ta)
            @ta2 = create(:ta)
            @ta3 = create(:ta)
          end

          it 'and no graders or criteria are selected' 


          it 'and all graders from one criterion are selected' 


          it 'and all criteria from one grader are selected' 


          it 'and one grader and one criterion is selected where the grader and criterion have other memberships' 


          it 'and multiple graders and multiple criteria are selected' 

        end #unassign

      end #flexible scheme
    end #criteria table

  end #admin context
end

