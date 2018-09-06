# frozen_string_literal: true
require 'rails_helper'

RSpec.describe RouteOverridesHelper, type: :helper do
  let(:helper_host) do
    RouteOverridesHelper.send(:map_route, :some_long_helper, to: :some_short_helper)
    Class.new do
      include RouteOverridesHelper
      def some_short_helper_path(*); end
    end
  end
  subject { helper_host.new }

  describe '.map_route' do
    it 'generates overrides for both _path and _url suffixes' 


    it 'generates both singular and plural routes' 


    it 'generates routes for new and edit actions' 


    it 'forwards all arguments to the correct helper method' 

  end
end

