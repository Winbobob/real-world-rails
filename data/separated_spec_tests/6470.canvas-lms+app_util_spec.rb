#
# Copyright (C) 2016 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Lti::AppUtil do

  describe ".custom_params" do

    let(:raw_post) {
      'external_tool%5Bname%5D=IMS+Cert+Tool&external_tool%5Bprivacy_level%5D=name_only'\
        '&external_tool%5Bconsumer_key%5D=29f0c0ad-0cff-433f-8e35-797bd34710ea&external_tool'\
        '%5Bcustom_fields%5Bsimple_key%5D%5D=custom_simple_value&external_tool%5Bcustom_fields'\
        '%5Bcert_userid%5D%5D=%24User.id&external_tool%5Bcustom_fields%5BComplex!%40%23%24%5E*()'\
        '%7B%7D%5B%5DKEY%5D%5D=Complex!%40%23%24%5E*%3B()%7B%7D%5B%5D%C2%BDValue&external_tool'\
        '%5Bcustom_fields%5Bcert_username%5D%5D=%24User.username&external_tool%5Bcustom_fields'\
        '%5Btc_profile_url%5D%5D=%24ToolConsumerProfile.url&external_tool%5Bdomain%5D=null&'\
        'external_tool%5Burl%5D=https%3A%2F%2Fwww.imsglobal.org%2Flti%2Fcert%2Ftc_tool.php%3F'\
        'x%3DWith%2520Space%26y%3Dyes&external_tool%5Bdescription%5D=null'
    }

    it "parses a raw post and returns custom params in key/value pairs" 


    it "parses complex key/values correctly" 


  end

  describe ".display_template" do
    it "renders the default template if the type is invalid" 


    it "renders the specified display_type if the type is valid" 


    it "renders the display_override if provided" 

  end

  describe '.allowed?' do
    it 'allows candidate if white- and blacklists are nil' 


    it 'allows candidate if white- and blacklists are empty' 


    it 'allows candidate if present in whitelist and not in blacklist' 


    it 'disallows candidate if present in blacklist and not in whitelist' 


    it 'disallows candidate if present in white- and blacklist' 


    it 'disallows candidate if whitelist empty and blacklist wildcarded' 


    it 'disallows candidate if whitelist empty and is present blacklist' 


    it 'disallows candidate if absent from both white- and blacklists' 


    it 'disallows candidate if absent from whitelist and blacklist is empty' 


    it 'allows candidate if present in multi-valued whitelist and not present in multi-valued blacklist' 


    it 'disallows candidate if present in multi-valued blacklist and not present in multi-valued whitelist' 

  end
end

