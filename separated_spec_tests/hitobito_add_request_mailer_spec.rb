# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::AddRequestMailer do

  before do
    SeedFu.quiet = true
    SeedFu.seed [Rails.root.join('db', 'seeds')]
  end

  let(:person) do
    Fabricate(Group::BottomLayer::Member.name, group: groups(:bottom_layer_two)).person
  end
  let(:requester) do
    Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_one)).person
  end
  let(:group) { groups(:bottom_layer_one) }

  let(:request) do
    Person::AddRequest::Group.create!(
      person: person,
      requester: requester,
      body: group,
      role_type: Group::BottomLayer::Member.sti_name)
  end

  context 'ask person to add' do

    let(:mail) { Person::AddRequestMailer.ask_person_to_add(request) }

    subject { mail }

    its(:to)       { should == [person.email] }
    its(:sender)   { should =~ /#{requester.email.gsub('@','=')}/ }
    its(:subject)  { should == "Freigabe deiner Personendaten" }
    its(:body)     { should =~ /Hallo #{person.first_name}/ }
    its(:body)     { should =~ /#{requester.full_name} möchte dich/ }
    its(:body)     { should =~ /Bottom Layer Bottom One/ }
    its(:body)     { should =~ /test.host\/groups\/#{group.id}/ }
    its(:body)     { should =~ /#{requester.full_name} hat folgende schreibberechtigten Rollen:/ }
    its(:body)     { should =~ /Leader in Bottom One/ }
    its(:body)     { should =~ /test.host\/people\/#{person.id}\?body_id=#{group.id}&body_type=Group/ }
    its(:body)     { should have_css 'a', text: 'Anfrage beantworten' }

    it 'lists requester group roles with write permissions only' 


  end

  context 'ask responsibles to add person' do

    let(:leader) do
      Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_two)).person
    end
    let(:leader2) do
      Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_two)).person
    end

    let(:person_layer) { groups(:bottom_layer_two) }
    let(:responsibles) { [leader, leader2] }

    let(:mail) { Person::AddRequestMailer.ask_responsibles(request, responsibles) }

    subject { mail }

    its(:to)       { should == [leader.email, leader2.email] }
    its(:sender)   { should =~ /#{requester.email.gsub('@','=')}/ }
    its(:subject)  { should == "Freigabe Personendaten" }
    its(:body)     { should =~ /Hallo #{leader.greeting_name}, #{leader2.greeting_name}/ }
    its(:body)     { should =~ /#{requester.full_name} möchte #{person.full_name}/ }
    its(:body)     { should =~ /Bottom Layer Bottom One/ }
    its(:body)     { should have_css 'a', text: 'Bottom Layer Bottom One' }
    its(:body)     { should =~ /test.host\/groups\/#{group.id}/ }
    its(:body)     { should =~ /#{requester.full_name} hat folgende schreibberechtigten Rollen:/ }
    its(:body)     { should =~ /Leader in Bottom One/ }
    its(:body)     { should have_css 'a', text: 'Anfrage beantworten' }
    its(:body)     { should =~ /test.host\/groups\/#{person_layer.id}\/person_add_requests\?body_id=#{group.id}&body_type=Group&person_id=#{person.id}/ }

  end

  context 'request approved' do

    context 'by leader' do

      let(:leader) do
        Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_two)).person
      end
      let(:mail) { Person::AddRequestMailer.approved(person, group, requester, leader) }

      subject { mail }

      its(:to)       { should == [requester.email] }
      its(:sender)   { should =~ /#{leader.email.gsub('@','=')}/ }
      its(:subject)  { should == "Freigabe der Personendaten akzeptiert" }
      its(:body)     { should =~ /Hallo #{requester.greeting_name}/ }
      its(:body)     { should =~ /#{leader.full_name} hat deine Anfrage für #{person.full_name} freigegeben/ }
      its(:body)     { should =~ /#{leader.full_name} hat folgende schreibberechtigten Rollen:/ }
      its(:body)     { should =~ /Leader in Bottom Two/ }
      its(:body)     { should have_css 'a', text: 'Bottom Layer Bottom One' }

    end

    context 'by person' do
      let(:mail) { Person::AddRequestMailer.approved(person, group, requester, person) }

      subject { mail }

      its(:to)       { should == [requester.email] }
      its(:sender)   { should =~ /#{person.email.gsub('@','=')}/ }
      its(:subject)  { should == "Freigabe der Personendaten akzeptiert" }
      its(:body)     { should =~ /Hallo #{requester.greeting_name}/ }
      its(:body)     { should =~ /#{person.full_name} hat deine Anfrage für #{person.full_name} freigegeben/ }
      its(:body)     { should =~ /#{person.full_name} hat folgende schreibberechtigten Rollen:/ }
      its(:body)     { should have_css 'a', text: 'Bottom Layer Bottom One' }
    end

  end

  context 'request rejected' do

    let(:leader) do
      Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_two)).person
    end

    let(:mail) { Person::AddRequestMailer.rejected(person, group, requester, leader) }

    subject { mail }

    its(:to)       { should == [requester.email] }
    its(:sender)   { should =~ /#{leader.email.gsub('@','=')}/ }
    its(:subject)  { should == "Freigabe der Personendaten abgelehnt" }
    its(:body)     { should =~ /Hallo #{requester.greeting_name}/ }
    its(:body)     { should =~ /#{leader.full_name} hat deine Anfrage für #{person.full_name} abgelehnt/ }
    its(:body)     { should =~ /#{leader.full_name} hat folgende schreibberechtigten Rollen:/ }
    its(:body)     { should =~ /Leader in Bottom Two/ }
    its(:body)     { should have_css 'a', text: 'Bottom Layer Bottom One' }

  end

  context 'body url' do

    let(:mail) { Person::AddRequestMailer.send(:new) }

    it 'event url' 


    it 'group url' 


    it 'mailing list url' 


  end

  context '#link_to_request' do

    let(:mail) { Person::AddRequestMailer.send(:new) }

    it 'event body' 


    it 'group body' 


    it 'mailing list body' 


  end

end

