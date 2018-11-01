# frozen_string_literal: true

require 'spec_helper'

describe Admin::RunnersFinder do
  describe '#execute' do
    context 'with empty params' do
      it 'returns all runners' 

    end

    context 'filter by search term' do
      it 'calls Ci::Runner.search' 

    end

    context 'filter by status' do
      it 'calls the corresponding scope on Ci::Runner' 

    end

    context 'filter by runner type' do
      it 'calls the corresponding scope on Ci::Runner' 

    end

    context 'sort' do
      context 'without sort param' do
        it 'sorts by created_at' 

      end

      context 'with sort param' do
        it 'sorts by specified attribute' 

      end
    end

    context 'paginate' do
      it 'returns the runners for the specified page' 

    end
  end
end

