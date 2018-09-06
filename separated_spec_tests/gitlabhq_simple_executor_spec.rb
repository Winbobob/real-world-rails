require 'spec_helper'
require 'rake_helper'

describe SystemCheck::SimpleExecutor do
  class SimpleCheck < SystemCheck::BaseCheck
    set_name 'my simple check'

    def check?
      true
    end
  end

  class OtherCheck < SystemCheck::BaseCheck
    set_name 'other check'

    def check?
      false
    end

    def show_error
      $stdout.puts 'this is an error text'
    end
  end

  class SkipCheck < SystemCheck::BaseCheck
    set_name 'skip check'
    set_skip_reason 'this is a skip reason'

    def skip?
      true
    end

    def check?
      raise 'should not execute this'
    end
  end

  class DynamicSkipCheck < SystemCheck::BaseCheck
    set_name 'dynamic skip check'
    set_skip_reason 'this is a skip reason'

    def skip?
      self.skip_reason = 'this is a dynamic skip reason'
      true
    end

    def check?
      raise 'should not execute this'
    end
  end

  class MultiCheck < SystemCheck::BaseCheck
    set_name 'multi check'

    def multi_check
      $stdout.puts 'this is a multi output check'
    end

    def check?
      raise 'should not execute this'
    end
  end

  class SkipMultiCheck < SystemCheck::BaseCheck
    set_name 'skip multi check'

    def skip?
      true
    end

    def multi_check
      raise 'should not execute this'
    end
  end

  class RepairCheck < SystemCheck::BaseCheck
    set_name 'repair check'

    def check?
      false
    end

    def repair!
      true
    end

    def show_error
      $stdout.puts 'this is an error message'
    end
  end

  class BugousCheck < SystemCheck::BaseCheck
    CustomError = Class.new(StandardError)
    set_name 'my bugous check'

    def check?
      raise CustomError, 'omg'
    end
  end

  before do
    @rainbow = Rainbow.enabled
    Rainbow.enabled = false
  end

  after do
    Rainbow.enabled = @rainbow
  end

  describe '#component' do
    it 'returns stored component name' 

  end

  describe '#checks' do
    before do
      subject << SimpleCheck
    end

    it 'returns a set of classes' 

  end

  describe '#<<' do
    before do
      subject << SimpleCheck
    end

    it 'appends a new check to the Set' 


    it 'inserts unique itens only' 


    it 'errors out when passing multiple items' 

  end

  subject { described_class.new('Test') }

  describe '#execute' do
    before do
      silence_output

      subject << SimpleCheck
      subject << OtherCheck
    end

    it 'runs included checks' 

  end

  describe '#run_check' do
    it 'prints check name' 


    context 'when check pass' do
      it 'prints yes' 

    end

    context 'when check fails' do
      it 'prints no' 


      it 'displays error message from #show_error' 


      context 'when check implements #repair!' do
        it 'executes #repair!' 


        context 'when repair succeeds' do
          it 'does not execute #show_error' 

        end

        context 'when repair fails' do
          it 'does not execute #show_error' 

        end
      end
    end

    context 'when check implements skip?' do
      it 'executes #skip? method' 


      it 'displays .skip_reason' 


      it 'displays #skip_reason' 


      it 'does not execute #check when #skip? is true' 

    end

    context 'when implements a #multi_check' do
      it 'executes #multi_check method' 


      it 'does not execute #check method' 


      context 'when check implements #skip?' do
        it 'executes #skip? method' 

      end
    end

    context 'when there is an exception' do
      it 'rescues the exception' 

    end
  end
end

