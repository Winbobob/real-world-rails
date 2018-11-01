require 'spec_helper'

describe BitbucketServer::Paginator do
  let(:last_page) { double(:page, next?: false, items: ['item_2']) }
  let(:first_page) { double(:page, next?: true, next: last_page, items: ['item_1']) }
  let(:connection) { instance_double(BitbucketServer::Connection) }

  describe '#items' do
    let(:paginator) { described_class.new(connection, 'http://more-data', :pull_request) }
    let(:page_attrs) { { 'isLastPage' => false, 'nextPageStart' => 1 } }

    it 'returns items and raises StopIteration in the end' 


    it 'calls the connection with different offsets' 

  end
end

