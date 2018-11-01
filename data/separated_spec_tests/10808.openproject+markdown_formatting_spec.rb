#-- encoding: UTF-8
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

describe OpenProject::TextFormatting::Formats::Markdown::Formatter do
  it 'should modifiers' 


  it 'should inline code' 


  it 'should escaping' 


  it 'should use of backslashes followed by numbers in headers' 


  it 'should double dashes should not strikethrough' 


  it 'should inline auto link' 


  it 'should inline auto link email addresses' 


  describe 'mail address autolink' do
    it 'prints autolinks for user references not existing' 


    context 'when visible user exists' do
      let(:project) { FactoryBot.create :project }
      let(:role) { FactoryBot.create(:role, permissions: %i(view_work_packages)) }
      let(:current_user) do
        FactoryBot.create(:user,
                          member_in_project: project,
                          member_through_role: role)
      end
      let(:user) do
        FactoryBot.create(:user,
                          login: 'foo@bar.com',
                          firstname: 'Foo',
                          lastname: 'Barrit',
                          member_in_project: project,
                          member_through_role: role)
      end

      before do
        user
        login_as current_user
      end

      context 'with path only' do
        it 'outputs the reference' 

      end

      context 'with absolute URLs (path_only is false)', with_settings: { host_name: "openproject.org" } do
        it 'outputs the reference' 

      end
    end
  end

  it 'should blockquote' 


  it 'should table' 


  it 'should not mangle brackets' 


  it 'should textile should escape image urls' 


  it 'inserts table of contents triggered by a macro' 


  private

  def assert_html_output(to_test, options = {})
    options = { expect_paragraph: true }.merge options
    expect_paragraph = options.delete :expect_paragraph

    to_test.each do |text, expected|
      expected = expect_paragraph ? "<p>#{expected}</p>" : expected
      expect(to_html(text, options)).to be_html_eql expected
    end
  end

  def to_html(text, options = {})
    described_class.new(options).to_html(text)
  end
end

