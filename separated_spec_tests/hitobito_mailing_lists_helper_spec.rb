# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe MailingListsHelper do

  include UtilityHelper
  include FormatHelper
  include LayoutHelper

  let(:entry) { mailing_lists(:leaders) }
  let(:current_user) { people(:top_leader) }

  describe '#button_toggle_subscription' do

    it "with subscribed user shows 'Anmelden'" 


    it "with not subscribed user shows 'Abmelden'" 

  end

end

