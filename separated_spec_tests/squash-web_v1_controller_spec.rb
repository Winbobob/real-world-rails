# Copyright 2014 Square Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

require 'rails_helper'

RSpec.describe Api::V1Controller, type: :controller do
  describe "#notify" do
    before :all do
      Project.where(repository_url: 'https://github.com/RISCfuture/better_caller.git').delete_all
      @project   = FactoryGirl.create(:project, repository_url: 'https://github.com/RISCfuture/better_caller.git')
      @commit    = @project.repo.object('HEAD^')

      # this will be a valid exception but with a stack trace that doesn't make
      # sense in the context of the project (the files don't actually exist in the
      # repo). this will test the scenarios where no blamed commits can be found.
      @exception = nil
      begin
        raise ArgumentError, "Well crap"
      rescue
        @exception = $!
      end
      @line        = @exception.backtrace.first.split(':')[1].to_i # get the line number of the first line of the backtrace

      # this is a valid stack trace in the context of the repo, and will produce
      # valid blamed commits.
      @valid_trace = [
          ["lib/better_caller/extensions.rb", 11, 'set_better_backtrace'],
          ["lib/better_caller/extensions.rb", 4, 'set_better_backtrace'],
          ["lib/better_caller/extensions.rb", 2, nil]
      ]
    end

    before :each do
      Bug.delete_all
      @valid_params                = Squash::Ruby.send(:exception_info_hash, @exception, Time.now.utc, {}, nil).deep_clone
      @valid_params['occurred_at'] = @valid_params['occurred_at'].iso8601
      @valid_params.merge!('api_key'     => @project.api_key,
                           'environment' => 'production',
                           'revision'    => @commit.sha,
                           'user_data'   => {'foo' => 'bar'})
    end

    it "should return 403 given an invalid API key" 


    it "should return 422 given invalid parameters" 


    it "should start a worker thread and return 200 given valid parameters" 

  end

  describe "#deploy" do
    before :all do
      Project.where(repository_url: 'https://github.com/RISCfuture/better_caller.git').delete_all
      @project = FactoryGirl.create(:project, repository_url: 'https://github.com/RISCfuture/better_caller.git')
    end

    before :each do
      @env    = FactoryGirl.create(:environment, project: @project)
      @params = {
          'project'     => {'api_key' => @env.project.api_key},
          'environment' => {'name' => @env.name},
          'deploy'      => {
              'deployed_at' => (@time = Time.now.utc).iso8601,
              'revision'    => (@rev = @project.repo.object('HEAD').sha),
              'hostname'    => 'myhost.local'
          }
      }
    end

    %w( project environment deploy ).each do |key|
      it "should require the #{key} key" 

    end

    it "should return 403 if the API key is invalid" 


    it "should create a new environment if one doesn't exist with that name" 


    it "should create a deploy with the given parameters" 

  end

  describe "#symbolication" do
    it "should return 422 if the symbolication param is not provided" 


    it "should create a new symbolication" 

  end

  describe "#sourcemap" do
    before :all do
      Project.where(repository_url: 'https://github.com/RISCfuture/better_caller.git').delete_all
      @project = FactoryGirl.create(:project, repository_url: 'https://github.com/RISCfuture/better_caller.git')
    end

    before :each do
      @env    = FactoryGirl.create(:environment, project: @project)
      @map    = FactoryGirl.build(:source_map)
      @params = {
          'sourcemap'   => @map.send(:read_attribute, :map),
          'api_key'     => @project.api_key,
          'environment' => @env.name,
          'revision'    => (@rev = @project.repo.object('HEAD').sha),
          'from'        => 'hosted',
          'to'          => 'original'
      }
    end

    %w( sourcemap api_key environment revision ).each do |key|
      it "should require the #{key} key" 

    end

    it "should return 403 if the API key is invalid" 


    it "should create a new environment if one doesn't exist with that name" 


    it "should create a sourcemap with the given parameters" 

  end

  describe "#deobfuscation" do
    before :all do
      Project.where(repository_url: 'https://github.com/RISCfuture/better_caller.git').delete_all
      @project = FactoryGirl.create(:project, repository_url: 'https://github.com/RISCfuture/better_caller.git')
    end

    before :each do
      @env     = FactoryGirl.create(:environment, project: @project)
      @release = FactoryGirl.create(:release, environment: @env)
      @ns      = FactoryGirl.build(:obfuscation_map)
      @params  = {
          'namespace'   => @ns.send(:read_attribute, :namespace),
          'api_key'     => @project.api_key,
          'environment' => @env.name,
          'build'       => @release.build
      }
    end

    %w( namespace api_key environment build ).each do |key|
      it "should require the #{key} key" 

    end

    it "should return 403 if the API key is invalid" 


    it "should return 404 if the environment name is unknown" 


    it "should return 404 if the build number is unknown" 


    it "should create an obfuscation map with the given parameters" 

  end
end

