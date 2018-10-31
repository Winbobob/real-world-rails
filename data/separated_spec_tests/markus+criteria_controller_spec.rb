RSpec.describe CriteriaController, type: :controller do

  describe 'Using Flexible Criteria' do

    describe 'An unauthenticated and unauthorized user doing a GET' do
      context '#index' do
        it 'should respond with redirect' 

      end

      context '#new' do
        it 'should respond with redirect' 

      end

      context '#edit' do
        it 'should respond with redirect' 

      end

      context '#update' do
        it 'should respond with redirect' 

      end

      context '#destroy' do
        it 'should respond with redirect' 

      end

      context '#update_positions' do
        it 'should respond with redirect' 

      end

      context 'with an assignment' do
        before :each do
          @grouping = FactoryBot.create(:grouping)
          @assignment = @grouping.assignment
        end

        context 'and a submission' do
          before :each do
            @submission = create(:submission, grouping: @grouping)
          end

          context '#edit' do
            it 'should respond with redirect' 

          end
        end
      end

      context '#download_yml' do
        it 'should respond with redirect' 

      end
    end

    describe 'An unauthenticated and unauthorized user doing a POST' do
      context '#index' do
        it 'should respond with redirect' 

      end

      context '#new' do
        it 'should respond with redirect' 

      end

      context '#update' do
        it 'should respond with redirect' 

      end

      context '#edit' do
        it 'should respond with redirect' 

      end

      context '#destroy' do
        it 'should respond with redirect' 

      end
    end

    describe 'An authenticated and authorized admin doing a GET' do
      before(:each) do
        @admin = create(:admin)
        @assignment = create(:assignment)
        @criterion = create(:flexible_criterion,
                            assignment: @assignment,
                            position: 1,
                            name: 'criterion1',
                            description: 'description1, for criterion 1')
        @criterion2 = create(:flexible_criterion,
                             assignment: @assignment,
                             position: 2,
                             name: 'criterion2',
                             description: 'description2, "with quotes"')
        @criterion3 = create(:flexible_criterion,
                             assignment: @assignment,
                             position: 3,
                             name: 'criterion3',
                             description: 'description3!',
                             max_mark: 1.6)
      end

      context '#index' do
        before(:each) do
          get_as @admin, :index, params: { assignment_id: @assignment.id }
        end
        it 'should respond assign assignment and criteria' 


        it 'should render the edit template' 


        it 'should respond with success' 

      end

      context '#new' do
        before(:each) do
          get_as @admin,
                 :new,
                 params: { assignment_id: @assignment.id, criterion_type: 'FlexibleCriterion'},
                 format: :js
        end

        it 'should respond with appropriate content' 


        it 'should render the new template' 


        it 'should respond with success' 

      end

      context '#edit' do
        before(:each) do
          get_as @admin,
                 :edit,
                 params: { assignment_id: 1, id: @criterion.id, criterion_type: @criterion.class.to_s },
                 format: :js
        end

        it 'should respond with appropriate content' 


        it 'should render edit template' 


        it 'should respond with success' 

      end

      context '#update' do
        context 'with errors' do
          before(:each) do
            expect_any_instance_of(FlexibleCriterion)
                .to receive(:save).and_return(false)
            expect_any_instance_of(FlexibleCriterion)
                .to receive(:errors).and_return(ActiveModel::Errors.new(@criterion))

            get_as @admin,
                   :update,
                   params: { assignment_id: 1, id: @criterion.id, flexible_criterion: { name: 'one', max_mark: 10 },
                             criterion_type: 'FlexibleCriterion' },
                   format: :js
          end

          it 'should respond with appropriate content' 


          it 'should respond with unprocessable entity' 

        end

        context 'without errors' do
          before(:each) do
            get_as @admin,
                   :update,
                   params: { assignment_id: 1, id: @criterion.id, flexible_criterion: { name: 'one', max_mark: 10 },
                             criterion_type: 'FlexibleCriterion' },
                   format: :js
          end

          it 'successfully assign criterion' 


          it 'should render the update template' 

        end
      end
    end

    describe 'An authenticated and authorized admin doing a POST' do
      before(:each) do
        @admin = create(:admin, user_name: 'olm_admin')
        @assignment = create(:assignment)
        @criterion = create(:flexible_criterion,
                            assignment: @assignment,
                            position: 1,
                            name: 'criterion1',
                            description: 'description1, for criterion 1')
        @criterion2 = create(:flexible_criterion,
                             assignment: @assignment,
                             position: 2,
                             name: 'criterion2',
                             description: 'description2, "with quotes"')
        @criterion3 = create(:flexible_criterion,
                             assignment: @assignment,
                             position: 3,
                             name: 'criterion3',
                             description: 'description3!',
                             max_mark: 1.6)
      end

      context '#index' do
        before(:each) do
          post_as @admin, :index, params: { assignment_id: @assignment.id }
        end
        it 'should respond with appropriate content' 


        it 'should render the index template' 


        it 'should respond with success' 

      end

      context '#create' do
        context 'with save error' do
          before(:each) do
            expect_any_instance_of(FlexibleCriterion)
                .to receive(:update).and_return(false)
            expect_any_instance_of(FlexibleCriterion)
                .to receive(:errors).and_return(ActiveModel::Errors.new(self))
            post_as @admin,
                    :create,
                    params: { assignment_id: @assignment.id, flexible_criterion: { name: 'first', max_mark: 10 },
                              new_criterion_prompt: 'first', criterion_type: 'FlexibleCriterion' },
                    format: :js
          end
          it 'should respond with appropriate content' 


          it 'should respond with unprocessable entity' 

        end

        context 'without error on an assignment as the first criterion' do
          before(:each) do
            post_as @admin,
                    :create,
                    params: { assignment_id: @assignment.id, flexible_criterion: { name: 'first' },
                              new_criterion_prompt: 'first', criterion_type: 'FlexibleCriterion', max_mark_prompt: 10 },
                    format: :js
          end
          it 'should respond with appropriate content' 

          it 'should render the create template' 


          it 'should respond with success' 

        end

        context 'without error on an assignment that already has criteria' do
          before(:each) do
            post_as @admin,
                    :create,
                    params: { assignment_id: @assignment.id, flexible_criterion: { name: 'first' },
                              new_criterion_prompt: 'first', criterion_type: 'FlexibleCriterion', max_mark_prompt: 10 },
                    format: :js
          end
          it 'should respond with appropriate content' 

          it 'should render the create template' 


          it 'should respond with success' 

        end
      end

      context '#edit' do
        before(:each) do
          post_as @admin,
                  :edit,
                  params: { assignment_id: 1, id: @criterion.id, criterion_type: @criterion.class.to_s },
                  format: :js
        end

        it ' should respond with appropriate content' 


        it 'should render the edit template' 


        it 'should respond with success' 

      end

      it 'should be able to update_positions' 

    end

    describe 'An authenticated and authorized admin doing a DELETE' do
      before(:each) do
        @admin = create(:admin)
        @assignment = create(:assignment)
        @criterion = create(:flexible_criterion,
                            assignment: @assignment)
      end

      it ' should be able to delete the criterion' 

    end
  end # Tests using Flexible Criteria only

  describe 'Using Rubric Criteria' do

    describe 'An unauthenticated and unauthorized user doing a GET' do
      context '#index' do
        it 'should respond with redirect' 

      end

      context '#new' do
        it 'should respond with redirect' 

      end

      context '#edit' do
        it 'should respond with redirect' 


        context 'with an assignment' do
          before :each do
            @grouping = FactoryBot.create(:grouping)
            @assignment = @grouping.assignment
          end

          context 'and a submission' do
            before :each do
              @submission = create(:submission, grouping: @grouping)
            end

            context '#edit' do
              it 'should respond with redirect' 

            end
          end
        end
      end

      context '#destroy' do
        it 'should respond with redirect' 

      end

      context '#update' do
        it 'should respond with redirect' 

      end

      context '#update_positions' do
        it 'should respond with redirect' 

      end

      context '#download_yml' do
        it 'should respond with redirect' 

      end
    end

    describe 'An unauthenticated and unauthorized user doing a POST' do
      context '#index' do
        it 'should respond with redirect' 

      end

      context '#new' do
        it 'should respond with redirect' 

      end

      context '#edit' do
        it 'should respond with redirect' 

      end

      context '#update' do
        it 'should respond with redirect' 

      end

      context '#destroy' do
        it 'should respond with redirect' 

      end
    end

    describe 'An authenticated and authorized admin doing a GET' do
      before(:each) do
        @admin = create(:admin)
        @assignment = create(:assignment)
        @criterion = create(:rubric_criterion,
                            assignment: @assignment,
                            position: 1,
                            name: 'criterion1')
        @criterion2 = create(:rubric_criterion,
                             assignment: @assignment,
                             position: 2,
                             name: 'criterion2')
        @criterion3 = create(:rubric_criterion,
                             assignment: @assignment,
                             position: 3,
                             name: 'criterion3',
                             max_mark: 1.6)
      end

      context '#index' do
        before(:each) do
          get_as @admin, :index, params: { assignment_id: @assignment.id }
        end
        it 'should respond assign assignment and criteria' 


        it 'should render the edit template' 


        it 'should respond with success' 

      end

      context '#new' do
        before(:each) do
          get_as @admin,
                 :new,
                 params: { assignment_id:  @assignment.id, criterion_type: 'RubricCriterion' },
                 format: :js
        end

        it 'should respond with appropriate content' 


        it 'should render the new template' 


        it 'should respond with success' 

      end

      context '#edit' do
        before(:each) do
          get_as @admin,
                 :edit,
                 params: { assignment_id: 1, id: @criterion.id, criterion_type: @criterion.class.to_s },
                 format: :js
        end

        it 'should respond with appropriate content' 


        it 'should render edit template' 


        it 'should respond with success' 

      end

      context '#update' do
        context 'with errors' do
          before(:each) do
            expect_any_instance_of(RubricCriterion)
                .to receive(:save).and_return(false)
            expect_any_instance_of(RubricCriterion)
                .to receive(:errors).and_return(ActiveModel::Errors.new(@criterion))

            get_as @admin,
                   :update,
                   params: { assignment_id: 1, id: @criterion.id, rubric_criterion: { name: 'one', max_mark: 10 },
                             criterion_type: 'RubricCriterion' },
                   format: :js
          end

          it 'should respond with appropriate content' 


          it 'should respond with unprocessable entity' 

        end

        context 'without errors' do
          before(:each) do
            get_as @admin,
                   :update,
                   params: { assignment_id: 1, id: @criterion.id, rubric_criterion: { name: 'one', max_mark: 10 },
                             criterion_type: 'RubricCriterion' },
                   format: :js
          end

          it 'successfully assign criterion' 


          it 'should render the update template' 

        end
      end
    end

    describe 'An authenticated and authorized admin doing a POST' do
      before(:each) do
        @admin = create(:admin, user_name: 'olm_admin')
        @assignment = create(:assignment)
        @criterion = create(:rubric_criterion,
                            assignment: @assignment,
                            position: 1,
                            name: 'criterion1')
        @criterion2 = create(:rubric_criterion,
                             assignment: @assignment,
                             position: 2,
                             name: 'criterion2')
        @criterion3 = create(:rubric_criterion,
                             assignment: @assignment,
                             position: 3,
                             name: 'criterion3',
                             max_mark: 1.6)
      end

      context '#index' do
        before(:each) do
          post_as @admin, :index, params: { assignment_id: @assignment.id }
        end
        it 'should respond with appropriate content' 


        it 'should render the index template' 


        it 'should respond with success' 

      end

      context '#create' do
        context 'with save error' do
          before(:each) do
            expect_any_instance_of(RubricCriterion)
                .to receive(:update).and_return(false)
            expect_any_instance_of(RubricCriterion)
                .to receive(:errors).and_return(ActiveModel::Errors.new(self))
            post_as @admin,
                    :create,
                    params: { assignment_id: @assignment.id, rubric_criterion: { name: 'first', max_mark: 10 },
                              new_criterion_prompt: 'first', criterion_type: 'RubricCriterion' },
                    format:  :js
          end
          it 'should respond with appropriate content' 


          it 'should respond with unprocessable entity' 

        end

        context 'without error on an assignment as the first criterion' do
          before(:each) do
            post_as @admin,
                    :create,
                    params: { assignment_id: @assignment.id, rubric_criterion: { name: 'first' },
                              new_criterion_prompt: 'first', criterion_type: 'RubricCriterion', max_mark_prompt: 10 },
                    format: :js
          end
          it 'should respond with appropriate content' 

          it 'should render the create template' 


          it 'should respond with success' 

        end

        context 'without error on an assignment that already has criteria' do
          before(:each) do
            post_as @admin,
                    :create,
                    params: { assignment_id: @assignment.id, rubric_criterion: { name: 'first' },
                              new_criterion_prompt: 'first', criterion_type: 'RubricCriterion', max_mark_prompt: 10 },
                    format: :js
          end
          it 'should respond with appropriate content' 

          it 'should render the create template' 


          it 'should respond with success' 

        end
      end

      context '#edit' do
        before(:each) do
          post_as @admin,
                  :edit,
                  params: { assignment_id: 1, id: @criterion.id, criterion_type: @criterion.class.to_s },
                  format: :js
        end

        it ' should respond with appropriate content' 


        it 'should render the edit template' 


        it 'should respond with success' 

      end

      it 'should be able to update_positions' 

    end

    describe 'An authenticated and authorized admin doing a DELETE' do
      before(:each) do
        @admin = create(:admin)
        @assignment = create(:assignment)
        @criterion = create(:rubric_criterion,
                            assignment: @assignment)
      end

      it ' should be able to delete the criterion' 

    end
  end # Tests using Rubric Criteria only

  describe 'An authenticated and authorized admin performing yml actions' do
    context 'When a file containing a mixture of entries is uploaded' do
      before :each do
        @admin              = create(:admin)
        @assignment         = create(:assignment)
        @rubric_criterion   = create(:rubric_criterion,
                                     assignment: @assignment,
                                     position: 1,
                                     name: 'Rubric criterion')
        @flexible_criterion = create(:flexible_criterion,
                                     assignment: @assignment,
                                     position: 2,
                                     name: 'Flexible criterion')
        @checkbox_criterion = create(:checkbox_criterion,
                                     assignment: @assignment,
                                     position: 3,
                                     name: 'Checkbox criterion')

        @invalid_file = fixture_file_upload(
            'files/bad_csv.csv', 'text/xls')
        allow(@invalid_file).to receive(:read).and_return(
            File.read(fixture_file_upload(
                          'files/bad_csv.csv', 'text/csv')))

        @empty_file = fixture_file_upload(
          'files/empty_file', 'text/yaml')
        allow(@empty_file).to receive(:read).and_return(
          File.read(fixture_file_upload(
            'files/empty_file', 'text/yaml')))

        @uploaded_file = fixture_file_upload(
          'files/criteria/upload_yml_mixed.yaml', 'text/yaml')
        allow(@uploaded_file).to receive(:read).and_return(
          File.read(fixture_file_upload(
          'files/criteria/upload_yml_mixed.yaml', 'text/yaml')))

        @download_expected_output = fixture_file_upload(
          'files/criteria/download_yml_output.yaml', 'text/yaml')
        allow(@download_expected_output).to receive(:read).and_return(
          File.read(fixture_file_upload(
          'files/criteria/download_yml_output.yaml', 'text/yaml')))
      end

      it 'raises an error if the file does not have properly formatted entries' 


      it 'raises an error if the file does not include any criteria' 


      it 'deletes all criteria previously created' 


      it 'maintains the order between entries and positions for criteria' 


      it 'creates all criteria with properly formatted entries' 


      it 'creates rubric criteria with properly formatted entries' 


      it 'creates flexible criteria with properly formatted entries' 


      it 'creates checkbox criteria with properly formatted entries' 


      it 'creates criteria; being case insensitive with the type given' 


      it 'creates criteria that lack a description' 


      it 'creates criteria with the default visibility options if these are not given in the entries' 


      it 'does not create criteria with format errors in entries' 


      it 'does not create criteria with an invalid mark' 


      it 'does not create criteria that have both visibility options set to false' 


      context 'When some criteria have been previously uploaded and and admin performs a download' do
        it 'responds with appropriate status' 


        it 'sends the correct information' 

      end
    end
  end
end


