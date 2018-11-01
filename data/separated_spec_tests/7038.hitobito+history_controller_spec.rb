# encoding: utf-8

#  Copyright (c) 2012-2015, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::HistoryController do

  let(:top_leader) { people(:top_leader) }

  before { sign_in(top_leader) }

  describe 'GET #index' do

    context 'all roles' do

      it 'all group roles ordered by group and layer' 

    end

  end

end

