require 'spec_helper'

load File.expand_path('../../bin/changelog', __dir__)

describe 'bin/changelog' do
  describe ChangelogOptionParser do
    describe '.parse' do
      it 'parses --amend' 


      it 'parses --force and -f' 


      it 'parses --merge-request and -m' 


      it 'parses --dry-run and -n' 


      it 'parses --git-username and -u' 


      it 'parses --type and -t' 


      it 'parses -h' 


      it 'assigns title' 

    end

    describe '.read_type'  do
      let(:type) { '1' }

      it 'reads type from $stdin' 


      context 'invalid type given' do
        let(:type) { '99' }

        it 'shows error message and exits the program' 

      end
    end
  end
end

