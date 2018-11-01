require 'spec_helper'

describe SnippetsController do
  let(:user) { create(:user) }

  describe 'GET #index' do
    let(:user) { create(:user) }

    context 'when username parameter is present' do
      it 'renders snippets of a user when username is present' 

    end

    context 'when username parameter is not present' do
      it 'redirects to explore snippets page when user is not logged in' 


      it 'redirects to snippets dashboard page when user is logged in' 

    end
  end

  describe 'GET #new' do
    context 'when signed in' do
      before do
        sign_in(user)
      end

      it 'responds with status 200' 

    end

    context 'when not signed in' do
      it 'redirects to the sign in page' 

    end
  end

  describe 'GET #show' do
    context 'when the personal snippet is private' do
      let(:personal_snippet) { create(:personal_snippet, :private, author: user) }

      context 'when signed in' do
        before do
          sign_in(user)
        end

        context 'when signed in user is not the author' do
          let(:other_author) { create(:author) }
          let(:other_personal_snippet) { create(:personal_snippet, :private, author: other_author) }

          it 'responds with status 404' 

        end

        context 'when signed in user is the author' do
          it 'renders the snippet' 

        end
      end

      context 'when not signed in' do
        it 'redirects to the sign in page' 

      end
    end

    context 'when the personal snippet is internal' do
      let(:personal_snippet) { create(:personal_snippet, :internal, author: user) }

      context 'when signed in' do
        before do
          sign_in(user)
        end

        it 'renders the snippet' 

      end

      context 'when not signed in' do
        it 'redirects to the sign in page' 

      end
    end

    context 'when the personal snippet is public' do
      let(:personal_snippet) { create(:personal_snippet, :public, author: user) }

      context 'when signed in' do
        before do
          sign_in(user)
        end

        it 'renders the snippet' 

      end

      context 'when not signed in' do
        it 'renders the snippet' 

      end
    end

    context 'when the personal snippet does not exist' do
      context 'when signed in' do
        before do
          sign_in(user)
        end

        it 'responds with status 404' 

      end

      context 'when not signed in' do
        it 'responds with status 404' 

      end
    end
  end

  describe 'POST #create' do
    def create_snippet(snippet_params = {}, additional_params = {})
      sign_in(user)

      post :create, {
        personal_snippet: { title: 'Title', content: 'Content', description: 'Description' }.merge(snippet_params)
      }.merge(additional_params)

      Snippet.last
    end

    it 'creates the snippet correctly' 


    context 'when the snippet description contains a file' do
      let(:picture_file) { '/-/system/temp/secret56/picture.jpg' }
      let(:text_file) { '/-/system/temp/secret78/text.txt' }
      let(:description) do
        "Description with picture: ![picture](/uploads#{picture_file}) and "\
        "text: [text.txt](/uploads#{text_file})"
      end

      before do
        allow(FileUtils).to receive(:mkdir_p)
        allow(FileUtils).to receive(:move)
      end

      subject { create_snippet({ description: description }, { files: [picture_file, text_file] }) }

      it 'creates the snippet' 


      it 'stores the snippet description correctly' 

    end

    context 'when the snippet is spam' do
      before do
        allow_any_instance_of(AkismetService).to receive(:spam?).and_return(true)
      end

      context 'when the snippet is private' do
        it 'creates the snippet' 

      end

      context 'when the snippet is public' do
        it 'rejects the shippet' 


        it 'creates a spam log' 


        it 'renders :new with recaptcha disabled' 


        context 'recaptcha enabled' do
          before do
            stub_application_setting(recaptcha_enabled: true)
          end

          it 'renders :verify with recaptcha enabled' 


          it 'renders snippet page when recaptcha verified' 

        end
      end
    end
  end

  describe 'PUT #update' do
    let(:project) { create :project }
    let(:snippet) { create :personal_snippet, author: user, project: project, visibility_level: visibility_level }

    def update_snippet(snippet_params = {}, additional_params = {})
      sign_in(user)

      put :update, {
        id: snippet.id,
        personal_snippet: { title: 'Title', content: 'Content' }.merge(snippet_params)
      }.merge(additional_params)

      snippet.reload
    end

    context 'when the snippet is spam' do
      before do
        allow_any_instance_of(AkismetService).to receive(:spam?).and_return(true)
      end

      context 'when the snippet is private' do
        let(:visibility_level) { Snippet::PRIVATE }

        it 'updates the snippet' 

      end

      context 'when a private snippet is made public' do
        let(:visibility_level) { Snippet::PRIVATE }

        it 'rejects the snippet' 


        it 'creates a spam log' 


        it 'renders :edit with recaptcha disabled' 


        context 'recaptcha enabled' do
          before do
            stub_application_setting(recaptcha_enabled: true)
          end

          it 'renders :verify with recaptcha enabled' 


          it 'renders snippet page when recaptcha verified' 

        end
      end

      context 'when the snippet is public' do
        let(:visibility_level) { Snippet::PUBLIC }

        it 'rejects the shippet' 


        it 'creates a spam log' 


        it 'renders :edit with recaptcha disabled' 


        context 'recaptcha enabled' do
          before do
            stub_application_setting(recaptcha_enabled: true)
          end

          it 'renders :verify with recaptcha enabled' 


          it 'renders snippet page when recaptcha verified' 

        end
      end
    end
  end

  describe 'POST #mark_as_spam' do
    let(:snippet) { create(:personal_snippet, :public, author: user) }

    before do
      allow_any_instance_of(AkismetService).to receive_messages(submit_spam: true)
      stub_application_setting(akismet_enabled: true)
    end

    def mark_as_spam
      admin = create(:admin)
      create(:user_agent_detail, subject: snippet)
      sign_in(admin)

      post :mark_as_spam, id: snippet.id
    end

    it 'updates the snippet' 

  end

  describe "GET #raw" do
    context 'when the personal snippet is private' do
      let(:personal_snippet) { create(:personal_snippet, :private, author: user) }

      context 'when signed in' do
        before do
          sign_in(user)
        end

        context 'when signed in user is not the author' do
          let(:other_author) { create(:author) }
          let(:other_personal_snippet) { create(:personal_snippet, :private, author: other_author) }

          it 'responds with status 404' 

        end

        context 'when signed in user is the author' do
          before do
            get :raw, id: personal_snippet.to_param
          end

          it 'responds with status 200' 


          it 'has expected headers' 

        end
      end

      context 'when not signed in' do
        it 'redirects to the sign in page' 

      end
    end

    context 'when the personal snippet is internal' do
      let(:personal_snippet) { create(:personal_snippet, :internal, author: user) }

      context 'when signed in' do
        before do
          sign_in(user)
        end

        it 'responds with status 200' 

      end

      context 'when not signed in' do
        it 'redirects to the sign in page' 

      end
    end

    context 'when the personal snippet is public' do
      let(:personal_snippet) { create(:personal_snippet, :public, author: user) }

      context 'when signed in' do
        before do
          sign_in(user)
        end

        it 'responds with status 200' 


        context 'CRLF line ending' do
          let(:personal_snippet) do
            create(:personal_snippet, :public, author: user, content: "first line\r\nsecond line\r\nthird line")
          end

          it 'returns LF line endings by default' 


          it 'does not convert line endings when parameter present' 

        end
      end

      context 'when not signed in' do
        it 'responds with status 200' 

      end
    end

    context 'when the personal snippet does not exist' do
      context 'when signed in' do
        before do
          sign_in(user)
        end

        it 'responds with status 404' 

      end

      context 'when not signed in' do
        it 'redirects to the sign in path' 

      end
    end
  end

  context 'award emoji on snippets' do
    let(:personal_snippet) { create(:personal_snippet, :public, author: user) }
    let(:another_user) { create(:user) }

    before do
      sign_in(another_user)
    end

    describe 'POST #toggle_award_emoji' do
      it "toggles the award emoji" 


      it "removes the already awarded emoji" 

    end
  end

  describe 'POST #preview_markdown' do
    let(:snippet) { create(:personal_snippet, :public) }

    it 'renders json in a correct format' 

  end
end

