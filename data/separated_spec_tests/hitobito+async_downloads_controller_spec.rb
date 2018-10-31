# encoding: utf-8

#  Copyright (c) 2012-2018, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe AsyncDownloadsController do

  let(:person) { people(:bottom_member) }

  before do
    sign_in(person)
  end

  context 'show' do
    it 'sends file deletes cookies if current_person has access and last download' 


    it 'sends file removes cookie entry if current_person has access and not last download' 


    it 'returns 404 if person has no access' 


    it 'returns 404 if file does not exists' 

  end

  context 'csv' do
    it 'sends file with specific encoding' 

  end

  context 'exist' do
    it 'render json status 200 if file exists and person has access' 


    it 'render json status 404 if person has no access' 


    it 'render json status 404 if file does not exist' 

  end

  private

  def generate_test_file(filename, filetype = :txt)
    AsyncDownloadFile.new(filename, filetype).write('this is a testfile')
  end
end

