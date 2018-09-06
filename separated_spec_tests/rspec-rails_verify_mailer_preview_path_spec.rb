require 'rails_helper'
require 'rspec/rails/feature_check'

RSpec.describe 'Action Mailer railtie hook' do
  CaptureExec = Struct.new(:io, :exit_status) do
    def ==(str)
      io == str
    end
  end

  def as_commandline(ops)
    cmd, ops = ops.reverse
    ops ||= {}
    cmd_parts = ops.map { |k, v| "#{k}=#{v}" } << cmd << '2>&1'
    cmd_parts.join(' ')
  end

  def capture_exec(*ops)
    io = if RUBY_VERSION.to_f < 1.9
           IO.popen(as_commandline(ops))
         else
           ops << { :err => [:child, :out] }
           IO.popen(ops)
         end
    # Necessary to ignore warnings from Rails code base
    out =  io.readlines.
              reject { |line| line =~ /warning: circular argument reference/ }.
              join.
              chomp
    CaptureExec.new(out, $?.exitstatus)
  end

  def have_no_preview
    have_attributes(:io => be_blank, :exit_status => 0)
  end

  let(:exec_script) {
    File.expand_path(File.join(__FILE__, '../support/default_preview_path'))
  }

  if RSpec::Rails::FeatureCheck.has_action_mailer_show_preview?
    context 'in the development environment' do
      let(:custom_env) { { 'RAILS_ENV' => rails_env } }
      let(:rails_env) { 'development' }

      it 'sets the preview path to the default rspec path' 


      it 'respects the setting from `show_previews`' 


      it 'respects a custom `preview_path`' 


      it 'allows initializers to set options' 


      it 'handles action mailer not being available' 

    end

    context 'in a non-development environment' do
      let(:custom_env) { { 'RAILS_ENV' => rails_env } }
      let(:rails_env) { 'test' }

      it 'does not set the preview path by default' 


      it 'respects the setting from `show_previews`' 


      it 'allows initializers to set options' 


      it 'handles action mailer not being available' 

    end
  elsif RSpec::Rails::FeatureCheck.has_action_mailer_preview?
    context 'in the development environment', 'without `show_previews`' do
      let(:custom_env) { { 'RAILS_ENV' => rails_env } }
      let(:rails_env) { 'development' }

      it 'sets the preview path to the default rspec path' 


      it 'respects a custom `preview_path`' 


      it 'allows initializers to set options' 


      it 'handles action mailer not being available' 

    end

    context 'in a non-development environment', 'without `show_previews`' do
      let(:custom_env) { { 'RAILS_ENV' => rails_env } }
      let(:rails_env) { 'test' }

      it 'does not set the preview path by default' 


      it 'respects a custom `preview_path`' 


      it 'handles action mailer not being available' 

    end
  else
    context 'in the development environment' do
      let(:custom_env) { { 'RAILS_ENV' => rails_env } }
      let(:rails_env) { 'development' }

      it 'handles no action mailer preview' 


      it 'allows initializers to set options' 


      it 'handles action mailer not being available' 

    end

    context 'in a non-development environment' do
      let(:custom_env) { { 'RAILS_ENV' => rails_env } }
      let(:rails_env) { 'test' }

      it 'handles no action mailer preview' 


      it 'allows initializers to set options' 


      it 'handles action mailer not being available' 

    end
  end
end

