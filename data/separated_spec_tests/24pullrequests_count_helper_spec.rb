require 'rails_helper'

describe CountHelper, type: :helper do
  context 'with language present' do
    before do
      @language = 'Erlang'
    end

    describe '#project_count_for_language' do
      it 'returns the number of project using the given language' 

    end

    describe '#pull_request_count_for_language' do
      it 'returns the number of pull requests using the given language' 

    end

    describe '#user_count_for_language' do
      it 'returns the number of users using the given language' 

    end
  end

  describe '#pull_request_count' do
    before do
      1.times { create :pull_request, language: 'HTML' }
      2.times { create :pull_request, language: 'Ruby' }
      4.times { create :pull_request, created_at: DateTime.now - 1.year }
    end

    it 'returns the number of pull requests in the current year' 


    it 'returns the number of all pull requests in a given language' 

  end

  describe "#user_count" do
    before do
      3.times { create :skill, language: 'Erlang' }
      2.times { create :skill, language: 'Python' }
    end

    describe '#user_count' do
      it 'returns the number of all users' 


      it 'returns the number of all users using a language' 

    end
  end
end

