# encoding: utf-8

#  Copyright (c) 2012-2015, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::LogController, type: :controller do

  render_views

  let(:top_leader) { people(:top_leader) }
  let(:top_group) { groups(:top_group) }
  let(:test_entry) { top_leader }
  let(:dom) { Capybara::Node::Simple.new(response.body) }

  before { sign_in(top_leader) }

  describe 'GET index', versioning: true do

    it 'renders empty log' 


    it 'renders log in correct order' 


  end

end

