require 'rails_helper'

RSpec.describe Jobs::DownloadAvatarFromUrl do
  let(:user) { Fabricate(:user) }

  describe 'when url is invalid' do
    it 'should not raise any error' 

  end
end

