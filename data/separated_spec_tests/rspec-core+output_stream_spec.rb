require 'support/aruba_support'

RSpec.describe 'Output stream' do
  include_context 'aruba support'
  before { clean_current_dir }

  context 'when a formatter set in a configure block' do
    it 'writes to the right output stream' 
          it 'succeeds' 

        end
      SPEC

      run_command ''
      expect(last_cmd_stdout).to be_empty
      in_current_dir do
        expect(File.read('saved_output')).to include('1 example, 0 failures')
      end
    end

    it 'writes to the right output stream even when its a filename' 
          it 'succeeds' 

        end
      SPEC

      run_command ''
      expect(last_cmd_stdout).to be_empty
      in_current_dir do
        expect(File.read('saved_output')).to include('1 example, 0 failures')
      end
    end

    it 'writes to the right output stream even when its a filename' 
          it 'succeeds' 

        end
      SPEC

      run_command ''
      expect(last_cmd_stdout).to be_empty
      in_current_dir do
        expect(File.read('saved_output')).to include('1 example, 0 failures')
      end
    end
  end
end

