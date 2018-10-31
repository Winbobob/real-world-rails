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

describe OpenProject::ClientPreferenceExtractor do
  let(:extractor) { (Class.new { include OpenProject::ClientPreferenceExtractor }).new }

  describe 'user preferences' do
    let(:user) { FactoryBot.build(:user) }

    shared_examples_for 'preference with timezone' do
      before do
        allow(user).to receive(:pref) { pref }
      end

      subject { extractor.user_preferences(user) }

      it { expect(subject).not_to be_nil }

      it { expect(subject.time_zone).to eq(time_zone) }
    end

    context 'without timezone' do
      let(:pref) { UserPreference.new(time_zone: nil) }

      it_behaves_like 'preference with timezone' do
        let(:time_zone) { nil }
      end
    end

    context 'with timezone' do
      let(:pref) { UserPreference.new(time_zone: 'Berlin') }

      it_behaves_like 'preference with timezone' do
        let(:time_zone) { 'Europe/Berlin' }
      end
    end
  end

  describe 'date format' do
    let(:ruby_date_format) { '%Y-%y-%m-%B-%b-%h ? %d:%e:%j' }
    let(:expected_date_format) { 'YYYY-YY-MM-MMMM-MMM-MMM ? DD:D:DDDD' }

    it { expect(extractor.momentjstify_date_format(ruby_date_format)).to eq(expected_date_format) }
  end

  describe 'time format' do
    let(:ruby_time_format) { '%H:%k:%I:%l ? %P+%p+%M' }
    let(:expected_time_format) { 'HH:H:hh:h ? A+a+mm' }

    it { expect(extractor.momentjstify_time_format(ruby_time_format)).to eq(expected_time_format) }
  end
end

