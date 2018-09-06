require 'spec_helper'

describe Gitlab::Allowable do
  subject do
    Class.new.include(described_class).new
  end

  describe '#can?' do
    let(:user) { create(:user) }

    context 'when user is allowed to do something' do
      let(:project) { create(:project, :public) }

      it 'reports correct ability to perform action' 

    end

    context 'when user is not allowed to do something' do
      let(:project) { create(:project, :private) }

      it 'reports correct ability to perform action' 

    end
  end
end

