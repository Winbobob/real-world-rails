require 'spec_helper'

describe Gitlab::Serializer::Pagination do
  let(:request) { spy('request') }
  let(:response) { spy('response') }
  let(:headers) { spy('headers') }

  before do
    allow(request).to receive(:query_parameters)
      .and_return(params)

    allow(response).to receive(:headers)
      .and_return(headers)
  end

  let(:pagination) { described_class.new(request, response) }

  describe '#paginate' do
    subject { pagination.paginate(resource) }

    let(:resource) { User.all }
    let(:params) { { page: 1, per_page: 2 } }

    context 'when a multiple resources are present in relation' do
      before do
        create_list(:user, 3)
      end

      it 'correctly paginates the resource' 


      it 'appends relevant headers' 

    end

    context 'when an invalid resource is about to be paginated' do
      let(:resource) { create(:user) }

      it 'raises error' 

    end
  end
end

