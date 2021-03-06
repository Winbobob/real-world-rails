require 'rails_helper'

describe Api::V1::UsersController do
  let(:user) { create(:user) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    it 'should return the correct json' 

  end

  describe '#current_user_and_coteachers' do
    let!(:teacher) { create(:teacher) }

    before do
      allow(ActiveRecord::Base.connection).to receive(:execute).and_return([teacher])
    end

    it 'should return the correct json' 

  end
end

