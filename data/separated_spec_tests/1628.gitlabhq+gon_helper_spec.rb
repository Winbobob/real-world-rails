# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::GonHelper do
  let(:helper) do
    Class.new do
      include Gitlab::GonHelper
    end.new
  end

  describe '#push_frontend_feature_flag' do
    it 'pushes a feature flag to the frontend' 

  end
end

