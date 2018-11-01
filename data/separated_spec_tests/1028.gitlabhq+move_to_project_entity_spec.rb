# frozen_string_literal: true

require 'spec_helper'

describe MoveToProjectEntity do
  describe '#as_json' do
    let(:project) { build(:project, id: 1) }

    subject { described_class.new(project).as_json }

    it 'includes the project ID' 


    it 'includes the full path' 

  end
end

