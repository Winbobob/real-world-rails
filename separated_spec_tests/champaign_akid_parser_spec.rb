# frozen_string_literal: true
require 'rails_helper'

describe AkidParser do
  subject { AkidParser }

  context 'valid akids' do
    let(:valid_akids) { ['1234.5678.tKK7gX', '.5678.hIdbLl', '64gd53.4325.Ivqznz'] }

    context 'with correct secret' do
      it 'returns populated response' 

    end

    context 'with tampered secret' do
      it 'returns unpopulated response' 

    end
  end

  context 'invalid akids' do
    let(:akids_bad_hash) { ['1234.5678.bad', '.5678.', '64gd53.4325'] }
    let(:crazy_akids) { ['123123', '', nil, '3232.3123.12312.3234234'] }

    it 'returns unpopulated response' 

  end
end

