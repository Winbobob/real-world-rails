# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminPolicy do
  let(:user) { nil }

  subject { AdminPolicy.new(user, Admin) }

  context 'permission access?' do
    context 'when user is nil' do
      it 'should deny access if user is nil' 

    end

    context 'whe user is not admin' do
      let(:user) { User.new }
      it 'should deny access if user is not admin' 

    end

    context 'when user is admin' do
      let(:user) do
        _user = User.new
        _user.admin = true
        _user
      end
      it 'should permit access if user is admin' 

    end
  end
end

