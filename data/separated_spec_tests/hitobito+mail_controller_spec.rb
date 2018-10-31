# encoding: utf-8

#  Copyright (c) 2017, Hitobito AG. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Healthz::MailController do

  describe 'GET show' do

    let(:json) { JSON.parse(response.body) }
    let(:token) { '277ab37a0331e8a4f6591cf4' }
    let(:mail)  { Mail.new(File.read(Rails.root.join('spec', 'fixtures', 'email', 'simple.eml'))) }
    let(:cache) { Rails.cache }
    let(:seen_mail) { AppStatus::Mail::SeenMail.build(mail) }

    before { cache.write(:app_status, nil) }
    after { cache.write(:app_status, nil) }

    context 'when there is no problem with mail services' do

      it 'has HTTP status 200' 


    end

    context 'when the mail services are not working properly' do

      it 'has HTTP status 503' 


    end

    context 'auth token' do

      it 'denies access if no auth token given' 


      it 'denies access if wrong auth token given' 


    end

  end


end

