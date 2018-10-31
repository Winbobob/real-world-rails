# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe 'event/participations/_list.html.haml' do

  let(:event) { EventDecorator.decorate(Fabricate(:course, groups: [groups(:top_layer)])) }
  let(:participation) { Fabricate(:event_participation, event: event) }
  let(:participations) { Kaminari.paginate_array([participation.decorate]).page(1) }

  let(:dom) { render; Capybara::Node::Simple.new(@rendered) }
  let(:dropdowns) { dom.all('.dropdown-toggle') }

  let(:params) do
    { 'action' => 'index',
      'controller' => 'event/participations',
      'group_id' => '1',
      'event_id' => '36' }
  end

  before do
    assign(:event, event)
    assign(:group, event.groups.first)
    allow(view).to receive_messages(parent: event)
    allow(view).to receive_messages(entries: participations)
    allow(view).to receive_messages(params: params)
    Fabricate(event.participant_types.first.name, participation: participation)
    participation.reload
  end

  it 'marks participations where required questions are unanswered' 


  context 'created_at' do

    it 'can be viewed by someone how can show participation details' 


    it 'is not seen by participants' 


  end

  def login_as(user)
    allow(controller).to receive_messages(current_user: user)
    allow(view).to receive_messages(current_user: user)
  end
end

