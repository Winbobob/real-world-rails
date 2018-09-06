# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

# encoding:  utf-8

require 'spec_helper'

describe Event::ParticipationContactDatasController, type: :controller do

  render_views

  let(:group) { groups(:top_layer) }
  let(:course) { Fabricate(:course, groups: [group]) }
  let(:person) { people(:top_leader) }
  let(:dom) { Capybara::Node::Simple.new(response.body) }

  before { sign_in(person) }

  describe 'GET edit' do

    it 'does not show hidden contact fields' 


    it 'shows all contact fields by default' 


    it 'marks required attributes with an asterisk' 


  end

  context 'POST update' do

    before do
      course.update!({ required_contact_attrs: ['nickname', 'address']})
    end

    it 'validates contact attributes and person attributes' 


    it 'updates person attributes and redirects to event questions' 

  end

end

