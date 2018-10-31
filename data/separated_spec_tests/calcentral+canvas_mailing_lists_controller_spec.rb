describe CanvasMailingListsController do
  let(:course_id) { rand(999999).to_s }
  let(:uid) { rand(999999).to_s }

  before do
    session['user_id'] = uid
    allow_any_instance_of(AuthenticationStatePolicy).to receive(:can_administrate_canvas?).and_return(true)
  end

  shared_examples 'authorization and error handling' do
    it_should_behave_like 'an api endpoint' do
      before do
        allow(MailingLists::SiteMailingList).to receive(:find_by).and_raise(RuntimeError, 'Something went wrong')
        allow_any_instance_of(MailingLists::SiteMailingList).to receive(:initialize).and_raise(RuntimeError, 'Something went wrong')
      end
    end

    it_should_behave_like 'a user authenticated api endpoint'

    context 'when user is not authorized' do
      before { allow_any_instance_of(AuthenticationStatePolicy).to receive(:can_administrate_canvas?).and_return(false) }
      it 'should respond with empty http 403' 

    end
  end

  def fake_mailing_list(filename)
    JSON.parse(File.read Rails.root.join('public', 'dummy', 'json', filename))
  end

  describe '#show' do
    let(:make_request) { get :show, canvas_course_id: course_id }
    include_examples 'authorization and error handling'

    it 'returns a fake unregistered mailing list' 

  end

  describe '#create' do
    let(:make_request) { post :create, canvas_course_id: course_id, listName: 'digression_analysis-sp15' }
    include_examples 'authorization and error handling'

    it 'returns a Mailgun list' 

  end

  describe '#populate' do
    let(:make_request) { post :populate, canvas_course_id: course_id  }
    include_examples 'authorization and error handling'

    it 'returns a fake mailing list with time last populated' 

  end

  describe '#delete' do
    let(:make_request) { delete :destroy, canvas_course_id: course_id  }
    include_examples 'authorization and error handling'

    it 'returns a success response' 

  end

end

