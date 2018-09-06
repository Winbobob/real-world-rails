require 'spec_helper'

describe CiStatusHelper do
  include IconsHelper

  let(:success_commit) { double("Ci::Pipeline", status: 'success') }
  let(:failed_commit) { double("Ci::Pipeline", status: 'failed') }

  describe '#ci_icon_for_status' do
    it 'renders to correct svg on success' 


    it 'renders the correct svg on failure' 

  end

  describe '#ci_text_for_status' do
    context 'when status is manual' do
      it 'changes the status to blocked' 

    end

    context 'when status is success' do
      it 'changes the status to passed' 

    end

    context 'when status is something else' do
      it 'returns status unchanged' 

    end
  end

  describe "#pipeline_status_cache_key" do
    it "builds a cache key for pipeline status" 

  end
end

