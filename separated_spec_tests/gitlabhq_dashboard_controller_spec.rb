require 'spec_helper'

describe Admin::DashboardController do
  describe '#index' do
    context 'with pending_delete projects' do
      render_views

      it 'does not retrieve projects that are pending deletion' 

    end
  end
end

