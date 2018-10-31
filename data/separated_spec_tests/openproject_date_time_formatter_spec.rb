#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2017 the OpenProject Foundation (OPF)
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
# See doc/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

describe :DateTimeFormatter do
  subject { ::API::V3::Utilities::DateTimeFormatter }
  let(:date) { Date.today }
  let(:datetime) { DateTime.now }

  shared_examples_for 'can format nil' do
    it 'accepts nil if asked to' 


    it 'returns usual result for non-nils' 

  end

  shared_examples_for 'can parse nil' do
    it 'accepts nil if asked to' 


    it 'returns usual result for non-nils' 

  end

  describe 'format_date' do
    it 'formats dates' 


    it 'formats datetimes' 


    it_behaves_like 'can format nil' do
      let(:method) { :format_date }
      let(:input) { date }
    end
  end

  describe 'parse_date' do
    it 'parses ISO 8601 dates' 


    it 'rejects parsing non ISO date formats' 


    it 'rejects parsing ISO 8601 date + time formats' 


    it_behaves_like 'can parse nil' do
      let(:method) { :parse_date }
      let(:input) { date.iso8601 }
    end
  end

  describe 'format_datetime' do
    it 'formats dates' 


    it 'formats datetimes' 


    it_behaves_like 'can format nil' do
      let(:method) { :format_datetime }
      let(:input) { datetime }
    end
  end

  describe 'format_duration_from_hours' do
    it 'formats floats' 


    it 'formats fractional floats' 


    it 'includes seconds' 


    it 'formats ints' 


    it_behaves_like 'can format nil' do
      let(:method) { :format_duration_from_hours }
      let(:input) { 5 }
    end
  end

  describe 'parse_duration_to_hours' do
    it 'parses ISO 8601 durations of full hours' 


    it 'parses ISO 8601 durations of fractional hours' 


    it 'parses ISO 8601 durations of days' 


    it 'rejects parsing non sense' 


    it 'rejects parsing pure number strings' 


    it 'rejects parsing pure numbers' 


    it_behaves_like 'can parse nil' do
      let(:method) { :parse_duration_to_hours }
      let(:input) { 'PT5H' }
    end
  end
end

