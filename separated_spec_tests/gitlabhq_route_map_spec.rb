require 'spec_helper'

describe Gitlab::RouteMap do
  describe '#initialize' do
    context 'when the data is not YAML' do
      it 'raises an error' 

    end

    context 'when the data is not a YAML array' do
      it 'raises an error' 

    end

    context 'when an entry is not a hash' do
      it 'raises an error' 

    end

    context 'when an entry does not have a source key' do
      it 'raises an error' 

    end

    context 'when an entry does not have a public key' do
      it 'raises an error' 

    end

    context 'when an entry source is not a valid regex' do
      it 'raises an error' 

    end

    context 'when all is good' do
      it 'returns a route map' 

    end
  end

  describe '#public_path_for_source_path' do
    context 'malicious regexp' do
      include_examples 'malicious regexp'

      subject do
        map = described_class.new(<<-"MAP".strip_heredoc)
        - source: '#{malicious_regexp}'
          public: '/'
        MAP

        map.public_path_for_source_path(malicious_text)
      end
    end

    subject do
      described_class.new(<<-'MAP'.strip_heredoc)
        # Team data
        - source: 'data/team.yml'
          public: 'team/'

        # Blogposts
        - source: /source/posts/([0-9]{4})-([0-9]{2})-([0-9]{2})-(.+?)\..*/ # source/posts/2017-01-30-around-the-world-in-6-releases.html.md.erb
          public: '\1/\2/\3/\4/' # 2017/01/30/around-the-world-in-6-releases/

        # HTML files
        - source: /source/(.+?\.html).*/ # source/index.html.haml
          public: '\1' # index.html

        # Other files
        - source: /source/(.*)/ # source/images/blogimages/around-the-world-in-6-releases-cover.png
          public: '\1' # images/blogimages/around-the-world-in-6-releases-cover.png
      MAP
    end

    it 'returns the public path for a provided source path' 

  end
end

