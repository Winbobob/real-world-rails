require 'rails_helper'

describe Admin::StaffActionLogsController do
  it "is a subclass of AdminController" 


  let(:admin) { Fabricate(:admin) }

  before do
    sign_in(admin)
  end

  describe '#index' do
    it 'generates logs' 

  end

  describe '#diff' do
    it 'can generate diffs for theme changes' 

  end
end

