require 'rails_helper'
require 'discourse_plugin_registry'

describe DiscoursePluginRegistry do

  class TestRegistry < DiscoursePluginRegistry; end

  let(:registry) { TestRegistry }
  let(:registry_instance) { registry.new }

  context '#stylesheets' do
    it 'defaults to an empty Set' 

  end

  context '#mobile_stylesheets' do
    it 'defaults to an empty Set' 

  end

  context '#javascripts' do
    it 'defaults to an empty Set' 

  end

  context '#auth_providers' do
    it 'defaults to an empty Set' 

  end

  context '#admin_javascripts' do
    it 'defaults to an empty Set' 

  end

  context '#seed_data' do
    it 'defaults to an empty Set' 

  end

  context '.register_html_builder' do
    it "can register and build html" 


    it "can register multiple builders" 

  end

  context '.register_css' do
    before do
      registry_instance.register_css('hello.css')
    end

    it 'is not leaking' 


    it 'is returned by DiscoursePluginRegistry.stylesheets' 


    it "won't add the same file twice" 

  end

  context '.register_js' do
    before do
      registry_instance.register_js('hello.js')
    end

    it 'is returned by DiscoursePluginRegistry.javascripts' 


    it "won't add the same file twice" 

  end

  context '.register_auth_provider' do
    let(:registry) { DiscoursePluginRegistry }
    let(:auth_provider) do
      provider = Auth::AuthProvider.new
      provider.authenticator = Auth::Authenticator.new
      provider
    end

    before do
      registry.register_auth_provider(auth_provider)
    end

    after do
      registry.reset!
    end

    it 'is returned by DiscoursePluginRegistry.auth_providers' 


  end

  context '.register_service_worker' do
    let(:registry) { DiscoursePluginRegistry }

    before do
      registry.register_service_worker('hello.js')
    end

    after do
      registry.reset!
    end

    it "should register the file once" 

  end

  context '.register_archetype' do
    it "delegates archetypes to the Archetype component" 

  end

  context '#register_asset' do
    let(:registry) { DiscoursePluginRegistry }

    after do
      registry.reset!
    end

    it "does register general css properly" 


    it "registers desktop css properly" 


    it "registers mobile css properly" 


    it "registers desktop css properly" 


    it "registers sass variable properly" 


    it "registers admin javascript properly" 


    it "registers vendored_core_pretty_text properly" 

  end

  context '#register_seed_data' do
    let(:registry) { DiscoursePluginRegistry }

    after do
      registry.reset!
    end

    it "registers seed data properly" 

  end

end

