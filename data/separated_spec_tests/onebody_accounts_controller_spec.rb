require 'rails_helper'

describe AccountsController, type: :controller do
  render_views

  before do
    Setting.set(1, 'Privacy', 'Require Strong Password', false)
    @person = FactoryGirl.create(:person)
  end

  context '#show' do
    context 'given a person_id param' do
      before do
        get :show,
            params: { person_id: @person.id },
            session: { logged_in_id: @person.id }
      end

      it 'should redirect to the person account path' 

    end

    context 'given no params' do
      before do
        get :show,
            session: { logged_in_id: @person.id }
      end

      it 'should redirect to the new account path' 

    end
  end

  context '#new' do
    context 'sign up feature disabled' do
      before do
        Setting.set(1, 'Features', 'Sign Up', false)
      end

      context 'verify account page' do
        before do
          get :new
        end

        it 'should render new template' 

      end

      context 'by email' do
        before do
          get :new,
              params: { email: 'true' }
        end

        it 'should render new_by_email template' 

      end

      context 'by mobile phone' do
        before do
          get :new,
              params: { phone: 'true' }
        end

        it 'should render new_by_mobile template' 

      end
    end

    context 'sign up feature enabled' do
      before do
        Setting.set(1, 'Features', 'Sign Up', true)
        get :new
      end

      it 'should render new template' 


      context 'verify by email' do
        before do
          get :new,
              params: { email: 'true' }
        end

        it 'should render new_by_email template' 

      end
    end
  end

  context '#create' do
    context 'sign up' do
      context 'sign up feature disabled' do
        before do
          Setting.set(1, 'Features', 'Sign Up', false)
          post :create,
               params: { signup: { email: 'rick@example.com' } }
        end

        it 'should render new template again' 

      end

      context 'sign up feature enabled' do
        before do
          Setting.set(1, 'Features', 'Sign Up', true)
        end

        context 'spam sign up (honeypot a_phone_number field has text)' do
          before do
            @count_was = Person.count
            post :create,
                 params: { signup: { email: 'rick@example.com', first_name: 'Rick', last_name: 'Smith', birthday: '4/1/1980', a_phone_number: '1234567890' } }
          end

          it 'should render new template' 


          it 'should not create a new person' 

        end

        context 'valid sign up' do
          context 'no sign up approval needed' do
            before do
              Setting.set(1, 'Features', 'Sign Up Approval Email', '')
            end

            context 'user is an adult' do
              before do
                post :create,
                     params: { signup: { email: 'rick@example.com', mobile_phone: '0000000000', first_name: 'Rick', last_name: 'Smith', birthday: '4/1/1980' } }
                expect(assigns[:signup].errors).to be_empty
                @person = Person.last
              end

              it 'should send email verification email' 


              it 'should create a new person' 


              it 'should create a new family' 


              it 'should set status=active' 

            end

            context 'user is a child' do
              before do
                @count_was = Person.count
                post :create,
                     params: { signup: { email: 'rick@example.com', first_name: 'Rick', last_name: 'Smith', birthday: Date.current.to_s } }
              end

              it 'should not send email' 


              it 'should not create a new person' 


              it 'should render new template' 


              it 'should add an error to the record' 

            end
          end

          context 'sign up approval required' do
            before do
              Setting.set(1, 'Features', 'Sign Up Approval Email', 'admin@example.com')
              post :create,
                   params: { signup: { email: 'rick@example.com', mobile_phone: '0000000000', first_name: 'Rick', last_name: 'Smith', birthday: '4/1/1980' } }
              expect(assigns[:signup].errors).to be_empty
              @person = Person.last
            end

            it 'should send pending signup email' 


            it 'should create a new person' 


            it 'should create a new family' 


            it 'should set status=inactive' 

          end
        end

        context 'sign up with existing user email' do
          before do
            @existing = FactoryGirl.create(:person, email: 'rick@example.com')
            post :create,
                 params: { signup: { email: 'rick@example.com', mobile_phone: '0000000000', first_name: 'Rick', last_name: 'Smith', birthday: '4/1/1980' } }
          end

          it 'should send email verification email' 


          it 'should indicate that email was sent' 

        end

        context 'sign up missing name' do
          before do
            post :create,
                 params: { signup: { email: 'rick@example.com', mobile_phone: '0000000000', birthday: '4/1/1980' } }
          end

          it 'should render the new template again' 


          it 'should fail to save the signup' 

        end
      end
    end

    context 'verify email' do
      context 'non-existent email' do
        before do
          post :create,
               params: { verification: { email: 'rick@example.com' }, email: true }
        end

        it 'should indicate record not found' 

      end

      context 'email for existing user' do
        before do
          @person = FactoryGirl.create(:person, email: 'rick@example.com')
        end

        context 'user can sign in' do
          before do
            post :create,
                 params: { verification: { email: 'rick@example.com' } }
          end

          it 'should send email verification email' 


          it 'should indicate that email was sent' 

        end

        context 'user is inactive' do
          before do
            @person.update_attributes(status: :inactive)
            post :create,
                 params: { verification: { email: 'rick@example.com' } }
          end

          it 'should show error message' 

        end
      end
    end

    context 'verify mobile phone' do
      context 'non-existent mobile phone' do
        before do
          post :create,
               params: { verification: { mobile_phone: '1234567899', carrier: 'AT&T' }, phone: true }
        end

        it 'should indicate record not found' 

      end

      context 'mobile phone for existing user' do
        before do
          @person = FactoryGirl.create(:person, mobile_phone: '1234567899')
        end

        context 'user can sign in' do
          before do
            post :create,
                 params: { verification: { mobile_phone: '1234567899', carrier: 'AT&T' } }
          end

          it 'should send email verification email' 


          it 'should indicate that message was sent' 

        end

        context 'user is inactive' do
          before do
            @person.update_attributes(status: :inactive)
            post :create,
                 params: { verification: { mobile_phone: '1234567899', carrier: 'AT&T' } }
          end

          it 'should show error message' 

        end
      end
    end
  end

  context '#edit' do
    context 'user is account owner' do
      before do
        get :edit,
            params: { person_id: @person.id },
            session: { logged_in_id: @person.id }
      end

      it 'should render the edit form' 

    end

    context 'user is not account owner' do
      before do
        @stranger = FactoryGirl.create(:person)
        get :edit,
            params: { person_id: @person.id },
            session: { logged_in_id: @stranger.id }
      end

      it 'should return forbidden' 

    end

    context 'user is an admin with edit_profiles privilege' do
      before do
        @admin = FactoryGirl.create(:person, admin: Admin.create!(edit_profiles: true))
        get :edit,
            params: { person_id: @person.id },
            session: { logged_in_id: @admin.id }
      end

      it 'should render the edit form' 

    end
  end

  context '#update' do
    context 'user is account owner' do
      before do
        @password_was = @person.password_hash
        post :update,
             params: { person_id: @person.id, person: { email: 'foo@example.com', password: 'password', password_confirmation: 'password' } },
             session: { logged_in_id: @person.id }
      end

      it 'should redirect to the profile page' 


      it 'should update email address' 


      it 'should update password' 


      context 'bad email given' do
        before do
          post :update,
               params: { person_id: @person.id, person: { email: 'bad', password: 'password', password_confirmation: 'mismatched' } },
               session: { logged_in_id: @person.id }
        end

        it 'should be success' 


        it 'should render edit template again' 

      end

      context 'passwords do not match' do
        before do
          post :update,
               params: { person_id: @person.id, person: { email: 'foo@example.com', password: 'password', password_confirmation: 'mismatched' } },
               session: { logged_in_id: @person.id }
        end

        it 'should be success' 


        it 'should render edit template again' 

      end

      context 'passwords too short' do
        before do
          Setting.set(1, 'Privacy', 'Minimum Password Characters', '7')
          post :update,
               params: { person_id: @person.id, person: { email: 'foo@example.com', password: 'pass', password_confirmation: 'pass' } },
               session: { logged_in_id: @person.id }
        end

        it 'should be success' 


        it 'should render edit template again' 

      end

      context 'passwords not strong enough' do
        before do
          Setting.set(1, 'Privacy', 'Require Strong Password', true)
          post :update,
               params: { person_id: @person.id, person: { password: '123456', password_confirmation: '123456' } },
               session: { logged_in_id: @person.id }
        end

        it 'should be success' 


        it 'should render edit template again' 

      end
    end

    context 'user is not account owner' do
      before do
        @stranger = FactoryGirl.create(:person)
        post :update,
             params: { person_id: @person.id, person: { email: 'foo@example.com', password: 'password', password_confirmation: 'password' } },
             session: { logged_in_id: @stranger.id }
      end

      it 'should return forbidden' 

    end

    context 'user is an admin with edit_profiles privilege' do
      before do
        @admin = FactoryGirl.create(:person, admin: Admin.create!(edit_profiles: true))
        post :update,
             params: { person_id: @person.id, person: { email: 'foo@example.com', password: 'password', password_confirmation: 'password' } },
             session: { logged_in_id: @admin.id }
      end

      it 'should redirect' 

    end
  end

  context '#select' do
    context 'GET with select people in session' do
      before do
        @spouse = FactoryGirl.create(:person, family: @person.family)
        get :select,
            session: { select_from_people: [@person, @spouse] }
      end

      it 'should render select template' 

    end

    context 'POST with select people in session' do
      context 'with a matching id' do
        before do
          @spouse = FactoryGirl.create(:person, family: @person.family)
          post :select,
               params: { id: @spouse.id },
               session: { select_from_people: [@person, @spouse] }
        end

        it 'should redirect to edit person account path' 


        it 'should set flash to warn about setting password' 


        it 'should clear session select people' 

      end

      context 'without a matching id' do
        before do
          @spouse = FactoryGirl.create(:person, family: @person.family)
          post :select,
               params: { id: '0' },
               session: { select_from_people: [@person, @spouse] }
        end

        it 'should return 200 OK status' 


        it 'should render select template again' 


        it 'should clear not session select people' 

      end
    end

    context 'GET with no select people in session' do
      before do
        get :select
      end

      it 'should return status 410 Gone' 


      it 'should return page no longer valid' 

    end

    context 'POST with no select people in session' do
      before do
        post :select,
             params: { id: @person.id }
      end

      it 'should return status 410 Gone' 


      it 'should return page no longer valid' 

    end
  end

  context '#verify_code' do
    context 'GET without a code' do
      before do
        @verification = Verification.create!(email: @person.email)
        get :verify_code,
            params: { id: @verification.id }
      end

      it 'renders the verify_code template' 


      it 'does not auto-submit the form' 

    end

    context 'GET with a code' do
      before do
        @verification = Verification.create!(email: @person.email)
        get :verify_code,
            params: { id: @verification.id, code: '1234' }
      end

      it 'renders the verify_code template' 


      it 'auto-submits the form' 

    end

    context 'given a non-pending email verification' do
      before do
        @verification = Verification.create!(email: @person.email, verified: false)
        post :verify_code,
             params: { id: @verification.id }
      end

      it 'should show a not valid message' 

    end

    context 'given a pending email verification' do
      before do
        @verification = Verification.create!(email: @person.email)
      end

      context 'POST with proper id and code' do
        before do
          post :verify_code,
               params: { id: @verification.id, code: @verification.code }
        end

        it 'should mark the verification verified' 


        it 'should redirect to edit person account' 


        it 'should set flash notice to set email' 


        it 'should set logged in user in session' 

      end

      context 'POST with improper id' do
        it 'should raise RecordNotFound exception' 

      end

      context 'POST with proper id and wrong code' do
        before do
          post :verify_code,
               params: { id: @verification.id, code: '1' }
        end

        it 'should not mark the verification verified' 


        it 'should return 400 Bad Request' 


        it 'should render text' 

      end

      context 'matching more than one family member' do
        before do
          @spouse = FactoryGirl.create(:person, family: @person.family, email: @person.email)
        end

        context 'POST with proper id and code' do
          before do
            post :verify_code,
                 params: { id: @verification.id, code: @verification.code }
          end

          it 'should mark the verification verified' 


          it 'should set select people in session' 


          it 'should redirect to select account path' 

        end
      end
    end

    context 'given a pending mobile verification' do
      before do
        @person.update_attribute :mobile_phone, '1234567891'
        @verification = Verification.create!(mobile_phone: @person.mobile_phone, carrier: 'AT&T')
      end

      context 'POST with proper id and code' do
        before do
          post :verify_code,
               params: { id: @verification.id, code: @verification.code }
        end

        it 'should mark the verification verified' 


        it 'should redirect to edit person account' 


        it 'should set flash notice to set email' 

      end
    end
  end

  it 'should create account with birthday in american date format' 


  it 'should create account with birthday in european date format' 

end

