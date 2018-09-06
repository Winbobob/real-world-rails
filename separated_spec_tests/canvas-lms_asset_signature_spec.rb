#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path('../spec_helper', File.dirname(__FILE__))

class SomeModel < Struct.new(:id); end

describe AssetSignature do
  def example_encode(classname, id)
    Canvas::Security.hmac_sha1("#{classname}#{id}")[0,8]
  end

  describe '.generate' do
    it 'produces a combination of id and hmac to use as a url signature' 


    it 'produces a different hmac for each asset id' 


    it 'produces a difference hmac for each asset class' 


  end

  describe '.find_by_signature' do

    it 'finds the model if the hmac matches' 


    it 'returns nil if the signature does not check out' 

  end
end


