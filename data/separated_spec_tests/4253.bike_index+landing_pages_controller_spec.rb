require 'spec_helper'

describe LandingPagesController do
  include_context :page_content_values
  describe 'show' do
    it 'renders revised_layout' 

  end

  %w(for_shops for_advocacy for_law_enforcement for_schools).each do |landing_type|
    describe landing_type do
      it 'renders with correct title' 

    end
  end
end

