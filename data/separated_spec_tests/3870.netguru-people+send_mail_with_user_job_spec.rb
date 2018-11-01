require 'spec_helper'

describe SendMailWithUserJob do
  let(:mailer) { described_class }
  let(:user) { create(:user) }
  let(:membership) { create(:membership, user: user) }

  describe '#perform' do
    it 'delivers an email' 

  end
end

