# frozen_string_literal: true

require 'rails_helper'

describe ApplicationHelper do
  describe '#more_facets_link_path' do
    context 'with the shares controller' do
      before { allow(helper).to receive(:controller_name).and_return('shares') }

      it 'returns the path' 

    end

    context 'with the works controller' do
      before { allow(helper).to receive(:controller_name).and_return('works') }

      it 'returns the path' 

    end
  end
end
