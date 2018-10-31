describe OecTasksController do

  let(:oauth_tokens) {
    {
      access_token: random_string(10),
      refresh_token: random_string(10)
    }
  }
  before do
    session['user_id'] = random_id
    allow_any_instance_of(AuthenticationStatePolicy).to receive(:can_administer_oec?).and_return true
    allow(User::Oauth2Data).to receive(:get).with(anything, GoogleApps::Proxy::OEC_APP_ID).and_return oauth_tokens
  end

  shared_examples 'authorization and error handling' do
    it_should_behave_like 'a user authenticated api endpoint'

    context 'when user is not authorized' do
      before { allow_any_instance_of(AuthenticationStatePolicy).to receive(:can_administer_oec?).and_return false }
      it 'should respond with empty http 403' 

    end
  end

  describe '#index' do
    let(:make_request) { get :index }
    include_examples 'authorization and error handling'

    it 'returns tasks, terms and departments' 

  end

  describe '#run' do
    let(:task_id) { Oec::ApiTaskWrapper.generate_task_id }
    let(:task_name) { 'TermSetupTask' }
    let(:term_name) { 'Summer 2013' }
    let(:make_request) { post :run, task_name: task_name, term: term_name }
    include_examples 'authorization and error handling'

    it_should_behave_like 'an api endpoint' do
      before do
        allow_any_instance_of(Oec::ApiTaskWrapper).to receive(:start_in_background).and_raise(RuntimeError, 'Something went wrong')
      end
    end

    it 'should start task wrapper and return status' 


    context 'missing term name' do
      let(:term_name) { nil }
      it 'should return error before task is initialized' 

    end

    context 'unknown task name' do
      let(:task_name) { 'SheepShearTask' }
      it 'should return error before task is initialized' 

    end

    context 'unknown task name' do
      let(:oauth_tokens) { {} }
      it 'should return error when no OAuth tokens are found' 

    end
  end

  describe '#task_status' do
    let(:make_request) { get :task_status, task_id: task_id }
    let(:task_id) { Oec::ApiTaskWrapper.generate_task_id }

    it_should_behave_like 'an api endpoint' do
      before { allow(Oec::Task).to receive(:fetch_from_cache).and_raise RuntimeError, 'Something went wrong' }
    end

    context 'task not found for id' do
      before { expect(Oec::Task).to receive(:fetch_from_cache).with(task_id).and_return nil }

      it 'should return bad request error' 

    end

    context 'task found for id' do
      before do
        allow(Oec::RemoteDrive).to receive(:new).and_return double
        Oec::TermSetupTask.new(term_code: '2013-C', api_task_id: task_id, log_to_cache: true)
      end

      it 'should return task status and log' 

    end
  end
end


