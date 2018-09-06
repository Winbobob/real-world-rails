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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe BrandableCSS do
  describe "all_brand_variable_values" do
    it "returns defaults if called without a brand config" 


    it "includes image_url asset path for default images" 


    describe "when called with a brand config" do
      before :once do
        parent_account = Account.default
        parent_config = BrandConfig.create(variables: {"ic-brand-primary" => "red"})

        subaccount_bc = BrandConfig.for(
          variables: {"ic-brand-global-nav-bgd" => "#123"},
          parent_md5: parent_config.md5,
          js_overrides: nil,
          css_overrides: nil,
          mobile_js_overrides: nil,
          mobile_css_overrides: nil
        )
        subaccount_bc.save!
        @brand_variables = BrandableCSS.all_brand_variable_values(subaccount_bc)
      end

      it "includes custom variables from brand config" 


      it "includes custom variables from parent brand config" 


      it "handles named html colors when lightening/darkening" 


      it "includes default variables not found in brand config" 

    end
  end

  describe "all_brand_variable_values_as_js" do
    it "eports the default js to the right global variable" 

  end

  describe "all_brand_variable_values_as_css" do
    it "defines the right default css values in the root scope" 

  end

  describe "default_json" do
    it "includes default variables not found in brand config" 


    it "it has high contrast overrides for link and brand-primary" 


  end

  [true, false].each do |high_contrast|
    ['js', 'json', 'css'].each do |type|
      describe "save_default!(#{type})" do
        it "writes the default json representation to the default json file" 


        it 'uploads json file to s3 if cdn is enabled' 


        it 'deletes the local json file if cdn is enabled' 

      end
    end
  end
end

