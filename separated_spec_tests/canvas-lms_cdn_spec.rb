#
# Copyright (C) 2015 - present Instructure, Inc.
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

# Why are these in spec/selenium?
# ===============================
# Although these tests don't use selenium at all, they need to be have assets
# compiled in order to work. eg: `gulp rev` and `brandable_css` need to run first.
# By putting them in spec/selenium, our build server will run them with the rest
# of the browser specs, after it has compiled assets.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/common')

RE_SHORT_MD5 = /\A[a-f0-9]{10}\z/ # 10 chars of an MD5

EXAMPLE_CDN_HOST = 'https://somecdn.example.com'

describe 'Stuff related to how we load stuff from CDN and use brandable_css' do
  include_context "in-process server selenium tests"

  describe BrandableCSS do

    describe 'cache_for' do

      it 'finds the right fingerprints for normal bundles, plugins & handlebars' 

    end
  end

  def assert_tag(tag, attribute, value)
    selector = "#{tag}[#{attribute}='#{value}']"
    expect(f(selector)).to be_present
  end

  def check_css(bundle_name)
    variant = 'new_styles_normal_contrast'
    fingerprint = BrandableCSS.cache_for(bundle_name, variant)[:combinedChecksum]
    expect(fingerprint).to match(RE_SHORT_MD5)
    url = "#{EXAMPLE_CDN_HOST}/dist/brandable_css/#{variant}/#{bundle_name}-#{fingerprint}.css"
    assert_tag('link', 'href', url)
  end

  def check_asset(tag, asset_path)
    revved_path = Canvas::Cdn::RevManifest.url_for(asset_path)
    expect(revved_path).to be_present
    attribute = (tag == 'link') ? 'href' : 'src'
    url = "#{EXAMPLE_CDN_HOST}#{revved_path}"
    assert_tag(tag, attribute, url)
  end

  it 'has the right urls for script tag and stylesheets on the login page' 

end

