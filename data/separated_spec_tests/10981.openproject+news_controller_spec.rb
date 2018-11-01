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

describe NewsController, type: :controller do
  render_views

  include BecomeMember

  let(:user)    {
    user = FactoryBot.create(:admin)

    FactoryBot.create(:user_preference, user: user, others: { no_self_notified: false })

    user
  }
  let(:project) { FactoryBot.create(:project) }
  let(:news)    { FactoryBot.create(:news)    }

  before do
    allow(User).to receive(:current).and_return user
  end

  describe '#index' do
    it 'renders index' 


    it 'renders index with project' 

  end

  describe '#show' do
    it 'renders show' 


    it 'renders show with slug' 


    it 'renders error if news item is not found' 

  end

  describe '#new' do
    it 'renders new' 

  end

  describe '#create' do
    context 'with news_added notifications',
            with_settings: { notified_events: %w(news_added) } do
      it 'persists a news item and delivers email notifications' 

    end

    it "doesn't persist if validations fail" 

  end

  describe '#edit' do
    it 'renders edit' 

  end

  describe '#update' do
    it 'updates the news element' 

  end

  describe '#destroy' do
    it 'deletes the news element and redirects to the news overview page' 

  end
end

