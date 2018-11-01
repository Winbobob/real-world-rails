# frozen_string_literal: true

require 'spec_helper'

describe UserFinder do
  set(:user) { create(:user) }

  describe '#find_by_id' do
    context 'when the user exists' do
      it 'returns the user' 

    end

    context 'when the user exists (id as string)' do
      it 'returns the user' 

    end

    context 'when the user does not exist' do
      it 'returns nil' 

    end
  end

  describe '#find_by_username' do
    context 'when the user exists' do
      it 'returns the user' 

    end

    context 'when the user does not exist' do
      it 'returns nil' 

    end
  end

  describe '#find_by_id_or_username' do
    context 'when the user exists (id)' do
      it 'returns the user' 

    end

    context 'when the user exists (id as string)' do
      it 'returns the user' 

    end

    context 'when the user exists (username)' do
      it 'returns the user' 

    end

    context 'when the user does not exist (username)' do
      it 'returns nil' 

    end

    context 'when the user does not exist' do
      it 'returns nil' 

    end
  end

  describe '#find_by_id!' do
    context 'when the user exists' do
      it 'returns the user' 

    end

    context 'when the user exists (id as string)' do
      it 'returns the user' 

    end

    context 'when the user does not exist' do
      it 'raises ActiveRecord::RecordNotFound' 

    end
  end

  describe '#find_by_username!' do
    context 'when the user exists' do
      it 'returns the user' 

    end

    context 'when the user does not exist' do
      it 'raises ActiveRecord::RecordNotFound' 

    end
  end

  describe '#find_by_id_or_username!' do
    context 'when the user exists (id)' do
      it 'returns the user' 

    end

    context 'when the user exists (id as string)' do
      it 'returns the user' 

    end

    context 'when the user exists (username)' do
      it 'returns the user' 

    end

    context 'when the user does not exist (username)' do
      it 'raises ActiveRecord::RecordNotFound' 

    end

    context 'when the user does not exist' do
      it 'raises ActiveRecord::RecordNotFound' 

    end
  end
end

