require 'spec_helper'

describe Gitlab::CrossProjectAccess::ClassMethods do
  let(:dummy_class) do
    Class.new do
      extend Gitlab::CrossProjectAccess::ClassMethods
    end
  end
  let(:dummy_proc) { lambda { false } }

  describe '#requires_cross_project_access' do
    it 'creates a correct check when a hash is passed' 


    it 'creates a correct check when an array is passed' 


    it 'creates a correct check when an array and a hash is passed' 

  end
end

