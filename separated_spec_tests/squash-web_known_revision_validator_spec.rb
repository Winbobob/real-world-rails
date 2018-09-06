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

RSpec.describe KnownRevisionValidator do
  before :all do
    env    = FactoryGirl.create(:environment)
    @model = FactoryGirl.build(:deploy, environment: env)
  end

  it "should not accept unknown revisions" 


  it "should accept known revisions" 


  it "should normalize known revisions" 


  context "[:repo option]" do
    before :each do
      @model  = double('Model', :foo= => nil)
      @commit = double('Git::Object::Commit', sha: '2dc20c984283bede1f45863b8f3b4dd9b5b554cc')
    end

    it "should accept repository objects" 


    it "should accept method names" 


    it "should accept procs" 

  end
end

