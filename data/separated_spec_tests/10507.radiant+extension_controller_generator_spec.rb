require File.dirname(__FILE__) + "/extension_generators_spec_helper"

describe "ExtensionControllerGenerator with normal options" do
  include GeneratorSpecHelperMethods
  it_should_behave_like "all generators"
  it_should_behave_like "all extension generators"

  before(:each) do
    FileUtils.mkdir_p(File.join(RADIANT_ROOT, 'vendor/generators'))
    FileUtils.cp_r File.join(BASE_ROOT, 'lib/generators/extension_controller'), File.join(RADIANT_ROOT, 'vendor/generators')
    run_generator('extension_controller', %w(example Events show new index))
  end

  it 'should generate the controller file in the correct location' 


  it 'should generate the controller spec file in the correct location' 


  it 'should generate the helper file in the correct location' 


  it 'should generate the helper spec file in the correct location' 


  it 'should generate the view files in the correct location' 


  it 'should generate the view spec files in the correct location' 


  after(:each) do
    extension_dir = File.join(RADIANT_ROOT, 'vendor/extensions/example')
    FileUtils.rm_rf Dir["#{extension_dir}/app/controllers/*"]
    FileUtils.rm_rf Dir["#{extension_dir}/app/helpers/*"]
    FileUtils.rm_rf Dir["#{extension_dir}/app/views/*"]
    FileUtils.rm_rf Dir["#{extension_dir}/spec/controllers/*"]
    FileUtils.rm_rf Dir["#{extension_dir}/spec/helpers/*"]
    FileUtils.rm_rf Dir["#{extension_dir}/spec/views/*"]
    FileUtils.rm_rf Dir["#{RADIANT_ROOT}/vendor/generators/*"]
  end
end

describe "ExtensionControllerGenerator with test unit" do
  include GeneratorSpecHelperMethods
  it_should_behave_like "all generators"
  it_should_behave_like "all extension generators"

  before(:each) do
    FileUtils.cp_r File.join(BASE_ROOT, 'lib/generators/extension_controller'), File.join(RADIANT_ROOT, 'vendor/generators')
    run_generator('extension_controller', %w(example Events show new index --with-test-unit))
  end

  it 'should generate the controller file in the correct location' 


  it 'should generate the controller spec file in the correct location' 


  it 'should generate the helper file in the correct location' 


  it 'should generate the view files in the correct location' 


  after(:each) do
    extension_dir = File.join(RADIANT_ROOT, 'vendor/extensions/example')
    FileUtils.rm_rf Dir["#{extension_dir}/app/controllers/*"]
    FileUtils.rm_rf Dir["#{extension_dir}/app/helpers/*"]
    FileUtils.rm_rf Dir["#{extension_dir}/app/views/*"]
    FileUtils.rm_rf Dir["#{extension_dir}/test/*"]
    FileUtils.rm_rf Dir["#{RADIANT_ROOT}/vendor/generators/*"]
  end
end

