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

describe 'Angular expression escaping', type: :feature do
  include OpenProject::TextFormatting

  describe 'login field' do
    let(:login_field) { find('#username') }

    before do
      visit signin_path
      within('#login-form') do
        fill_in('username', with: login_string)
        click_link_or_button I18n.t(:button_login)
      end

      expect(current_path).to eq signin_path
    end

    describe 'Simple expression' do
      let(:login_string) { '{{ 3 + 5 }}' }

      it 'does not evaluate the expression' 

    end

    context 'With JavaScript evaluation', js: true do
      describe 'Simple expression' do
        let(:login_string) { '{{ 3 + 5 }}' }

        it 'does not evaluate the expression' 

      end

      describe 'Angular 1.3 Sandbox evading' do
        let(:login_string) { "{{'a'.constructor.prototype.charAt=[].join;$eval('x=alert(1)'); }" }

        it 'does not evaluate the expression' 

      end
    end
  end

  describe '#WorkPackage description field', js: true do
    let(:project) { FactoryGirl.create :project }
    let(:property_name) { :description }
    let(:property_title) { 'Description' }
    let(:description_text) { 'Expression {{ 3 + 5 }}' }
    let!(:work_package) {
      FactoryGirl.create(
        :work_package,
        project: project,
        description: description_text
      )
    }
    let(:user) { FactoryGirl.create :admin }
    let(:field) { WorkPackageTextAreaField.new wp_page, 'description' }
    let(:wp_page) { Pages::SplitWorkPackage.new(work_package, project) }

    before do
      login_as(user)

      wp_page.visit!
      wp_page.ensure_page_loaded
    end

    it 'properly renders the unescaped string' 

  end

  describe '#wiki edit previewing', js: true do
    let(:user) { FactoryGirl.create :admin }
    let(:project) { FactoryGirl.create :project, enabled_module_names: %w(wiki) }

    let(:content) { find '#content_text' }
    let(:preview) { find '#preview' }
    let(:btn_preview) { find '#wiki_form-preview' }
    let(:btn_cancel) { find '#wiki_form a.button', text: I18n.t(:button_cancel) }

    before do
      login_as(user)
      visit project_wiki_path(project, project.wiki)
    end

    it 'properly escapes a macro in the preview functionality' 

  end

  describe '#text_format' do
    let(:text) { '{{hello_world}} {{ 3 + 5 }}' }
    subject(:html) { format_text(text) }

    it 'expands the macro' 


    it 'escapes the expression' 


    it 'marks the string as safe' 

  end
end

