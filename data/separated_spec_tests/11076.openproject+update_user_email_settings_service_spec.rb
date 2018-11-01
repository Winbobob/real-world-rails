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

describe UpdateUserEmailSettingsService, type: :model do
  let(:user) { stub_model(User) }
  let(:service) { described_class.new(user) }

  describe '#call' do
    it 'returns true if saving is successful' 


    it 'returns false if saving of user is unsuccessful' 


    it 'returns false if saving of user preference is unsuccessful' 


    it 'sets the mail_notification if provided' 


    it 'does not alter mail_notification if not provided' 


    it 'sets self_notified if provided' 


    it 'does not alter no_self_notified if not provided' 


    it 'set the notified_project_ids on successful saving and mail_notifications is "selected"' 

  end
end

