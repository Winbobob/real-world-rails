describe MyCommitteesController do

  let(:uid) {'12345'}
  let(:student_id) {'12345' }
  let(:member_id) {'12345' }

  let(:photo_file) { {:data => '\xFF\xD8\xFF\xE0\x00\x10JFIF\x00\x01\x01'} }

  before do
    session['user_id'] = uid
  end

  it 'should be an empty committees feed on non-authenticated user' 


  it 'should return a valid committees feed for an authenticated user' 


  context 'when serving committee student photo' do
    it_should_behave_like 'an api endpoint' do
      before { allow_any_instance_of(MyCommittees::Merged).to receive(:get_feed_as_json).and_raise(RuntimeError, 'Something went wrong') }
      let(:make_request) { get :student_photo, student_id: student_id }
    end

    it_should_behave_like 'a user authenticated api endpoint' do
      let(:make_request) { get :student_photo, student_id: student_id }
    end

    context 'user is not authorized to view photo' do
      it 'should return 403 response' 

    end

    context 'if photo path returned ' do
      before { allow_any_instance_of(MyCommittees::Merged).to receive(:photo_data_or_file).and_return(photo_file) }
      it 'should return photo' 

    end
  end

  context 'when serving committee member photo' do
    it_should_behave_like 'an api endpoint' do
      before { allow_any_instance_of(MyCommittees::Merged).to receive(:get_feed_as_json).and_raise(RuntimeError, 'Something went wrong') }
      let(:make_request) { get :member_photo, member_id: member_id }
    end

    it_should_behave_like 'a user authenticated api endpoint' do
      let(:make_request) { get :member_photo, member_id: member_id }
    end

    context 'user is not authorized to view photo' do
      it 'should return 403 response' 

    end

    context 'if photo path returned ' do
      before { allow_any_instance_of(MyCommittees::Merged).to receive(:photo_data_or_file).and_return(photo_file) }
      it 'should return photo' 

    end
  end
end

