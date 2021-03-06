require "spec_helper"
require 'refinery/cli'
require "rake"

describe "CLI" do
  let(:rake) { Rake::Application.new }

  before do
    Rake.application = rake
    load File.expand_path("../../../../lib/tasks/refinery.rake", __FILE__)
    Rake::Task.define_task(:environment)
  end

  context "rake refinery:override:list" do
    it "shows info message" 

  end

  context "when called with no args" do
    it "shows info message" 

  end

  shared_examples "refinery:override" do
    context "specified file doesn't exist" do
      after { ENV.delete(env) }

      it "shows message" 

    end

    context "specified file exist" do
      let(:file_name) do
        Dir.entries(file_location).reject { |e| e =~ %r{^\.+} || e !~ %r{\..+} }.first
      end

      after do
        FileUtils.rm_f(Rails.root.join(copied_file_location))
        ENV.delete(env)
      end

      it "copies file to app folder" 

    end
  end

  describe "overriding views" do
    it_behaves_like "refinery:override" do
      let(:env) { "view" }
      let(:not_found_message) { "Couldn't match any view template files in any extensions like non-existent\n" }
      let(:spec_success_message) { %W(create app/views/refinery/#{file_name}) }
      let!(:file_location) { File.expand_path("../../../../app/views/refinery", __FILE__) }
      let(:env_file_location) { "refinery/#{file_name.sub(%r{\..+}, "")}" }
      let(:copied_file_location) { "app/views/refinery/#{file_name}" }
    end
  end

  describe "overriding controllers" do
    it_behaves_like "refinery:override" do
      let(:env) { "controller" }
      let(:not_found_message) { "Couldn't match any controller files in any extensions like non-existent\n" }
      let(:spec_success_message) { %W(create app/controllers/refinery/#{file_name}) }
      let!(:file_location) { File.expand_path("../../../../app/controllers/refinery", __FILE__) }
      let(:env_file_location) { "refinery/#{file_name.sub(%r{\..+}, "")}" }
      let(:copied_file_location) { "app/controllers/refinery/#{file_name}" }
    end
  end

  describe "overriding models" do
    it_behaves_like "refinery:override" do
      let(:env) { "model" }
      let(:not_found_message) { "Couldn't match any model files in any extensions like non-existent\n" }
      let(:spec_success_message) { %W(create app/models/refinery/core/#{file_name}) }
      let!(:file_location) { File.expand_path("../../../../app/models/refinery/core", __FILE__) }
      let(:env_file_location) { "refinery/core/#{file_name.sub(%r{\..+}, "")}" }
      let(:copied_file_location) { "app/models/refinery/core/#{file_name}" }
    end
  end

  describe "overriding helpers" do
    it_behaves_like "refinery:override" do
      let(:env) { "helper" }
      let(:not_found_message) { "Couldn't match any helper files in any extensions like non-existent\n" }
      let(:spec_success_message) { %W(create app/helpers/refinery/#{file_name}) }
      let!(:file_location) { File.expand_path("../../../../app/helpers/refinery", __FILE__) }
      let(:env_file_location) { "refinery/#{file_name.sub(%r{\..+}, "")}" }
      let(:copied_file_location) { "app/helpers/refinery/#{file_name}" }
    end
  end

  describe "overriding javascripts" do
    it_behaves_like "refinery:override" do
      let(:env) { "javascript" }
      let(:not_found_message) { "Couldn't match any javascript files in any extensions like non-existent\n" }
      let(:spec_success_message) { %W(create app/assets/javascripts/refinery/#{file_name}) }
      let!(:file_location) { File.expand_path("../../../../app/assets/javascripts/refinery", __FILE__) }
      let(:env_file_location) { "refinery/#{file_name.sub(%r{\..+}, "")}" }
      let(:copied_file_location) { "app/assets/javascripts/refinery/#{file_name}" }
    end
  end

  describe "overriding stylesheets" do
    it_behaves_like "refinery:override" do
      let(:env) { "stylesheet" }
      let(:not_found_message) { "Couldn't match any stylesheet files in any extensions like non-existent\n" }
      let(:spec_success_message) { %W(create app/assets/stylesheets/refinery/#{file_name}) }
      let!(:file_location) { File.expand_path("../../../../app/assets/stylesheets/refinery", __FILE__) }
      let(:env_file_location) { "refinery/#{file_name.sub(%r{\..+}, "")}" }
      let(:copied_file_location) { "app/assets/stylesheets/refinery/#{file_name}" }
    end
  end

  private

  # From episode 029 of Ruby Tapas by Avdi
  # https://rubytapas.dpdcart.com/subscriber/post?id=88
  def capture(stream=STDOUT, &block)
    old_stdout = stream.clone
    pipe_r, pipe_w = IO.pipe
    pipe_r.sync    = true
    output         = ""
    reader = Thread.new do
      begin
        loop do
          output << pipe_r.readpartial(1024)
        end
      rescue EOFError
      end
    end
    stream.reopen(pipe_w)
    yield
  ensure
    stream.reopen(old_stdout)
    pipe_w.close
    reader.join
    pipe_r.close
    return output
  end
end

