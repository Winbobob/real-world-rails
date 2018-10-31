require 'spec_helper'

describe SearchController do
  let(:fake_result_set) do
    double(:fake_result_set)
  end

  let(:fake_keywords_by_count) do
    double(:fake_keywords)
  end

  let(:fake_keywords) do
    double(:fake_keywords, reverse: fake_keywords_by_count)
  end

  describe 'GET #new' do
    before do
      allow(SearchResultSet).to receive(:new).and_return(fake_result_set)
      allow(Keyword).to receive(:all_sorted_by).and_return(fake_keywords)
    end

    it 'creates and assigns a search result set object' 


    it 'assigns keywords' 

  end

  describe 'GET #show' do
    before do
      allow(SearchResultSet).to receive(:new).and_return(fake_result_set)
    end

    it 'searches for the supplied query' 


    context 'when successful' do
      before do
        allow(SearchResultSet).to receive(:find).and_return(fake_result_set)
      end

      context 'when an html request' do
        it 'assigns the results' 

      end

      context 'when a json request' do
        it 'returns the json representation of the results' 

      end
    end
  end

  describe 'GET #load_tags' do

    let(:repo) { Repository.new(id: 'foo/bar', tags: ['latest']) }

    before do
      allow(Repository).to receive(:find).and_return(repo)
    end

    it 'returns a list of tags' 


    context 'when the local_image parameter is set to true' do

      it 'passes local=true flag to the API call' 

    end

    context 'when the local_image parameter is set to false' do

      it 'passes local=false flag to the API call' 

    end

    context 'when the registry_id parameter is set' do
      it 'passes the registry_id along' 

    end
  end
end

