require 'spec_helper'

describe 'Admin activates Prometheus' do
  let(:admin) { create(:user, :admin) }

  before do
    sign_in(admin)

    visit(admin_application_settings_services_path)

    click_link('Prometheus')
  end

  it 'activates service' 

end

