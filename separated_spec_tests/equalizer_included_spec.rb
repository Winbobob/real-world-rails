# encoding: utf-8

require 'spec_helper'

describe Equalizer, '#included' do
  subject { descendant.instance_exec(object) { |mod| include mod } }

  let(:object)     { described_class.new        }
  let(:descendant) { Class.new                  }
  let(:superclass) { described_class.superclass }

  before do
    # Prevent Module.included from being called through inheritance
    allow(described_class::Methods).to receive(:included)
  end

  around do |example|
    # Restore included method after each example
    superclass.class_eval do
      alias_method :original_included, :included
      example.call
      undef_method :included
      alias_method :included, :original_included
    end
  end

  it 'delegates to the superclass #included method' 


  it 'includes methods into the descendant' 

end

