require 'rails_helper'

describe 'Email Target Emails' do
  let!(:page) { create(:page, title: 'Foo Bar', slug: 'foo-bar') }

  describe 'GET index' do
    before do
      allow_any_instance_of(Aws::DynamoDB::Client).to receive(:query)
        .and_return(
          instance_double('Response', items: [], last_evaluated_key: nil)
        )

      login_as(create(:user), scope: :user)
    end

    it 'returns found' 


    it 'fetches records from DynamoDB' 

  end

  describe 'POST download' do
    before do
      allow_any_instance_of(Aws::SNS::Client).to receive(:publish)

      login_as(create(:user), scope: :user)
    end

    it 'post message to SNS topic' 

  end
end

