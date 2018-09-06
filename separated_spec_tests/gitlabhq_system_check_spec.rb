require 'spec_helper'
require 'rake_helper'

describe SystemCheck do
  class SimpleCheck < SystemCheck::BaseCheck
    def check?
      true
    end
  end

  class OtherCheck < SystemCheck::BaseCheck
    def check?
      false
    end
  end

  before do
    silence_output
  end

  describe '.run' do
    subject { described_class }

    it 'detects execution of SimpleCheck' 


    it 'detects exclusion of OtherCheck in execution' 

  end
end

