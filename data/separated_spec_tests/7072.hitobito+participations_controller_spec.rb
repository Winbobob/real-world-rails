# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Event::ParticipationsController do

  let(:group) { groups(:top_layer) }

  let(:other_course) do
    other = Fabricate(:course, groups: [group], kind: course.kind)
    other.dates << Fabricate(:event_date, event: other, start_at: course.dates.first.start_at)
    other
  end

  let(:course) do
    course = Fabricate(:course, groups: [group], priorization: true)
    course.questions << Fabricate(:event_question, event: course)
    course.questions << Fabricate(:event_question, event: course)
    course.dates << Fabricate(:event_date, event: course)
    course
  end

  let(:participation) do
    p = Fabricate(:event_participation,
                  event: course,
                  application: Fabricate(:event_application,
                                         priority_1: course,
                                         priority_2: Fabricate(:course, kind: course.kind)))
    p.answers.detect { |a| a.question_id == course.questions[0].id }.update!(answer: 'juhu')
    p.answers.detect { |a| a.question_id == course.questions[1].id }.update!(answer: 'blabla')
    p
  end

  let(:user) { people(:top_leader) }

  before do
    user.qualifications << Fabricate(:qualification, qualification_kind: qualification_kinds(:gl),
                                                     start_at: course.dates.first.start_at)
    sign_in(user)
    other_course
  end


  context 'GET index' do
    before do
      @leader, @participant = *create(Event::Role::Leader, course.participant_types.first)

      update_person(@participant, first_name: 'Al', last_name: 'Barns', nickname: 'al',
                    town: 'Eye', address: 'Spring Road', zip_code: '3000', birthday: '21.10.1978')
      update_person(@leader, first_name: 'Joe', last_name: 'Smith', nickname: 'js',
                    town: 'Stoke', address: 'Howard Street', zip_code: '8000', birthday: '1.3.1992')
    end

    it 'lists participant and leader group by default' 


    it 'lists particpant and leader group by default order by role if specific in settings' 


    it 'lists only leader_group' 


    it 'lists only participant_group' 


    it 'generates pdf labels' 


    it 'exports csv files' 


    it 'exports xlsx files' 


    it 'sets cookie on export' 


    it 'renders email addresses with additional ones' 


    it 'loads pending person add requests' 



    context 'sorting' do
      %w(first_name last_name nickname zip_code town birthday).each do |attr|
        it "sorts based on #{attr}" 

      end

      it 'sorts based on role' 

    end


    def create(*roles)
      roles.map do |role_class|
        role = Fabricate(:event_role, type: role_class.sti_name)
        Fabricate(:event_participation, event: course, roles: [role], active: true)
      end
    end

    def update_person(participation, attrs)
      participation.person.update_attributes!(attrs)
    end
  end


  context 'GET show' do

    context 'for same event' do
      before { get :show, group_id: group.id, event_id: course.id, id: participation.id }

      it 'has two answers' 


      it 'has application' 

    end

    context 'for other event of same group' do
      before { get :show, group_id: group.id, event_id: other_course.id, id: participation.id }

      it 'has participation' 

    end

    context 'for other event of other group' do

      let(:group) { groups(:bottom_layer_one) }
      let(:user) do
        Fabricate(Group::BottomLayer::Leader.sti_name.to_sym,
                  group: groups(:bottom_layer_one)).person
      end
      let(:other_course) do
        other = Fabricate(:course, groups: [groups(:bottom_layer_two)], kind: course.kind)
        other.dates << Fabricate(:event_date, event: other, start_at: course.dates.first.start_at)
        other
      end

      context 'on prio 2' do
        let(:participation) do
          p = Fabricate(:event_participation,
                        event: other_course,
                        application: Fabricate(:event_application,
                                               priority_2: course))
          p.answers.create!(question_id: course.questions[0].id, answer: 'juhu')
          p.answers.create!(question_id: course.questions[1].id, answer: 'blabla')
          p
        end

        before { get :show, group_id: group.id, event_id: course.id, id: participation.id }

        it 'has participation' 

      end

      context 'on waiting list' do
        let(:participation) do
          p = Fabricate(:event_participation,
                        event: other_course,
                        application: Fabricate(:event_application,
                                               waiting_list: true))
          p
        end

        before { get :show, group_id: group.id, event_id: course.id, id: participation.id }

        it 'has participation' 

      end

    end

    context 'simple event' do
      let(:simple_event) do
        simple_event = Fabricate(:event, groups: [group])
        simple_event.dates << Fabricate(:event_date, event: simple_event)
        simple_event
      end
      let(:participation) { Fabricate(:event_participation, event: simple_event) }

      it 'renders without errors (regression for load_precondition_warnings error on nil kind)' 

    end

  end

  context 'GET print' do
    render_views

    it 'renders participation as pdf' 

  end

  context 'GET new' do
    context 'for course with priorization' do
      before { get :new, group_id: group.id, event_id: event.id }

      let(:event) { course }

      it 'builds participation with answers' 

    end

    context 'for event without application' do
      before { get :new, group_id: group.id, event_id: event.id }

      let(:event) do
        event = Fabricate(:event, groups: [group])
        event.questions << Fabricate(:event_question, event: event)
        event.questions << Fabricate(:event_question, event: event)
        event.dates << Fabricate(:event_date, event: event)
        event
      end

      it 'builds participation with answers' 

    end

    context 'unauthenticated' do
      before { sign_out(user) }

      context 'event that does not support applications' do
        let(:event) { events(:top_event) }

        it 'does not throw any exception (regression test for #16403)' 

      end

      context 'event that supports applications' do
        let(:event) { course }

        it 'is fine when event supports applications (regression test for #16403)' 

      end
    end

  end

  context 'POST create' do

    context 'for current user' do
      let(:person)  { Fabricate(:person, email: 'anybody@example.com') }
      let(:app1)    { Fabricate(:person, email: 'approver1@example.com') }
      let(:app2)    { Fabricate(:person, email: 'approver2@example.com') }

      before do
        # create one person with two approvers
        Fabricate(Group::BottomLayer::Leader.name.to_sym, person: app1,
                  group: groups(:bottom_layer_one))
        Fabricate(Group::BottomLayer::Leader.name.to_sym, person: app2,
                  group: groups(:bottom_layer_one))
        Fabricate(Group::BottomGroup::Leader.name.to_sym, person: person,
                  group: groups(:bottom_group_one_one))

        person.qualifications << Fabricate(:qualification,
                                           qualification_kind: qualification_kinds(:sl))
      end

      it 'creates confirmation job' 


      it 'creates active participant role for non course events' 


      it 'creates non-active participant role for course events' 


      it 'creates specific non-active participant role for course events' 


      it 'creates new participation with application' 


      it 'creates new participation with all answers' 


      it 'fails for invalid event role' 


      context 'without event kinds' do
        before do
          course.update_column(:kind_id, nil)
        end

        it 'does not check preconditions' 


      end

      it 'stores additional information' 


      it 'handles DB-errors for too wide unicode characters (emoji)', :mysql do
        expect do
          post :create, group_id: group.id, event_id: course.id, event_participation: { additional_information: 'Vegetarier😝'}

          expect(assigns(:participation).errors.messages).to have(1).keys
        end.to_not raise_error
      end
    end

    context 'other user' do
      let(:bottom_member) { people(:bottom_member) }
      let(:participation) { assigns(:participation) }

      it 'top leader can create participation for bottom member' 


      it 'creates person add request if required' 


      it 'bottom member can not create participation for top leader' 

    end
  end


  context 'DELETE destroy' do

    it 'redirects to application market' 


    it 'redirects to event show if own participation' 


  end

  context 'preconditions' do
    before { user.qualifications.first.destroy }

    context 'GET show' do

      context 'for participant' do
        before { Fabricate(:event_role, type: Event::Course::Role::Participant.sti_name, participation: participation) }
        before { get :show, group_id: group.id, event_id: course.id, id: participation.id }
        let(:warnings) { assigns(:precondition_warnings) }

        it 'assigns precondition_warnings' 

      end

      context 'for leader' do
        before { Fabricate(:event_role, type: Event::Role::Leader.sti_name, participation: participation) }
        before { get :show, group_id: group.id, event_id: course.id, id: participation.id }
        let(:warnings) { assigns(:precondition_warnings) }

        it 'does not assign precondition_warnings' 

      end
    end

    context 'GET new' do
      before { get :new, group_id: group.id, event_id: course.id }

      it 'sets answers instance variable' 


      it 'allows the user to apply' 


      it 'displays flash message' 

    end

    context 'POST create' do
      before { post :create, group_id: group.id, event_id: course.id }
      let(:participation) { assigns(:participation) }

      it 'allows the user to apply' 


      it 'does not display a flash message' 

    end
  end

  context 'required answers' do
    let(:event) { events(:top_event) }

    def make_request(person, answer)
      question = event.questions.create!(question: 'dummy', required: true)
      sign_in(person)

      post :create, group_id: event.groups.first.id, event_id: event.id, event_participation:
        { answers_attributes: { '0' => { 'question_id' => question.id, 'answer' => answer } } }
      assigns(:participation)
    end

    it 'top_leader can create without supplying required answer' 


    it 'bottom_member cannot create without supplying required answer' 


    it 'bottom_member can create when supplying required answer' 

  end


  context 'multiple choice answers' do
    let(:event) { events(:top_event) }
    let(:question) { event_questions(:top_ov) }

    before do
      question.update_attribute(:multiple_choices, true)
      event.questions << question
    end

    context 'POST #create' do
      let(:answers_attributes) { { '0' => { 'question_id' => question.id, 'answer' => %w(1 2) } } }

      it 'handles multiple choice answers' 

    end

    context 'PUT #update' do
      let!(:participation) { Fabricate(:event_participation, event: event, person: user) }
      let(:answer) { participation.answers.where(question_id: question.id).first }
      let(:answers_attributes) do
        { '0' => { 'question_id' => question.id, 'answer' => ['0'], id: answer.id } }
      end

      before do
        answer.answer = 'GA, Halbtax'
        answer.save!
      end

      it 'handles resetting of multiple choice answers' 

    end
  end
end

