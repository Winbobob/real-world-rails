require 'rails_helper'

describe 'post /api/v0/manifests/:manifest_id/signature' do
  context 'submits successfully' do
    context 'submit by manifest id' do
      it 'creates retrieves and resaves a manifest with transaction id' 

    end

    context 'submit by manifest tracking number' do
      it 'creates retrieves and resaves a manifest with transaction id' 

    end
  end

  context 'sign failure' do
    context 'user lacks submitter role' do
      it 'returns 403 response' 

    end

    context 'bad token sent with request' do
      it 'returns a helpful error message' 

    end
  end

  private

  def question_id
    "123abc"
  end

  def token
    "abcedf123"
  end

  def user_id
    "fakeUserId"
  end
end

