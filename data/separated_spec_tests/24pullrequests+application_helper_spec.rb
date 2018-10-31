require 'rails_helper'

describe ApplicationHelper, type: :helper do

  describe '#parameterize_language' do
    it 'parameterizes a language param' 


    it 'parameterizes a language param including a hash' 


    it 'parameterizes a language param including a plus' 

  end

  describe '#language_link' do
    it 'returns a link for a language' 


    it 'returns a link with a label' 


    it 'returns a link for multiple languages' 


    it 'returns a link for multiple languages without a label' 

  end

  describe 'stats' do
    let(:user) { create(:user) }
    let(:last_year) { DateTime.now.year - 1 }

    before do
      3.times { create(:pull_request, user: user, repo_name: 'test_repo', created_at: DateTime.now - 1.year) }
    end

    it 'contributors_in(year)' 


    it 'pull_requests_in(year)' 


    it 'projects_in(year)' 

  end
end

