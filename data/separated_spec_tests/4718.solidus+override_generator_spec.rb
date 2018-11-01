# frozen_string_literal: true

require 'spec_helper'
require 'generator_spec'
require 'generators/solidus/views/override_generator'

RSpec.describe Solidus::Views::OverrideGenerator, type: :generator do
  destination Rails.root.join('app', 'views', 'spree')

  before(:all) do
    prepare_destination
  end

  subject! do
    run_generator arguments
  end

  let(:src) do
    Spree::Frontend::Engine.root.join('app', 'views', 'spree')
  end

  let(:dest) do
    Rails.root.join('app', 'views', 'spree')
  end

  context 'without any arguments' do
    let(:arguments) { %w() }

    it 'copies all views into the host app' 

  end

  context 'when "products" is passed as --only argument' do
    let(:arguments) { %w(--only products) }

    context 'as folder' do
      it 'exclusively copies views whose name contains "products"' 

    end
  end

  after do
    FileUtils.rm_rf destination_root
  end
end

