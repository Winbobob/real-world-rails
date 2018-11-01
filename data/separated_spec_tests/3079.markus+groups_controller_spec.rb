describe GroupsController do
  let(:grouping) { create(:grouping) }
  let(:assignment) { grouping.assignment }

  describe 'administrator access' do
    before :each do
      # Authenticate user is not timed out, and has administrator rights.
      allow(controller).to receive(:session_expired?).and_return(false)
      allow(controller).to receive(:logged_in?).and_return(true)
      allow(controller).to receive(:current_user).and_return(build(:admin))
    end

    describe '#note_message'

    describe 'GET #new' do
      before :each do
        allow(Assignment).to receive(:find).and_return(assignment)
      end

      context 'when no group name is specified' do
        it 'adds a new group to assignment' 

      end

      context 'when a group name is specified' do
        let(:group_name) { 'g2avatar' }

        context 'when group creation successful' do
          it 'creates a new group with specified name' 

        end

        context 'when group creation unsuccessful' do
          before :each do
            allow(assignment).to receive(:add_group)
                                   .with(group_name)
                                   .and_raise('Group #{group_name} already exists')

            get :new, params: { assignment_id: assignment, new_group_name: group_name }
          end

          it 'assigns the error message to flash[:error]' 

        end
      end
    end

    describe 'DELETE #remove_group' do
      before :each do
        allow(Grouping).to receive(:where).and_return([grouping])
      end

      context 'when grouping has no submissions' do
        before :each do
          allow(grouping).to receive(:delete_grouping)
          allow(grouping).to receive(:has_submission?).and_return(false)
        end

        it 'assigns empty array to @errors' 


        it 'populates @removed_groupings with deleted groupings' 


        it 'calls grouping.has_submission?' 


        it 'calls grouping.delete_groupings' 


        it 'should attempt to update permissions file' 

      end

      context 'when grouping has submissions' do
        before :each do
          allow(grouping).to receive(:has_submission?).and_return(true)

          delete :remove_group, params: { grouping_id: [grouping.id], assignment_id: assignment }
        end

        it 'populates @errors with group_name of grouping\'s group' 


        it 'assigns empty array to @removed_groupings' 


        it 'calls grouping.has_submission?' 


        it 'should attempt to update permissions file' 

      end
    end

    describe '#rename_group'
    describe '#valid_grouping'
    describe '#invalid_grouping'
    describe '#populate'
    describe '#populate_students'

    describe 'GET #index' do
      before :each do
        allow(Assignment).to receive(:find).and_return(assignment)
        get :index, params: { assignment_id: assignment }
      end

      it 'assigns the requested assignment to @assignment' 


      it 'renders the :index template' 

    end

    describe '#csv_upload' do
      before :all do
        # remove a generated repo so repeated test runs function properly
        FileUtils.rm_r(
          File.join(::Rails.root.to_s, 'data/test/repos/group_0001', '/'),
          force: true)
      end

      before :each do
        # We need to mock the rack file to return its content when
        # the '.read' method is called to simulate the behaviour of
        # the http uploaded file
        @file_good = fixture_file_upload(
          'files/groups/form_good.csv', 'text/csv')
        allow(@file_good).to receive(:read).and_return(
          File.read(fixture_file_upload(
                      'files/groups/form_good.csv',
                      'text/csv')))

        @file_invalid_column = fixture_file_upload(
          'files/groups/form_invalid_column.csv', 'text/csv')
        allow(@file_invalid_column).to receive(:read).and_return(
          File.read(fixture_file_upload(
                      'files/groups/form_invalid_column.csv',
                      'text/csv')))

        @file_bad_csv = fixture_file_upload(
          'files/bad_csv.csv', 'text/xls')
        allow(@file_bad_csv).to receive(:read).and_return(
          File.read(fixture_file_upload('files/bad_csv.csv', 'text/csv')))

        @file_wrong_format = fixture_file_upload(
          'files/wrong_csv_format.xls', 'text/xls')
        allow(@file_wrong_format).to receive(:read).and_return(
          File.read(fixture_file_upload(
                      'files/wrong_csv_format.xls', 'text/csv')))

        # Setup for Git Repository
        allow(MarkusConfigurator)
          .to receive(:markus_config_repository_type).and_return('git')

        @assignment = create(:assignment,
                             allow_web_submits: true,
                             group_max: 1,
                             group_min: 1)

        # Create students corresponding to the file_good
        @student_user_names = %w(c8shosta c5bennet)
        @student_user_names.each do |name|
          create(:user, user_name: name, type: 'Student')
        end
      end

      it 'calls add_csv_group' 


      it 'accepts a valid file' 


      it 'does not accept files with invalid columns' 


      it 'does not accept fileless submission' 


      it 'does not accept a non-csv file with .csv extension' 


      it 'does not accept a .xls file' 

    end

    describe '#download_grouplist' do
      let(:csv_options) do
        {
          type: 'text/csv',
          filename: "#{@assignment.short_identifier}_group_list.csv",
          disposition: 'attachment'
        }
      end

      before :each do
        @assignment = FactoryBot.create(:assignment,
                                         allow_web_submits: true,
                                         group_max: 1,
                                         group_min: 1)

        @group = FactoryBot.create(:group)

        @student1 = create(:student, user_name: 'c8shosta')
        @student2 = create(:student, user_name: 'c5bennet')

        grouping = Grouping.new(assignment: @assignment, group: @group)
        grouping.save

        grouping.add_member(@student1, StudentMembership::STATUSES[:inviter])
        grouping.add_member(@student2, StudentMembership::STATUSES[:accepted])

        @ta_name = 'c8shacd'
        @ta = create(:ta, user_name: @ta_name)
        # For each grouping for Assignment 1, assign 2 TAs
        @assignment.groupings.each do |grouping|
          grouping.add_tas([@ta])
        end
      end

      it 'responds with appropriate status' 


      # parse header object to check for the right disposition
      it 'sets disposition as attachment' 


      it 'expects a call to send_data' 


      # parse header object to check for the right content type
      it 'returns text/csv type' 


      # parse header object to check for the right file naming convention
      it 'filename passes naming conventions' 

    end

    describe '#use_another_assignment_groups'
    describe '#global_actions'
    describe '#invalidate_groupings'
    describe '#validate_groupings'
    describe '#delete_groupings'
    describe '#add_members'
    describe '#add_member'
    describe '#remove_members'
    describe '#remove_member'
  end

  describe 'student access' do
    before :each do
      # Authenticate user is not timed out, and has administrator rights.
      allow(controller).to receive(:session_expired?).and_return(false)
      allow(controller).to receive(:logged_in?).and_return(true)
      allow(controller).to receive(:current_user).and_return(build(:student))

      @student = create(:student, user_name: 'c9test1')
      @assignment = create(:assignment, student_form_groups: true)
    end

    describe 'POST #create' do
      before :each do
        post_as @student, :create, params: { assignment_id: assignment }
      end

      it 'should respond with redirect' 

    end

    describe 'DELETE #destroy' do
      before :each do
        delete_as @student, :destroy, params: { assignment_id: assignment, id: 1 }
      end

      it 'should respond with success' 

    end
  end
end

