require File.dirname(__FILE__) + '/../../spec_helper'

describe 'API:provider_hierarchies' do
  before(:all) do
    @test_hierarchy = Hierarchy.gen(label: 'Some test hierarchy', browsable: 1)
  end

  # not logging API anymore!
  # it 'should create an API log including API key' do
    # user = User.gen(api_key: User.generate_key)
    # check_api_key("/api/provider_hierarchies?key=#{user.api_key}", user)
  # end

  it 'provider_hierarchies should return a list of all providers' 

end

