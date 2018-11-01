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

describe ::API::Decorators::Formattable do
  let(:represented) { 'A **raw** string!' }
  subject { described_class.new(represented).to_json }

  it 'should indicate its format' 


  it 'should contain the raw string' 


  it 'should contain the formatted string' 


  context 'passing an object context' do
    let(:object) { FactoryBot.build_stubbed :work_package }
    subject { described_class.new(represented, object: object) }

    it 'passes that to format_text' 

  end

  context 'format specified explicitly' do
    subject { described_class.new(represented, plain: true).to_json }

    it 'should indicate the explicit format' 


    it 'should format using the explicit format' 

  end
end

