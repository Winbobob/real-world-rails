require 'spec_helper'

describe 'Admin Builds' do
  before do
    sign_in(create(:admin))
  end

  describe 'GET /admin/builds' do
    let(:pipeline) { create(:ci_pipeline) }

    context 'All tab' do
      context 'when have jobs' do
        it 'shows all jobs' 

      end

      context 'when have no jobs' do
        it 'shows a message' 

      end
    end

    context 'Pending tab' do
      context 'when have pending jobs' do
        it 'shows pending jobs' 

      end

      context 'when have no jobs pending' do
        it 'shows a message' 

      end
    end

    context 'Running tab' do
      context 'when have running jobs' do
        it 'shows running jobs' 

      end

      context 'when have no jobs running' do
        it 'shows a message' 

      end
    end

    context 'Finished tab' do
      context 'when have finished jobs' do
        it 'shows finished jobs' 

      end

      context 'when have no jobs finished' do
        it 'shows a message' 

      end
    end
  end
end

