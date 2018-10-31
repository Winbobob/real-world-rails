#-- encoding: UTF-8
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
require 'legacy_spec_helper'

describe ApplicationHelper, type: :helper do
  include WorkPackagesHelper

  before do
    # @project variable is used by helper
    @project = FactoryGirl.create :valid_project
    @project.reload # reload references to indirectly created entities (e.g. wiki)

    @admin = FactoryGirl.create :admin
    @anonymous = FactoryGirl.create :anonymous
    @non_member = FactoryGirl.create :user
    @project_member = FactoryGirl.create :user,
                                         member_in_project: @project,
                                         member_through_role: FactoryGirl.create(:role,
                                                                                 permissions: [:view_work_packages, :edit_work_packages,
                                                                                               :browse_repository, :view_changesets, :view_wiki_pages])

    @issue = FactoryGirl.create :work_package, project: @project, author: @project_member, type: @project.types.first

    file = LegacyFileHelpers.mock_uploaded_file name: 'logo.gif',
                                          content_type: 'image/gif',
                                          content: 'not actually a gif',
                                          binary: true
    @attachment = FactoryGirl.create :attachment,
                                     author: @project_member,
                                     file: file,
                                     content_type: 'image/gif',
                                     container: @issue,
                                     description: 'This is a logo'

    allow(User).to receive(:current).and_return(@project_member)
  end

  it 'should auto links' 


  it 'should auto mailto' 


  it 'should inline images' 


  it 'should inline images inside tags' 


  it 'should attached images' 


  it 'should textile external links' 


  it 'should textile relative to full links in a controller', :with_mock_request_for_helper do
    {
      # shouldn't change non-relative links
      'This is a "link":http://foo.bar' => 'This is a <a href="http://foo.bar" class="external">link</a>',
      'This is an intern "link":/foo/bar' => 'This is an intern <a href="http://test.host/foo/bar">link</a>',
      'This is an intern "link":/foo/bar and an extern "link":http://foo.bar' => 'This is an intern <a href="http://test.host/foo/bar">link</a> and an extern <a href="http://foo.bar" class="external">link</a>',
    }.each { |text, result| assert_dom_equal "<p>#{result}</p>", helper.format_text(text, only_path: false) }
  end

  it 'should textile relative to full links in the mailer' 


  it 'should cross project redmine links' 


  it 'should redmine links git commit' 


  it 'should attachment links' 


  it 'should html tags' 


  it 'should allowed html tags' 


  it 'should pre tags' 


  it 'should syntax highlight' 


  it 'should wiki links in tables' 


  it 'should text formatting' 


  it 'should wiki horizontal rule' 


  it 'should footnotes' 


  it 'should headings without url' 


  it 'should table of content' 


  it 'should table of content should contain included page headings' 


  it 'should default formatter' 


  it 'should due date distance in words' 


  it 'should link to user' 


  it 'should link to user should not link to locked user' 


  it 'should link to user should not link to anonymous' 


  it 'should link to project' 

end

