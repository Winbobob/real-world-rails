require_relative '../spec_helper'

module Aws
  describe PageableResponse do

    def pageable(resp, pager)
      resp.extend(PageableResponse)
      resp.pager = pager
      resp.context[:original_params] = resp.context.params
      resp
    end

    let(:pager) { Pager.new(options) }

    let(:resp) { pageable(Seahorse::Client::Response.new, pager) }

    describe 'pagable operations' do

      let(:options) {{
        tokens: {
          'next_token' => 'offset'
        }
      }}

      it 'is Enumerable' 


      it 'returns false from last page if the paging token value is present' 


      it 'is not pageable if response data does not contain tokens' 


      it 'is not pageable if next token is an empty hash' 


      it 'is not pageable if next token is an empty array' 


      it 'is not pageable if next token is an empty string' 


      it 'responds to #next_page by sending a new request with tokens applied' 


    end

    describe 'paging with multiple tokens' do

      let(:options) {{
        tokens: {
          'group' => 'offset_a',
          'value' => 'offset_b'
        }
      }}

      it 'returns false from last page if all paging tokens are present' 


      it 'returns false from last page if ANY paging token is present' 


      it 'returns true from last page if NO paging tokens are present' 


      it 'sends any tokens found a request params' 


    end

    describe 'paging with truncation indicator' do

      let(:options) {{
        tokens: {
          'next_marker' => 'marker'
        },
        more_results: 'is_truncated'
      }}

      it 'returns false from last page if the truncation marker is true' 


      it 'returns true from last page if the truncation marker is false' 


    end

    describe '#each_page' do

      let(:options) {{
        tokens: {
          'next_token' => 'offset'
        }
      }}

      it 'yields once per paging result' 


    end

    describe '#count' do

      let(:options) {{
        tokens: {}
      }}

      it 'raises not implemented error by default' 


      it 'passes count from the raises not implemented error by default' 


      it 'returns false from respond_to when count not present' 


      it 'indicates it responds to count when data#count exists' 


      it 'correctly answers respond_to? with methods different than #count' 


    end
  end
end

