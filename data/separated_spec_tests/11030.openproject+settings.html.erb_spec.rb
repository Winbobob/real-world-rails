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

describe 'project_settings/show', type: :view do
  let(:project) { FactoryBot.build_stubbed(:project) }

  describe 'project copy permission' do
    before do
      assign(:project, project)
      allow(view).to receive(:render_tabs).and_return('')
    end

    context 'when project copy is allowed' do
      before do
        allow(project).to receive(:copy_allowed?).and_return(true)
        render
      end

      it 'the copy link should be visible' 

    end

    context 'when project copy is not allowed' do
      before do
        allow(project).to receive(:copy_allowed?).and_return(false)
        render
      end

      it 'the copy link should not be visible' 

    end
  end

  context 'User.current is admin' do
    let(:admin) { FactoryBot.build_stubbed :admin }

    before do
      assign(:project, project)
      allow(project).to receive(:copy_allowed?).and_return(true)
      allow(User).to receive(:current).and_return(admin)
      allow(view).to receive(:render_tabs).and_return('')
      render
    end

    it 'show delete and archive buttons' 

  end

  context 'User.current is non-admin' do
    let(:non_admin) { FactoryBot.build_stubbed :user }

    before do
      assign(:project, project)
      allow(project).to receive(:copy_allowed?).and_return(true)
      allow(User).to receive(:current).and_return(non_admin)
      allow(view).to receive(:render_tabs).and_return('')
      render
    end

    it 'hide delete and archive buttons' 

  end
end
