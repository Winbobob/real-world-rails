require 'spec_helper'

describe Projects::EnvironmentsController do
  set(:user) { create(:user) }
  set(:project) { create(:project) }

  set(:environment) do
    create(:environment, name: 'production', project: project)
  end

  before do
    project.add_master(user)

    sign_in(user)
  end

  describe 'GET index' do
    context 'when a request for the HTML is made' do
      it 'responds with status code 200' 

    end

    context 'when requesting JSON response for folders' do
      before do
        create(:environment, project: project,
                             name: 'staging/review-1',
                             state: :available)

        create(:environment, project: project,
                             name: 'staging/review-2',
                             state: :available)

        create(:environment, project: project,
                             name: 'staging/review-3',
                             state: :stopped)
      end

      let(:environments) { json_response['environments'] }

      context 'when requesting available environments scope' do
        before do
          get :index, environment_params(format: :json, scope: :available)
        end

        it 'responds with a payload describing available environments' 


        it 'contains values describing environment scopes sizes' 


        it 'sets the polling interval header' 

      end

      context 'when requesting stopped environments scope' do
        before do
          get :index, environment_params(format: :json, scope: :stopped)
        end

        it 'responds with a payload describing stopped environments' 


        it 'contains values describing environment scopes sizes' 

      end
    end
  end

  describe 'GET folder' do
    before do
      create(:environment, project: project,
                           name: 'staging-1.0/review',
                           state: :available)
      create(:environment, project: project,
                           name: 'staging-1.0/zzz',
                           state: :available)
    end

    context 'when using default format' do
      it 'responds with HTML' 

    end

    context 'when using JSON format' do
      it 'sorts the subfolders lexicographically' 

    end
  end

  describe 'GET show' do
    context 'with valid id' do
      it 'responds with a status code 200' 

    end

    context 'with invalid id' do
      it 'responds with a status code 404' 

    end
  end

  describe 'GET edit' do
    it 'responds with a status code 200' 

  end

  describe 'PATCH #update' do
    it 'responds with a 302' 

  end

  describe 'PATCH #stop' do
    context 'when env not available' do
      it 'returns 404' 

    end

    context 'when stop action' do
      it 'returns action url' 

    end

    context 'when no stop action' do
      it 'returns env url' 

    end
  end

  describe 'GET #terminal' do
    context 'with valid id' do
      it 'responds with a status code 200' 


      it 'loads the terminals for the enviroment' 

    end

    context 'with invalid id' do
      it 'responds with a status code 404' 

    end
  end

  describe 'GET #terminal_websocket_authorize' do
    context 'with valid workhorse signature' do
      before do
        allow(Gitlab::Workhorse).to receive(:verify_api_request!).and_return(nil)
      end

      context 'and valid id' do
        it 'returns the first terminal for the environment' 

      end

      context 'and invalid id' do
        it 'returns 404' 

      end
    end

    context 'with invalid workhorse signature' do
      it 'aborts with an exception' 

    end
  end

  describe 'GET #metrics' do
    before do
      allow(controller).to receive(:environment).and_return(environment)
    end

    context 'when environment has no metrics' do
      before do
        expect(environment).to receive(:metrics).and_return(nil)
      end

      it 'returns a metrics page' 


      context 'when requesting metrics as JSON' do
        it 'returns a metrics JSON document' 

      end
    end

    context 'when environment has some metrics' do
      before do
        expect(environment).to receive(:metrics).and_return({
          success: true,
          metrics: {},
          last_update: 42
        })
      end

      it 'returns a metrics JSON document' 

    end
  end

  describe 'GET #additional_metrics' do
    before do
      allow(controller).to receive(:environment).and_return(environment)
    end

    context 'when environment has no metrics' do
      before do
        expect(environment).to receive(:additional_metrics).and_return(nil)
      end

      context 'when requesting metrics as JSON' do
        it 'returns a metrics JSON document' 

      end
    end

    context 'when environment has some metrics' do
      before do
        expect(environment)
          .to receive(:additional_metrics)
                .and_return({
                              success: true,
                              data: {},
                              last_update: 42
                            })
      end

      it 'returns a metrics JSON document' 

    end
  end

  def environment_params(opts = {})
    opts.reverse_merge(namespace_id: project.namespace,
                       project_id: project,
                       id: environment.id)
  end
end

