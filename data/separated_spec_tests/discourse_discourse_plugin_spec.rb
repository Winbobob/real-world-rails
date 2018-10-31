require 'rails_helper'
require_dependency 'discourse_plugin'

describe DiscoursePlugin do

  class TestPlugin < DiscoursePlugin
    module SomeModule
    end

    module TestMixin
    end
  end

  let(:registry) { mock }
  let(:plugin) { TestPlugin.new(registry) }

  describe ".mixins" do
    it "finds its mixins" 

  end

  it "delegates adding js to the registry" 


  it "delegates adding css to the registry" 


  it "delegates creating archetypes" 


  context 'registering for callbacks' do
    before do
      plugin.stubs(:hello)
      @proc = plugin.listen_for(:hello).first
    end

    after do
      DiscourseEvent.off(:hello, &@proc)
    end

    it "calls the method when it is triggered" 


  end

end

