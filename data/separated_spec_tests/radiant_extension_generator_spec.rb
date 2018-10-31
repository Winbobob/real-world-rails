require File.dirname(__FILE__) + "/extension_generators_spec_helper"

describe "ExtensionGenerator with normal options" do
  include GeneratorSpecHelperMethods
  it_should_behave_like "all generators"

  before(:each) do
    FileUtils.cp_r File.join(BASE_ROOT, 'lib/generators/extension'),  File.join(RADIANT_ROOT, 'vendor/generators')
    git_config = {'user.name' => 'Ext Author', 'user.email' => 'ext@radiantcms.org', 'github.user' => 'extauthor'}
    allow(Git).to receive(:global_config).and_return git_config
    run_generator('extension', %w(Sample))
  end
  
  it "should generate README file" 

  
  it "should generate a Rakefile" 

  
  it "should generate a config/routes.rb file" 

  
  it "should generate extension init file" 

  
  it "should require the module" 


  it "should generate extension Rake tasks file" 


  it "should populate radiant-sample-extension.gemspec with gem info" 

  
  it "should populate radiant-sample-extension.rb with module namespace" 

  
  it "should generate extension lib directory" 


  it "should generate extension controllers directory" 

  
  it "should generate extension helpers directory" 

  
  it "should generate extension models directory" 

  
  it "should generate extension views directory" 

  
  it "should generate extension views directory" 

  
  it "should generate extension controllers spec directory" 

  
  it "should generate extension helpers spec directory" 

  
  it "should generate extension models spec directory" 

  
  it "should generate extension views spec directory" 

  
  it "should generate extension spec helper file" 

  
  it "should generate extension spec opts file" 

  
  it "should generate extension cucumber.yml file" 

  
  it "should generate extension config directory" 

  
  it "should generate extension routes.rb file" 

  
  it "should generate extension locales directory" 

  
  it "should generate extension en.yml file" 

  
  it "should generate extension features support directory" 

  
  it "should generate extension features step_definitions directory" 

  
  after(:each) do
    FileUtils.rm_rf Dir["#{RADIANT_ROOT}/vendor/extensions/*"]
    FileUtils.rm_rf Dir["#{RADIANT_ROOT}/vendor/generators/*"]
  end
end

describe "ExtensionGenerator with test-unit option" do
  include GeneratorSpecHelperMethods
  it_should_behave_like "all generators"
  
  before(:each) do
    allow(Git).to receive(:global_config).and_return({})
    FileUtils.cp_r File.join(BASE_ROOT, 'lib/generators/extension'),  File.join(RADIANT_ROOT, 'vendor/generators')
    run_generator('extension', %w(Sample --with-test-unit))
  end
  
  it "should generate README file" 

  
  it "should generate Rake file" 

  
  it "should generate extension init file" 

  
  it "should require the module" 


  it "should generate extension Rake tasks file" 

  
  it "should generate extension controllers directory" 

  
  it "should generate extension helpers directory" 

  
  it "should generate extension models directory" 

  
  it "should generate extension views directory" 

  
  it "should generate extension views directory" 

  
  it "should generate extension functional test directory" 

  
  it "should generate extension test fixtures directory" 

  
  it "should generate extension test unit directory" 

  
  it "should generate extension test helper file" 

  
  it "should generate extension functional test file" 

  
  after(:each) do
    FileUtils.rm_rf Dir["#{RADIANT_ROOT}/vendor/extensions/*"]
    FileUtils.rm_rf Dir["#{RADIANT_ROOT}/vendor/generators/*"]
  end
end

