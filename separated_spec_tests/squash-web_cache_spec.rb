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

RSpec.describe Blamer::Cache do
  describe "#blame" do
    before(:all) { @project = FactoryGirl.create(:project) }
    before(:each) { Blame.delete_all }

    it "should return a cached blame result if available" 


    it "should fall back to a Git blame operation otherwise" 


    it "should write the result of the operation for a cache miss" 


    it "should update a Blame's updated_at for a cache hit" 


    it "should drop the least recently used Blame when the cache is full" 

  end
end

