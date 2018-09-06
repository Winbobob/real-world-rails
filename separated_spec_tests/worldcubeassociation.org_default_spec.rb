require 'chefspec'

class ChefSpec::ChefRunner
  def append(recipe)
    runner = Chef::Runner.new(recipe.run_context)
    runner.converge
    self
  end
end

def fake_recipe(run, &block)
  recipe = Chef::Recipe.new("tarsnap_spec", "default", run.run_context)
  recipe.instance_eval(&block)
end

run_options = {
  :step_into => [ 'tarsnap_backup', 'tarsnap_schedule' ]
}

describe 'tarsnap::default' do

  let(:runner) do
    ChefSpec::ChefRunner.new(run_options) do |node|
      node.automatic_attrs['platform'] = 'debian'
      node.automatic_attrs['platform_version'] = '7.0'
      node.set['tarsnap']['install_packages'] = [ 'source_dependency' ]
    end
  end
  let(:chef_run) do
    runner.converge 'tarsnap::default'
  end

  context 'configured to install from source' do
    it "installs the build packages" 

  end

  context 'configured to install a package' do
    context "on FreeBSD" do
      let(:freebsd) do
        ChefSpec::ChefRunner.new(run_options) do |node|
          node.automatic_attrs['platform'] = 'freebsd'
          node.automatic_attrs['platform_version'] = '9.0'
        end
      end
      let(:freebsd_run) do
        freebsd.converge 'tarsnap::default'
      end
      it "installs the package" 

    end
  end

  context "manages a feather.yml configuration" do
    let(:run) do
      recipe = fake_recipe(chef_run) do
        tarsnap_backup 'configs' do
          path [ '/etc' ]
          schedule 'daily'
        end
      end
      chef_run.append(recipe)
    end

    it "creates the correct backup directory configuration" 


    it "includes the default schedule configuration" 

  end

  context "when a key isn't available" do
    it "sets a tarsnap_pending attribute on the node" 

  end

  context "when a key is available" do
    it "clears the tarsnap_pending attribute on the node" 

    it "creates a tarsnap keyfile" 

  end

end

