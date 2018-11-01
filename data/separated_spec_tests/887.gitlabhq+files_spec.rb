require 'spec_helper'

describe API::Files do
  let(:user) { create(:user) }
  let!(:project) { create(:project, :repository, namespace: user.namespace ) }
  let(:guest) { create(:user) { |u| project.add_guest(u) } }
  let(:file_path) { "files%2Fruby%2Fpopen%2Erb" }
  let(:params) do
    {
      ref: 'master'
    }
  end
  let(:author_email) { 'user@example.org' }
  let(:author_name) { 'John Doe' }

  let(:helper) do
    fake_class = Class.new do
      include ::API::Helpers::HeadersHelpers

      attr_reader :headers

      def initialize
        @headers = {}
      end

      def header(key, value)
        @headers[key] = value
      end
    end

    fake_class.new
  end

  before do
    project.add_developer(user)
  end

  def route(file_path = nil)
    "/projects/#{project.id}/repository/files/#{file_path}"
  end

  context 'http headers' do
    it 'converts value into string' 


    it 'raises exception if value is an Enumerable' 

  end

  describe "HEAD /projects/:id/repository/files/:file_path" do
    shared_examples_for 'repository files' do
      it 'returns file attributes in headers' 


      it 'returns file by commit sha' 


      context 'when mandatory params are not given' do
        it "responds with a 400 status" 

      end

      context 'when file_path does not exist' do
        it "responds with a 404 status" 

      end

      context 'when file_path does not exist' do
        include_context 'disabled repository'

        it "responds with a 403 status" 

      end
    end

    context 'when unauthenticated', 'and project is public' do
      it_behaves_like 'repository files' do
        let(:project) { create(:project, :public, :repository) }
        let(:current_user) { nil }
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it "responds with a 404 status" 

    end

    context 'when authenticated', 'as a developer' do
      it_behaves_like 'repository files' do
        let(:current_user) { user }
      end
    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { head api(route(file_path), guest), params }
      end
    end
  end

  describe "GET /projects/:id/repository/files/:file_path" do
    shared_examples_for 'repository files' do
      it 'returns file attributes as json' 


      it 'returns json when file has txt extension' 


      it 'returns file by commit sha' 


      it 'returns raw file info' 


      context 'when mandatory params are not given' do
        it_behaves_like '400 response' do
          let(:request) { get api(route("any%2Ffile"), current_user) }
        end
      end

      context 'when file_path does not exist' do
        let(:params) { { ref: 'master' } }

        it_behaves_like '404 response' do
          let(:request) { get api(route('app%2Fmodels%2Fapplication%2Erb'), current_user), params }
          let(:message) { '404 File Not Found' }
        end
      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { get api(route(file_path), current_user), params }
        end
      end
    end

    context 'when unauthenticated', 'and project is public' do
      it_behaves_like 'repository files' do
        let(:project) { create(:project, :public, :repository) }
        let(:current_user) { nil }
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get api(route(file_path)), params }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a developer' do
      it_behaves_like 'repository files' do
        let(:current_user) { user }
      end
    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { get api(route(file_path), guest), params }
      end
    end
  end

  describe "GET /projects/:id/repository/files/:file_path/raw" do
    shared_examples_for 'repository raw files' do
      it 'returns raw file info' 


      it 'returns raw file info for files with dots' 


      it 'returns file by commit sha' 


      context 'when mandatory params are not given' do
        it_behaves_like '400 response' do
          let(:request) { get api(route("any%2Ffile"), current_user) }
        end
      end

      context 'when file_path does not exist' do
        let(:params) { { ref: 'master' } }

        it_behaves_like '404 response' do
          let(:request) { get api(route('app%2Fmodels%2Fapplication%2Erb'), current_user), params }
          let(:message) { '404 File Not Found' }
        end
      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { get api(route(file_path), current_user), params }
        end
      end
    end

    context 'when unauthenticated', 'and project is public' do
      it_behaves_like 'repository raw files' do
        let(:project) { create(:project, :public, :repository) }
        let(:current_user) { nil }
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get api(route(file_path)), params }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a developer' do
      it_behaves_like 'repository raw files' do
        let(:current_user) { user }
      end
    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { get api(route(file_path), guest), params }
      end
    end
  end

  describe "POST /projects/:id/repository/files/:file_path" do
    let!(:file_path) { "new_subfolder%2Fnewfile%2Erb" }
    let(:params) do
      {
        branch: "master",
        content: "puts 8",
        commit_message: "Added newfile"
      }
    end

    it "creates a new file in project repo" 


    it "returns a 400 bad request if no mandatory params given" 


    it 'returns a 400 bad request if the commit message is empty' 


    it "returns a 400 if editor fails to create file" 


    context "when specifying an author" do
      it "creates a new file with the specified author" 

    end

    context 'when the repo is empty' do
      let!(:project) { create(:project_empty_repo, namespace: user.namespace ) }

      it "creates a new file in project repo" 

    end
  end

  describe "PUT /projects/:id/repository/files" do
    let(:params) do
      {
        branch: 'master',
        content: 'puts 8',
        commit_message: 'Changed file'
      }
    end

    it "updates existing file in project repo" 


    it 'returns a 400 bad request if the commit message is empty' 


    it "returns a 400 bad request if update existing file with stale last commit id" 


    it "updates existing file in project repo with accepts correct last commit id" 


    it "returns a 400 bad request if no params given" 


    context "when specifying an author" do
      it "updates a file with the specified author" 

    end
  end

  describe "DELETE /projects/:id/repository/files" do
    let(:params) do
      {
        branch: 'master',
        commit_message: 'Changed file'
      }
    end

    it "deletes existing file in project repo" 


    it "returns a 400 bad request if no params given" 


    it 'returns a 400 bad request if the commit message is empty' 


    it "returns a 400 if fails to delete file" 


    context "when specifying an author" do
      it "removes a file with the specified author" 

    end
  end

  describe "POST /projects/:id/repository/files with binary file" do
    let(:file_path) { 'test%2Ebin' }
    let(:put_params) do
      {
        branch: 'master',
        content: 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABAQMAAAAl21bKAAAAA1BMVEUAAACnej3aAAAAAXRSTlMAQObYZgAAAApJREFUCNdjYAAAAAIAAeIhvDMAAAAASUVORK5CYII=',
        commit_message: 'Binary file with a \n should not be touched',
        encoding: 'base64'
      }
    end
    let(:get_params) do
      {
        ref: 'master'
      }
    end

    before do
      post api(route(file_path), user), put_params
    end

    it "remains unchanged" 

  end
end

