# frozen_string_literal: true

RSpec.context "when installing a bundle that includes yanked gems" do
  before(:each) do
    build_repo4 do
      build_gem "foo", "9.0.0"
    end
  end

  it "throws an error when the original gem version is yanked" 


  it "throws the original error when only the Gemfile specifies a gem version that doesn't exist" 

end

RSpec.context "when using gem before installing" do
  it "does not suggest the author has yanked the gem" 

end

