require 'spec_helper'

set :backend, :cmd

set :os, :family => 'windows'

describe service('Test Service') do
  it { should be_enabled }
end

describe service('Test Service') do
  it { should be_running }
end

describe service('service') do
  it { should be_installed }
end

describe service('service') do
  it { should have_start_mode 'mode' }
end

describe service('Test service') do
  it "should raise error if trying to check service process controller" 
  it "should raise error if trying to check service monitoring" 

end

describe file('Gemfile') do
  it { should contain('rspec').after(/^group :test do/) }
end

describe file('Gemfile') do
  it { should contain('rspec').before(/end/) }
end

describe file('/some/file') do
  it { should be_readable }
end

describe file('/some/file') do
  it "should raise error if trying to check access by 'owner' or 'group' or 'others'" 
  it "should raise error if trying to check access by 'owner' or 'group' or 'others'" 
  it "should raise error if trying to check access by 'owner' or 'group' or 'others'" 
  it "should raise error if command is not implemented" 


  it "should raise error if command is not defined" 

end








