# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Event::RegisterController do

  let(:event) do
    events(:top_event).tap do |e|
      e.update_column(:external_applications, true)
    end
  end
  let(:group) { event.groups.first }

  context 'GET index' do

    context 'no external applications' do
      before do
        event.update_column(:external_applications, false)
      end

      context 'as logged in user' do
        before { sign_in(people(:top_leader)) }
        it 'displays event page' 

      end

      context 'as external user' do
        it 'displays standard login forms' 

      end
    end

    context 'application possible' do
      before do
        event.update_column(:application_opening_at, 5.days.ago)
      end

      context 'as logged in user' do
        before { sign_in(people(:top_leader)) }
        it 'displays event page' 

      end

      context 'as external user' do
        it 'displays external login forms' 

      end
    end

    context 'application not possible' do
      before do
        event.update_attribute(:application_opening_at, 5.days.from_now)
      end

      context 'as logged in user' do
        before { sign_in(people(:top_leader)) }
        it 'displays event page' 

      end

      context 'as external user' do
        it 'displays standard login forms' 

      end
    end
  end

  context 'POST check' do
    context 'without email' do
      it 'displays form again' 

    end

    context 'with honeypot filled' do
      it 'redirects to login' 

    end

    context 'for existing person' do
      it 'generates one time login token' 

    end

    context 'for non-existing person' do
      it 'displays person form' 

    end
  end

  context 'PUT register' do
    context 'with valid data' do
      it 'creates person' 

    end

    context 'with honeypot filled' do
      it 'redirects to login' 

    end

    context 'with invalid data' do
      it 'does not create person' 

    end
  end

end

