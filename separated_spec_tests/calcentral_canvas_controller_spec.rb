describe CanvasController do

  let(:canvas_user_id) { '3323890' }
  let(:uid) { '1234' }

  context 'when serving index of external applications within Canvas' do
    before do
      public_external_tools = {
        :global_tools => ['Global App 1' => 66, 'Global App 2' => 67],
        :official_course_tools => ['Official App 1' => 92, 'Official App 2' => 93]
      }
      allow(Canvas::ExternalTools).to receive(:public_list_as_json).and_return(public_external_tools)
    end

    it_should_behave_like 'an api endpoint' do
      before { allow(Canvas::ExternalTools).to receive(:public_list_as_json).and_raise(RuntimeError, 'Something went wrong') }
      let(:make_request) { get :external_tools }
    end

    it_should_behave_like 'a cross-domain endpoint' do
      let(:make_request) { get :external_tools }
    end

    it 'returns public list of external tools' 

  end

  context 'when identifying if a user can provision course or project sites' do
    it_should_behave_like 'an api endpoint' do
      before { allow_any_instance_of(CanvasLti::PublicAuthorizer).to receive(:can_create_site?).and_raise(RuntimeError, 'Something went wrong') }
      let(:make_request) { get :user_can_create_site, :canvas_user_id => canvas_user_id }
    end

    context 'when user is not authorized to create course site' do
      before { allow_any_instance_of(CanvasLti::PublicAuthorizer).to receive(:can_create_site?).and_return(false) }

      it_should_behave_like 'a cross-domain endpoint' do
        let(:make_request) { get :user_can_create_site, :canvas_user_id => canvas_user_id }
      end

      it 'returns false' 

    end

    context 'when user is authorized to create course site' do
      before { allow_any_instance_of(CanvasLti::PublicAuthorizer).to receive(:can_create_site?).and_return(true) }

      it_should_behave_like 'a cross-domain endpoint' do
        let(:make_request) { get :user_can_create_site, :canvas_user_id => canvas_user_id }
      end

      it 'returns true' 

    end

    context 'running from ETS Junction rather than within LTI app' do
      let(:uid) {random_id}
      before do
        worker = instance_double(CanvasLti::PublicAuthorizer)
        expect(worker).to receive(:can_create_site?).and_return(true)
        expect(CanvasLti::PublicAuthorizer).to receive(:new).with("sis_login_id:#{uid}").and_return(worker)
        session['user_id'] = uid
      end
      it 'lets directly authenticated users run a legitimate check' 

    end

  end
end

