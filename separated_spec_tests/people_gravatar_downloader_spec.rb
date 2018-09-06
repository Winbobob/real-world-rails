require 'spec_helper'

describe GravatarDownloader do
  let(:user) { create(:user) }
  subject { described_class.new(user) }

  describe '#call' do
    it 'sets remote_gravatar_url field for user' 

  end
end

