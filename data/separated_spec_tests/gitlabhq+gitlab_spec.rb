require 'fast_spec_helper'

require_dependency 'gitlab'

describe Gitlab do
  describe '.root' do
    it 'returns the root path of the app' 

  end
  describe '.revision' do
    let(:cmd) { %W[#{described_class.config.git.bin_path} log --pretty=format:%h -n 1] }

    around do |example|
      described_class.instance_variable_set(:@_revision, nil)
      example.run
      described_class.instance_variable_set(:@_revision, nil)
    end

    context 'when a REVISION file exists' do
      before do
        expect(File).to receive(:exist?)
          .with(described_class.root.join('REVISION'))
          .and_return(true)
      end

      it 'returns the actual Git revision' 


      it 'memoizes the revision' 

    end

    context 'when no REVISION file exist' do
      context 'when the Git command succeeds' do
        before do
          expect(Gitlab::Popen).to receive(:popen_with_detail)
          .with(cmd)
          .and_return(Gitlab::Popen::Result.new(cmd, 'abc123', '', double(success?: true)))
        end

        it 'returns the actual Git revision' 

      end

      context 'when the Git command fails' do
        before do
          expect(Gitlab::Popen).to receive(:popen_with_detail)
          .with(cmd)
          .and_return(Gitlab::Popen::Result.new(cmd, '', 'fatal: Not a git repository', double('Process::Status', success?: false)))
        end

        it 'returns "Unknown"' 

      end
    end
  end

  describe '.com?' do
    it 'is true when on GitLab.com' 


    it 'is true when on staging' 


    it 'is true when on other gitlab subdomain' 


    it 'is false when not on GitLab.com' 

  end
end

