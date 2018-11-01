require 'spec_helper'

describe ChefSpec::SoloRunner do
  before do
    allow_any_instance_of(ChefSpec::SoloRunner)
      .to receive(:dry_run?)
      .and_return(true)
  end

  describe '#initialize' do
    let(:windows_caller_stack) do
      [
        "C:/cookbooks/Temp/spec/test_spec.rb:11:in `block (2 levels) in <top (required)>'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/example.rb:114:in `instance_eval'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/example.rb:114:in `block in run'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/example.rb:254:in `with_around_each_hooks'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/example.rb:111:in `run'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/example_group.rb:390:in `block in run_examples'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/example_group.rb:386:in `map'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/example_group.rb:386:in `run_examples'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/example_group.rb:371:in `run'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/command_line.rb:28:in `block (2 levels) in run'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/command_line.rb:28:in `map'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/command_line.rb:28:in `block in run'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/reporter.rb:58:in `report'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/command_line.rb:25:in `run'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/runner.rb:80:in `run'",
        "C:/Ruby193/lib/ruby/gems/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/runner.rb:17:in `block in autorun'",
      ]
    end

    it 'defaults the log level to :warn' 


    it 'sets the log level' 


    it 'defaults the cookbook_path to the calling spec' 


    it 'defaults the cookbook_path to the calling spec when using windows paths' 


    it 'sets the cookbook path' 


    it 'sets the file cache path' 


    it 'sets the Chef::Config' 


    it 'yields a block to set node attributes' 


    context 'default ohai attributes' do
      let(:hash) { described_class.new.node.to_hash }

      it 'sets the default attributes' 

    end

    context 'fauxhai attributes' do
      let(:hash) { described_class.new(platform: 'ubuntu', version: '18.04').node.to_hash }

      it 'sets the attributes from fauxhai' 

    end

    context 'RSpec global configuration' do
      before do
        allow(RSpec.configuration).to receive(:cookbook_path).and_return('./path')
        allow(RSpec.configuration).to receive(:environment_path).and_return('./env-path')
        allow(RSpec.configuration).to receive(:file_cache_path).and_return('./file-cache-path')
        allow(RSpec.configuration).to receive(:log_level).and_return(:fatal)
        allow(RSpec.configuration).to receive(:path).and_return('ohai.json')
        allow(RSpec.configuration).to receive(:platform).and_return('ubuntu')
        allow(RSpec.configuration).to receive(:version).and_return('12.04')
      end

      it 'uses the RSpec values' 

    end
  end

  describe '#node' do
    it 'returns the Chef::Node' 


    it 'defines a #runner method that returns self' 


    it 'allows attributes to be set on the node' 

  end

  describe '#to_s' do
    it 'overrides the default string representation to something readable' 


    it 'is ok when a convergence has not yet taken place' 


    it 'includes the entire run_list' 


    it 'has the run_list only for the last convergence' 

  end
end

