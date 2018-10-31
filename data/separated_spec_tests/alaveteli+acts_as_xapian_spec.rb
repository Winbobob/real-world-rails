# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ActsAsXapian do

  before { update_xapian_index }

  describe '.update_index' do

    it 'processes jobs that were queued after a job that errors' 


  end

end

describe ActsAsXapian::FailedJob do
  let(:error) { StandardError.new('Testing the error handling') }
  let(:model_data) { { model: 'PublicBody', model_id: 7 } }
  let(:failed_job) { described_class.new(1, error, model_data) }

  describe '.new' do

    it 'requires a job_id' 


    it 'requires an error' 


    it 'sets model_data to an empty hash by default' 


  end

  describe '#job_id' do

    it 'returns the job_id' 


  end

  describe '#error' do

    it 'returns the error' 


  end

  describe '#model_data' do

    it 'returns the model_data' 


  end

  describe '#full_message' do

    it 'returns a message suitable for the exception notification' 


  end

  describe '#error_backtrace' do

    it 'returns the error backtrace' 


  end

  describe '#job_info' do

    context 'with full job info' do
      let(:failed_job) { described_class.new(1, error, model_data) }

      it 'includes information about the model being processed' 

    end

    context 'without the model name' do
      let(:model_data) { { model_id: 7, model: nil } }
      let(:failed_job) { described_class.new(1, error, model_data) }

      it 'includes information about the model being processed' 

    end

    context 'without the model id' do
      let(:model_data) { { model_id: nil, model: 'PublicBody' } }
      let(:failed_job) { described_class.new(1, error, model_data) }

      it 'includes information about the model being processed' 

    end

    context 'without any model data' do
      let(:failed_job) { described_class.new(1, error) }

      it 'just includes information about the job' 

    end
  end

end

describe ActsAsXapian::Search do

  describe "#words_to_highlight" do

    before :all do
      get_fixtures_xapian_index
      # make sure an index exists
      @alice = FactoryBot.create(:public_body, :name => 'alice')
      update_xapian_index
    end

    after :all do
      @alice.destroy
      update_xapian_index
    end

    it "should return a list of words used in the search" 


    it "should remove any operators" 


    it "should separate punctuation" 


    it "should handle non-ascii characters" 


    it "should ignore stopwords" 


    it "uses stemming" 


    it "doesn't stem proper nouns" 


    it "includes the original search terms if requested" 


    it "does not return duplicate terms" 


    context 'the :regex option' do

      it 'wraps each words in a regex that matches the full word' 


      it 'wraps each stem in a regex' 


    end
  end

  describe '#spelling_correction' do

    before :all do
      load_raw_emails_data
      get_fixtures_xapian_index
      @alice = FactoryBot.create(:public_body, :name => 'alice')
      @bob = FactoryBot.create(:public_body, :name => 'bôbby')
      update_xapian_index
    end

    after :all do
      @alice.destroy
      @bob.destroy
      update_xapian_index
    end

    it 'returns a UTF-8 encoded string' 


    it 'handles non-ASCII characters' 


  end

end

