# frozen_string_literal: true

require 'rails_helper'

describe ApplicationHelper, type: :helper do
  it 'returns a different favicon in the dev environment' 


  describe '#class_for_path' do
    # class_for_path(req, path)
    subject { class_for_path(req, link_path) }

    let(:req) { OpenStruct.new(path: req_path) }
    let(:link_path) { '/explore' }

    context 'paths are the same' do
      context 'both root path' do
        let(:req_path)  { '/' }
        let(:link_path) { '/' }

        it 'returns `active`' 

      end

      context 'exact match' do
        let(:req_path) { link_path }

        it 'returns `active`' 

      end

      context 'sub path' do
        let(:req_path) { '/explore/sub-link' }

        it 'returns `active`' 

      end

      context 'two sub path links' do
        let(:req_path) { '/explore/sub-link' }
        let(:link_path) { '/explore/sub-link' }

        it 'returns `active` for subpath link' 

      end
    end

    context 'paths not the same' do
      let(:req_path) { '/training' }

      it 'returns nil' 

    end
  end
end

