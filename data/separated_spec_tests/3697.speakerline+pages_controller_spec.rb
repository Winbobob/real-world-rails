require 'rails_helper'

RSpec.describe PagesController do
  it { is_expected.to route(:get, '/').to(action: :homepage) }

  describe "GET #homepage" do
    it 'returns success' 

  end
end

