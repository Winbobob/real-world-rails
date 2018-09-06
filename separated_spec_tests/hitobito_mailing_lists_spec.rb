#  Copyright (c) 2012-2018, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'


describe MailingListsController, js: true do

  let(:user) { people(:top_leader) }
  let(:list) { mailing_lists(:leaders) }

  before { sign_in }

  it 'removes two labels from existing mailing' 


  it 'adds single label to new mailing list' 


  it 'adds two preferred_labels to existing mailing list' 


end

