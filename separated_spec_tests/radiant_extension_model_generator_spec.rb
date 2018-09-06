require File.dirname(__FILE__) + "/extension_generators_spec_helper"

describe "ExtensionModelGenerator with normal options" do
  include GeneratorSpecHelperMethods
  it_should_behave_like "all generators"
  it_should_behave_like "all extension generators"
  
  before(:each) do
    FileUtils.cp_r File.join(BASE_ROOT, 'lib/generators/extension_model'), File.join(RADIANT_ROOT, 'vendor/generators')
    run_generator('extension_model', %w(example Event))
  end
  
  it 'should generate the migration file in the correct location' 

  
  it 'should generate the model file in the correct location' 

  
  it 'should generate the model spec file in the correct location' 

  
  after(:each) do
    extension_dir = File.join(RADIANT_ROOT, 'vendor/extensions/example')
    FileUtils.rm_rf Dir["#{extension_dir}/db/migrate/*"]
    FileUtils.rm_rf Dir["#{extension_dir}/app/models/*"]
    FileUtils.rm_rf Dir["#{extension_dir}/spec/models/*"]
    FileUtils.rm_rf Dir["#{RADIANT_ROOT}/vendor/generators/*"]
  end
end

describe "ExtensionModelGenerator with test unit" do
  include GeneratorSpecHelperMethods
  it_should_behave_like "all generators"
  it_should_behave_like "all extension generators"
  
  before(:each) do
    FileUtils.cp_r File.join(BASE_ROOT, 'lib/generators/extension_model'), File.join(RADIANT_ROOT, 'vendor/generators')
    run_generator('extension_model', %w(example Event --with-test-unit))
  end
  
  it 'should generate the migration file in the correct location' 

  
  it 'should generate the model file in the correct location' 

  
  it 'should generate the unit test file in the correct location' 

  
  after(:each) do
    extension_dir = File.join(RADIANT_ROOT, 'vendor/extensions/example')
    FileUtils.rm_rf Dir["#{extension_dir}/db/migrate/*"]
    FileUtils.rm_rf Dir["#{extension_dir}/app/models/*"]
    FileUtils.rm_rf Dir["#{extension_dir}/test/*"]
    FileUtils.rm_rf Dir["#{RADIANT_ROOT}/vendor/generators/*"]
  end
end

