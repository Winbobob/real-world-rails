require 'securerandom'

module QA
  describe 'API basics' do
    before(:context) do
      @api_client = Runtime::API::Client.new(:gitlab)
    end

    let(:project_name) { "api-basics-#{SecureRandom.hex(8)}" }
    let(:sanitized_project_path) { CGI.escape("#{Runtime::User.username}/#{project_name}") }

    it 'user creates a project with a file and deletes them afterwards' 

  end
end

