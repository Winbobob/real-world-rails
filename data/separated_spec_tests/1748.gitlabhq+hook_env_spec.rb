require 'spec_helper'

describe Gitlab::Git::HookEnv do
  let(:gl_repository) { 'project-123' }

  describe ".set" do
    context 'with RequestStore disabled' do
      it 'does not store anything' 

    end

    context 'with RequestStore enabled', :request_store do
      it 'whitelist some `GIT_*` variables and stores them using RequestStore' 

    end
  end

  describe ".all" do
    context 'with RequestStore enabled', :request_store do
      before do
        described_class.set(
          gl_repository,
          GIT_OBJECT_DIRECTORY_RELATIVE: 'foo',
          GIT_ALTERNATE_OBJECT_DIRECTORIES_RELATIVE: ['bar'])
      end

      it 'returns an env hash' 

    end
  end

  describe ".to_env_hash" do
    context 'with RequestStore enabled', :request_store do
      using RSpec::Parameterized::TableSyntax

      let(:key) { 'GIT_OBJECT_DIRECTORY_RELATIVE' }
      subject { described_class.to_env_hash(gl_repository) }

      where(:input, :output) do
        nil         | nil
        'foo'       | 'foo'
        []          | ''
        ['foo']     | 'foo'
        %w[foo bar] | 'foo:bar'
      end

      with_them do
        before do
          described_class.set(gl_repository, key.to_sym => input)
        end

        it 'puts the right value in the hash' 

      end
    end
  end

  describe 'thread-safety' do
    context 'with RequestStore enabled', :request_store do
      before do
        allow(RequestStore).to receive(:active?).and_return(true)
        described_class.set(gl_repository, GIT_OBJECT_DIRECTORY_RELATIVE: 'foo')
      end

      it 'is thread-safe' 

    end
  end
end

