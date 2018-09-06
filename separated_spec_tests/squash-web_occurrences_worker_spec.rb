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

THIS_FILE = Pathname.new(__FILE__).relative_path_from(Rails.root).to_s

RSpec.describe OccurrencesWorker do
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
        {"file"   => "lib/better_caller/extensions.rb",
         "line"   => 11,
         "symbol" => "set_better_backtrace"},
        {"file"   => "lib/better_caller/extensions.rb",
         "line"   => 4,
         "symbol" => "set_better_backtrace"},
        {"file"   => "lib/better_caller/extensions.rb",
         "line"   => 2,
         "symbol" => nil}
    ]
  end

  before :each do
    Bug.delete_all
    @params = Squash::Ruby.send(:exception_info_hash, @exception, Time.now, {}, nil)
    @params.merge!('api_key'     => @project.api_key,
                   'environment' => 'production',
                   'revision'    => @commit.sha,
                   'user_data'   => {'foo' => 'bar'})
  end

  describe "#initialize" do
    OccurrencesWorker::REQUIRED_KEYS.each do |key|
      it "should require the #{key} key" 

    end

    it "should raise an error if the API key is invalid" 


    it "should create a new environment if one doesn't exist with that name" 

  end

  describe "#perform" do
    it "attempt to git-fetch if the revision doesn't exist, then skip it if the revision STILL doesn't exist" 


    context "[finding Deploys and revisions]" do
      it "should associate a Deploy if given a build" 


      it "should create a new Deploy if one doesn't exist and a revision is given" 


      it "should raise an error if the Deploy doesn't exist and no revision is given" 

    end

    context "[attributes]" do
      it "works for js:hosted types" 


      it "should create an occurrence with the given attributes" 


      context "[PII filtering]" do
        it "should filter emails from the occurrence message" 


        it "should filter phone numbers from the occurrence message" 


        it "should filter credit card numbers from the occurrence message" 


        it "should filter bank account numbers from the occurrence message" 


        it "should not perform filtering if filtering is disabled" 


        it "should filter PII from the query" 


        it "should filter PII from the fragment" 


        it "should filter PII from the parent_exceptions' messages and instance variables" 


        it "should filter PII from the session" 


        it "should filter PII from the headers" 


        it "should filter PII from the flash" 


        it "should filter PII from the params" 


        it "should filter PII from the cookies" 


        it "should filter PII from the ivars" 

      end

      it "should stick any attributes it doesn't recognize into the metadata attribute" 


      it "should set user agent variables when a user agent is specified" 


      it "should remove the SQL query from a SQL error message" 

    end

    context "[blame]" do
      it "should set the bug's blamed_revision when there's blame to be had" 


      it "should match an existing bug by file, line, and class name if no blame is available" 


      it "should match an existing bug by file, line, class name, and commit when there's blame to be had" 


      it "should truncate the error message if it exceeds 1,000 characters" 


      it "should use the full SHA1 of a revision if an abbreviated revision is specified" 

    end

    context "[distributed projects]" do
      it "should create a new bug if the occurrence is associated with a different deploy" 

    end

    context "[hosted projects]" do
      it "should reopen a bug only at the proper times" 


      it "should reopen an existing bug that is fixed, not deployed, and stale" 


      it "should set a cause for a bug being reopened" 

    end
  end
end

