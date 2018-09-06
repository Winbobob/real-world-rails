require 'spec_helper'

describe Gitlab::CrossProjectAccess::CheckInfo do
  let(:dummy_controller) { double }

  before do
    allow(dummy_controller).to receive(:action_name).and_return('index')
  end

  describe '#should_run?' do
    it 'runs when an action is defined' 


    it 'runs when the action is missing' 


    it 'does not run when the action is excluded' 


    it 'runs when the `if` conditional is true' 


    it 'does not run when the if condition is false' 


    it 'does not run when the `unless` check is true' 


    it 'runs when the `unless` check is false' 


    it 'returns the the oposite of #should_skip? when the check is a skip' 

  end

  describe '#should_skip?' do
    it 'skips when an action is defined' 


    it 'does not skip when the action is not defined' 


    it 'does not skip when the action is excluded' 


    it 'skips when the `if` conditional is true' 


    it 'does not skip the `if` conditional is false' 


    it 'does not skip when the `unless` check is true' 


    it 'skips when `unless` check is false' 


    it 'returns the the oposite of #should_run? when the check is not a skip' 

  end
end

