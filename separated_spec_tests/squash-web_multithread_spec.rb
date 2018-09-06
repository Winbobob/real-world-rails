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

RSpec.describe Multithread::PriorityQueue do
  before(:each) { @queue = Multithread::PriorityQueue.new(50, 10) }

  describe "#deq" do
    it "should deq items from the queue in priority order" 


    it "should raise if the queue is empty" 

  end

  describe "#enq" do
    it "should let low-priority jobs fall off if saturated" 


    it "should not enqueue multiple copies of the same job" 

  end
end

