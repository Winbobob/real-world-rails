#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

module OpenProject
  describe I18n, type: :helper do
    include Redmine::I18n

    let(:format) { '%d/%m/%Y' }

    after do
      Time.zone = nil
    end

    describe 'with user time zone' do
      before do allow(User.current).to receive(:time_zone).and_return(ActiveSupport::TimeZone['Athens']) end
      it 'returns a date in the user timezone for a utc timestamp' 


      it 'returns a date in the user timezone for a non-utc timestamp' 

    end

    describe 'without user time zone' do
      before do allow(User.current).to receive(:time_zone).and_return(nil) end

      it 'returns a date in the local system timezone for a utc timestamp' 


      it 'returns a date in the original timezone for a non-utc timestamp' 

    end

    describe 'all_languages' do
      # Those are the two languages we support
      it 'includes en' 

      it 'includes de' 


      it 'should return no js language as they are duplicates of the rest of the other language' 


      # it is OK if more languages exist
      it 'has multiple languages' 

    end

    describe 'valid_languages' do
      it 'allows only languages that are available' 


      it 'allows only languages that exist' 

    end

    describe 'set_language_if_valid' do
      before do
        allow(Setting).to receive(:available_languages).and_return(Setting.all_languages)
      end

      Setting.all_languages.each do |lang|
        it "should set I18n.locale to #{lang}" 

      end

      it 'should not set I18n.locale to an invalid language' 

    end

    describe 'find_language' do
      before do
        allow(Setting).to receive(:available_languages).and_return([:de])
      end

      it 'is nil if language is not active' 


      it 'is nil if no language is given' 


      it 'is the language if it is active' 


      it 'can be found by uppercase if it is active' 


      it 'is nil if non valid string is passed' 

    end

    describe 'link_translation' do
      let(:locale) { :en }
      let(:urls) {
        { url_1: 'http://openproject.com/foobar', url_2: '/baz' }
      }

      before do
        allow(::I18n)
          .to receive(:t)
          .with('translation_with_a_link', locale: locale)
          .and_return('There is a [link](url_1) in this translation! Maybe even [two](url_2)?')
      end

      it 'allows to insert links into translations' 


      context 'with locale' do
        let(:locale) { :de }
        it 'uses the passed locale' 

      end
    end
  end
end

