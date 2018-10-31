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

describe HomescreenController, type: :controller do
  before do
    login_as(user)

    # assume anonymous may access the page
    allow(Setting).to receive(:login_required?).and_return(false)
    allow(Setting).to receive(:welcome_on_homescreen?).and_return(show_welcome)
    get :index
  end

  let(:all_blocks) {
    %w(administration community my_account projects users)
  }

  let(:show_welcome) { false }

  shared_examples 'renders blocks' do
    it 'renders a response' 


    describe 'with rendered views' do
      render_views

      it 'renders the given blocks' 


      it 'does not render the other blocks' 


      it 'does not render news when empty' 


      it 'shows the news when available' 


      it 'does not render the welcome block' 


      context 'with enabled announcement' do
        let!(:announcement) { FactoryBot.create :active_announcement }
        it 'renders the announcement' 

      end

      context 'with enabled welcome block' do
        before do
          allow(Setting).to receive(:welcome_text).and_return('h1. foobar')
          allow(Setting).to receive(:welcome_title).and_return('Woohoo!')
          get :index
        end

        let(:show_welcome) { true }

        it 'renders the block' 


        it 'renders the text' 

      end
    end
  end

  context 'with admin' do
    let(:user) { FactoryBot.build(:admin) }
    it_behaves_like 'renders blocks' do
      let(:shown) { all_blocks }
    end
  end

  context 'regular user' do
    let(:user) { FactoryBot.build(:user) }
    it_behaves_like 'renders blocks' do
      let(:shown) { all_blocks - %w(administration users) }
    end
  end

  context 'anonymous user' do
    let(:user) { User.anonymous }
    it_behaves_like 'renders blocks' do
      let(:shown) { all_blocks - %w(administration users my_account) }
    end
  end
end

