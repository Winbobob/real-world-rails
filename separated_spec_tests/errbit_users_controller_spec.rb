describe UsersController, type: 'controller' do
  it_requires_authentication
  it_requires_admin_privileges for: {
    index:   :get,
    show:    :get,
    new:     :get,
    create:  :post,
    destroy: :delete
  }

  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }
  let(:other_user) { Fabricate(:user) }

  context 'Signed in as a regular user' do
    before do
      sign_in user
    end

    it "should set a time zone" 


    context "GET /users/:other_id/edit" do
      it "redirects to the home page" 

    end

    context "GET /users/:my_id/edit" do
      it 'finds the user' 

    end

    context "PUT /users/:other_id" do
      it "redirects to the home page" 

    end

    context "PUT /users/:my_id/id" do
      context "when the update is successful" do
        it "sets a message to display" 


        it "redirects to the user's page" 


        it "should not be able to become an admin" 


        it "should be able to set per_page option" 


        it "should be able to set time_zone option" 


        it "should be able to not set github_login option" 


        it "should be able to set github_login option" 

      end

      context "when the update is unsuccessful" do
        it "renders the edit page" 

      end
    end
  end

  context 'Signed in as an admin' do
    before do
      sign_in admin
    end

    context "GET /users" do
      it 'paginates all users' 

    end

    context "GET /users/:id" do
      it 'finds the user' 

    end

    context "GET /users/new" do
      it 'assigns a new user' 

    end

    context "GET /users/:id/edit" do
      it 'finds the user' 

    end

    context "POST /users" do
      context "when the create is successful" do
        let(:attrs) { { user: Fabricate.to_params(:user) } }

        it "sets a message to display" 


        it "redirects to the user's page" 


        it "should be able to create admin" 


        it "should has auth token" 

      end

      context "when the create is unsuccessful" do
        let(:user) do
          Struct.new(:admin, :attributes).new(true, {})
        end
        before do
          expect(User).to receive(:new).and_return(user)
          expect(user).to receive(:save).and_return(false)
        end

        it "renders the new page" 

      end
    end

    context "PUT /users/:id" do
      context "when the update is successful" do
        before do
          put :update, id: user.to_param, user: user_params
        end

        context "with normal params" do
          let(:user_params) { { name: 'Kermit' } }
          it "sets a message to display" 

        end
      end
      context "when the update is unsuccessful" do
        it "renders the edit page" 

      end
    end

    context "DELETE /users/:id" do
      context "with a destroy success" do
        let(:user_destroy) { double(destroy: true) }

        before do
          expect(UserDestroy).to receive(:new).with(user).and_return(user_destroy)
          delete :destroy, id: user.id
        end

        it 'should destroy user' 

      end

      context "with trying destroy himself" do
        before do
          expect(UserDestroy).to_not receive(:new)
          delete :destroy, id: admin.id
        end

        it 'should not destroy user' 

      end
    end

    describe "#user_params" do
      context "with current user not admin" do
        before do
          allow(controller).to receive(:current_user).and_return(user)
          allow(controller).to receive(:params).and_return(
            ActionController::Parameters.new(user_param)
          )
        end
        let(:user_param) { { 'user' => { name: 'foo', admin: true } } }
        it 'not have admin field' 

        context "with password and password_confirmation empty?" do
          let(:user_param) { { 'user' => { :name => 'foo', 'password' => '', 'password_confirmation' => '' } } }
          it 'not have password and password_confirmation field' 

        end
      end

      context "with current user admin" do
        it 'have admin field'
        context "with password and password_confirmation empty?" do
          it 'not have password and password_confirmation field'
        end
        context "on his own user" do
          it 'not have admin field'
        end
      end
    end
  end
end

