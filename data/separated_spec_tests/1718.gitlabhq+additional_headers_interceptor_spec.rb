require 'spec_helper'

describe Gitlab::Email::Hook::AdditionalHeadersInterceptor do
  let(:mail) do
    ActionMailer::Base.mail(to: 'test@mail.com', from: 'info@mail.com', body: 'hello')
  end

  before do
    mail.deliver_now
  end

  it 'adds Auto-Submitted header' 


  context 'when the same mail object is sent twice' do
    before do
      mail.deliver_now
    end

    it 'does not add the Auto-Submitted header twice' 

  end
end

