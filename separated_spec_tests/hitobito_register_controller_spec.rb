# encoding: utf-8

#  Copyright (c) 2012-2014, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Event::RegisterController, type: :controller do

  render_views

  let(:event) do
    events(:top_event).tap do |e|
      e.update_column(:external_applications, true)
    end
  end

  let(:group) { event.groups.first }

  context 'GET index' do
    context 'application possible' do
      before do
        event.update_column(:application_opening_at, 5.days.ago)
      end

      context 'as external user' do
        it 'displays external login forms' 

      end
    end
  end

  context 'POST check' do
    context 'for existing person' do
      it 'generates one time login token' 

    end

    context 'for non-existing person' do
      it 'displays person form' 

    end
  end
end

