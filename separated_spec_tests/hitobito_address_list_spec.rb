# encoding: utf-8

#  Copyright (c) 2012-2018, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe MailRelay::AddressList do

  let(:top_leader)    { people(:top_leader) }
  let(:bottom_member) { people(:bottom_member) }

  it 'contains main and additional mailing emails' 


  it 'does not contain blank emails' 


  it 'it uses only additional_email if label matches' 


  it 'it uses additional_email and main address if matches' 


  it 'it uses all matching additional_emails' 


  it 'it ignores case when mathing labels' 


  it 'it leading and trailing whitespaces case when mathing labels' 


  it 'falls back to default behviour of no label matches' 


  def entries(people = Person.all, labels = [])
    described_class.new(people, labels).entries
  end
end

