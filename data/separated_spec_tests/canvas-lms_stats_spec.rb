#
# Copyright (C) 2011 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
require 'lib/stats'

describe Stats do
  context Stats::Counter do
    def check_stats_with_matchers(c, empty, size, max, min, sum, mean, var, stddev, histogram)
      expect(c.empty?).to empty
      expect(c.size).to size
      expect(c.count).to size
      expect(c.max).to max
      expect(c.min).to min
      expect(c.sum).to sum
      expect(c.total).to sum
      expect(c.mean).to mean
      expect(c.avg).to mean
      expect(c.var).to var
      expect(c.variance).to var
      expect(c.stddev).to stddev
      expect(c.standard_deviation).to stddev
      expect(c.histogram).to histogram
    end

    def check_stats(c, size, max, min, sum, mean, var, histogram)
      check_stats_with_matchers c,
                                (size > 0 ? be_falsey : be_truthy),
                                eql(size),
                                eql(max),
                                eql(min),
                                eql(sum),
                                be_within(0.0000000001).of(mean),
                                be_within(0.0000000001).of(var),
                                be_within(0.0000000001).of(Math::sqrt(var)),
                                eql(histogram)
    end

    it "should be able to initialize with an array" 

    
    it "should return some basic statistics" 


    it "should determine standard deviation" 


    it "should return the right things with no values" 


    it "should support .each, .<<, and .push" 

    
    it "should put negative numbers in the proper bin in histograms" 

    
    it "should work with strange bin widths in histogram" 

    
    it "should work with strange bin bases in histogram" 

    
    it "should return quarties properly" 

    
    it "should return nils for quartiles when there is no data" 

    
    it "should return a single number for quartiles if that is the only thing in the data" 

    
    it "should return properly for a dataset of length 3" 


    it "should return properly for a dataset of length 2" 

    
    
  end
end

