describe TeamsController do
  # Airbrake-1807465099223895248
  describe '#delete' do
    before(:each) do
      user = build(:instructor)
      stub_current_user(user, user.role.name, user.role)
      # to deal with redirect_to :back
      request.env['HTTP_REFERER'] = 'www.google.com'
    end

    it 'will redirect to previous page if the team cannot be found by id' 


    it 'will delete the team if current team did not involve in any other reviews' 

  end
end

# E1776 (Fall 2017)
#
# The tests below are no longer reflective of the current import process.
#
# 1. The method importFile has been replaced with import_from_hash in import_file_controller.rb
#
# describe ImportFileController do
#   # Airbrake-1774360945974838307
#   describe '#importFile' do
#     it 'will catch the error info if the tempfile cannot be obtained from params[:file]' do
#       controller.params = {
#         id: 1,
#         options: {"has_column_names" => "true", "handle_dups" => "ignore"},
#         model: 'AssignmentTeam',
#         file: nil
#       }
#       session = {
#         assignment_id: 1
#       }
#       expect { controller.send(:importFile, session, controller.params) }.not_to raise_error
#       expect(controller.send(:importFile, session, controller.params).inspect).to eq("[#<NoMethodError: undefined method `each_line' for nil:NilClass>]")
#     end
#   end
# end

describe MenuItemsController do
  # Airbrake-1766139777878852159
  describe '#link' do
    it "can handle the situation (redirect_to '/') when the session[:menu] is nil" 


    it 'redirect to node.url when the session[:menu] is not nil' 

  end
end

describe GradesController do
  # Airbrake-1784274870078015831
  describe '#redirect_when_disallowed' do
    before(:each) do
      controller.instance_variable_set(:@participant, double('Participant',
                                                             team: build(:assignment_team),
                                                             assignment: double('Assignment', id: 1, max_team_size: 1)))
      # allow(@participant).to receive(:assignment).with(no_args).and_return(build(:assignment, id: 1, max_team_size: 2))
      # allow(@participant).to receive(:team).with(no_args).and_return(build(:assignment_team))
      controller.session[:user] = double('User', id: 1)
    end

    it 'will return true when reviewer is nil' 


    it 'will return false when reviewer is current_user' 

  end
end

describe ReviewMappingController do
  before(:each) do
    user = build(:instructor)
    stub_current_user(user, user.role.name, user.role)
    # to deal with redirect_to :back
    request.env['HTTP_REFERER'] = 'www.google.com'
  end
  # Airbrake-1800902813969550245
  describe '#delete_reviewer' do
    it 'will stay in current page if review_response_map_id is nil' 


    it 'will delete reviewer if current reviewer did not do any reviews' 

  end
end

