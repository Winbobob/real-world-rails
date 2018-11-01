require 'spec_helper'

describe Gitlab::Routing do
  context 'when module is included' do
    subject do
      Class.new.include(described_class).new
    end

    it 'makes it possible to access url helpers' 

  end

  context 'when module is not included' do
    subject do
      Class.new.include(described_class.url_helpers).new
    end

    it 'exposes url helpers module through a method' 

  end
end

