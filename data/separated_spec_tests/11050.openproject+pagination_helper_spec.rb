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

describe PaginationHelper, type: :helper do
  let(:paginator) do
    # creating a mock pagination object
    # this one is then identical (from the interface) to a active record
    paginator = WillPaginate::Collection.create(current_page, per_page) do |pager|
      result = Array.new(pager.per_page) { |i| i }

      pager.replace(result)

      unless pager.total_entries
        pager.total_entries = total_entries
      end
    end

    paginator
  end

  describe '#pagination_links_full' do
    let(:per_page) { 10 }
    let(:total_entries) { 55 }
    let(:offset) { 1 }
    let(:current_page) { 1 }
    let(:pagination) { helper.pagination_links_full(paginator) }

    before do
      # setup the helpers environment as if the helper is rendered after having called
      # /work_packages
      url_options = helper.url_options

      allow(helper)
        .to receive(:params)
        .and_return(ActionController::Parameters.new(controller: 'work_packages', action: 'index'))
      allow(helper)
        .to receive(:url_options)
        .and_return(url_options.merge(controller: 'work_packages', action: 'index'))
    end

    it "should be inside a 'pagination' div" 


    it 'should have a next_page reference' 


    it 'should not have a previous_page reference' 


    it 'should have links to every page except the current one' 


    it 'should not have a link to the current page' 


    it 'should have an element for the curren page' 


    it 'should show the range of the entries displayed' 


    it 'should have different urls if the params are specified as options' 


    it 'should show the available pre page options' 


    describe 'WHEN the first page is the current' do
      let(:current_page) { 1 }

      it 'should deactivate the previous page link' 


      it 'should have a link to the next page' 

    end

    describe 'WHEN the last page is the current' do
      let(:current_page) { total_entries / per_page + 1 }

      it 'should deactivate the next page link' 


      it 'should have a link to the previous page' 

    end

    describe 'WHEN the paginated object is empty' do
      let(:total_entries) { 0 }

      it 'should show no pages' 


      it 'should show no pagination' 

    end
  end

  describe '#page_param' do
    it 'should return page if provided and sensible' 


    it 'should return default page 1 if page provided but useless' 


    context 'with multiples per_page',
            with_settings: { per_page_options: '5,10,15' } do
      it 'should calculate page from offset and limit if page is not provided' 

    end

    it 'should ignore offset and limit if page is provided' 


    context 'faulty settings',
            with_settings: { per_page_options: '-1,2,3' } do
      it 'should not break if limit is bogus (also faulty settings)' 

    end

    it 'should return 1 if nothing is provided' 

  end

  describe '#per_page_param',
           with_settings: { per_page_options: '1,2,3' } do
    it 'should return per_page if provided and one of the values stored in the settings' 


    it 'should return per_page if provided and store it in the session' 


    it 'should take the smallest value stored in the settings ' +
       'if provided per_page param is not one of the configured' do
      per_page = 4

      expect(per_page_param(per_page: per_page)).to eq(1)
    end

    it 'prefers the value stored in the session if it is valid according to the settings' 


    it 'ignores the value stored in the session if it is not valid according to the settings' 


    it 'uses limit synonymously to per_page' 


    it 'prefers per_page over limit' 


    it 'stores the value in the session' 

  end
end

