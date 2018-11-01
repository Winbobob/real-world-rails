require "spec_helper"

describe "Fog mocking" do
  before do
    @fog_was_mocked = Fog.mock?
    Fog.unmock! if @fog_was_mocked
  end

  after do
    Fog.mock! if @fog_was_mocked
  end

  describe "Fog.mock!" do
    it "Fog.mock! returns true" 


    it "Fog.mock? without Fog.mock! returns false" 


    it "Fog.mock? with Fog.mock!" 


    it "Fog.mocking? without Fog.mock!" 


    it "Fog.mocking? with Fog.mock!" 

  end

  describe "Fog::Mock.delay" do
    it "Fog::Mock.delay defaults to 0" 


    it "handles reassignment" 


    it "raises when given an illegal delay" 

  end

  describe "Fog::Mock.random_ip" do
    it "defaults to ipv4" 


    it "supports explicit request for v4" 


    it "supports explicit request for v6" 


    it "raises when supplied an illegal IP version" 

  end

  describe "Fog::Mock.not_implemented" do
    it "raises MockNotImplemented when called" 

  end
end

