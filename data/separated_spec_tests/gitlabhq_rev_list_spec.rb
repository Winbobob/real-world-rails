require 'spec_helper'

describe Gitlab::Git::RevList do
  let(:repository) { create(:project, :repository).repository.raw }
  let(:rev_list) { described_class.new(repository, newrev: 'newrev') }

  def args_for_popen(args_list)
    [Gitlab.config.git.bin_path, 'rev-list', *args_list]
  end

  def stub_popen_rev_list(*additional_args, with_lazy_block: true, output:)
    params = [
      args_for_popen(additional_args),
      repository.path,
      {},
      hash_including(lazy_block: with_lazy_block ? anything : nil)
    ]

    expect(repository).to receive(:popen).with(*params) do |*_, lazy_block:|
      output = lazy_block.call(output.lines.lazy.map(&:chomp)) if with_lazy_block

      [output, 0]
    end
  end

  context "#new_refs" do
    it 'calls out to `popen`' 

  end

  context '#new_objects' do
    it 'fetches list of newly pushed objects using rev-list' 


    it 'can skip pathless objects' 


    it 'can handle non utf-8 paths' 


    it 'can yield a lazy enumerator' 


    it 'returns the result of the block when given' 


    it 'can accept list of references to exclude' 


    it 'handles empty list of references to exclude as listing all known objects' 

  end

  context '#all_objects' do
    it 'fetches list of all pushed objects using rev-list' 

  end

  context "#missed_ref" do
    let(:rev_list) { described_class.new(repository, oldrev: 'oldrev', newrev: 'newrev') }

    it 'calls out to `popen`' 

  end
end

