require 'spec_helper'

describe Gitlab::GithubImport::PageCounter, :clean_gitlab_redis_cache do
  let(:project) { double(:project, id: 1) }
  let(:counter) { described_class.new(project, :issues) }

  describe '#initialize' do
    it 'sets the initial page number to 1 when no value is cached' 


    it 'sets the initial page number to the cached value when one is present' 

  end

  describe '#set' do
    it 'overwrites the page number when the given number is greater than the current number' 


    it 'does not overwrite the page number when the given number is lower than the current number' 

  end
end

