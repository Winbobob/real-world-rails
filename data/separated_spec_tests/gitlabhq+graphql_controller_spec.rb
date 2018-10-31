require 'spec_helper'

describe GraphqlController do
  describe 'execute' do
    let(:user) { nil }

    before do
      sign_in(user) if user

      run_test_query!
    end

    subject { query_response }

    context 'graphql is disabled by feature flag' do
      let(:user) { nil }

      before do
        stub_feature_flags(graphql: false)
      end

      it 'returns 404' 

    end

    context 'signed out' do
      let(:user) { nil }

      it 'runs the query with current_user: nil' 

    end

    context 'signed in' do
      let(:user) { create(:user, username: 'Simon') }

      it 'runs the query with current_user set' 

    end

    context 'invalid variables' do
      it 'returns an error' 

    end
  end

  # Chosen to exercise all the moving parts in GraphqlController#execute
  def run_test_query!(variables: { 'text' => 'test success' })
    query = <<~QUERY
      query Echo($text: String) {
        echo(text: $text)
      }
    QUERY

    post :execute, query: query, operationName: 'Echo', variables: variables
  end

  def query_response
    json_response['data']
  end
end

