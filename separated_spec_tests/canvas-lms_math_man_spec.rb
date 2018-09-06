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

require 'spec_helper'

describe MathMan do
  let(:latex) do
    '\sqrt{25}+12^{12}'
  end
  # we explicitly don't want a trailing slash here for the url tests
  let(:service_url) { 'http://www.mml-service.com/beta' }
  let(:use_for_mml) { false }
  let(:use_for_svg) { false }

  before do
    @original_fallback = Canvas::DynamicSettings.fallback_data
    Canvas::DynamicSettings.fallback_data = {
      config: {
        canvas: {
          'math-man': {
            base_url: service_url,
          }
        }
      }
    }
    PluginSetting.create!(
      name: 'mathman',
      settings: {
        use_for_mml: use_for_mml,
        use_for_svg: use_for_svg
      }.with_indifferent_access
    )
  end

  after do
    Canvas::DynamicSettings.fallback_data = @original_fallback
  end

  describe '.url_for' do
    it 'must retain the path from base_url setting' 


    it 'includes target string in generated url' 


    it 'errors if DynamicSettings is not configured' 

  end

  describe '.use_for_mml?' do
    it 'returns false when set to false' 


    it 'returns false when PluginSetting is missing' 


    it 'does not error if DynamicSettings is not configured' 


    context 'when appropriately configured' do
      let(:use_for_mml) { true }

      it 'returns true' 

    end
  end

  describe '.use_for_svg?' do
    it 'returns false when set to false' 


    it 'returns false when PluginSetting is missing' 


    it 'does not error if DynamicSettings is not configured' 


    context 'when appropriately configured' do
      let(:use_for_svg) { true }

      it 'returns true' 

    end
  end
end

