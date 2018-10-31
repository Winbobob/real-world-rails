# frozen_string_literal: true
require 'spec_helper'

describe Gitlab::Kubernetes::Helm::Certificate do
  describe '.generate_root' do
    subject { described_class.generate_root }

    it 'should generate a root CA that expires a long way in the future' 

  end

  describe '#issue' do
    subject { described_class.generate_root.issue }

    it 'should generate a cert that expires soon' 


    context 'passing in INFINITE_EXPIRY' do
      subject { described_class.generate_root.issue(expires_in: described_class::INFINITE_EXPIRY) }

      it 'should generate a cert that expires a long way in the future' 

    end
  end
end

