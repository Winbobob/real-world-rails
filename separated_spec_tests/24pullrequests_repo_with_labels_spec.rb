require 'rails_helper'

describe RepoWithLabels do
  let(:client) do
    instance_double('GithubClient')
  end

  describe '#repo' do
    it 'Repository with name' 


    it 'Repository with github url' 

  end

  describe '#call' do
    let(:res) do
      described_class.new(client, 'foo/bar')
    end

    it 'successful' 


    # Test to make sure it doesnt error
    it 'successful but no html_url' 


    it 'InvalidRepository' 


    it 'NotFound' 


    it 'TooManyRequests' 


    it 'Unauthorized' 

  end
end

