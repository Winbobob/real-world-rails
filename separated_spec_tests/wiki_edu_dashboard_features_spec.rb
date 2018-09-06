# frozen_string_literal: true

require 'rails_helper'
require_relative '../../app/presenters/features'

describe Features do
  describe '.wiki_ed?' do
    context 'when the url is dashboard-testing.wikiedu.org' do
      before do
        allow(ENV).to receive(:[]).with('dashboard_url').and_return('dashboard-testing.wikiedu.org')
      end
      it 'returns true' 

    end

    context 'when the url is outreachdashboard.wmflabs.org' do
      before do
        allow(ENV).to receive(:[]).with('dashboard_url').and_return('outreachdashboard.wmflabs.org')
      end
      it 'returns false' 

    end
  end
end

