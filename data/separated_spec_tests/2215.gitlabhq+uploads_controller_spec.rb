require 'spec_helper'
shared_examples 'content not cached without revalidation' do
  it 'ensures content will not be cached without revalidation' 

end

shared_examples 'content not cached without revalidation and no-store' do
  it 'ensures content will not be cached without revalidation' 

end

describe UploadsController do
  let!(:user) { create(:user, avatar: fixture_file_upload("spec/fixtures/dk.png", "image/png")) }

  describe 'POST create' do
    let(:model)   { 'personal_snippet' }
    let(:snippet) { create(:personal_snippet, :public) }
    let(:jpg)     { fixture_file_upload('spec/fixtures/rails_sample.jpg', 'image/jpg') }
    let(:txt)     { fixture_file_upload('spec/fixtures/doc_sample.txt', 'text/plain') }

    context 'when a user does not have permissions to upload a file' do
      it "returns 401 when the user is not logged in" 


      it "returns 404 when user can't comment on a snippet" 

    end

    context 'when a user is logged in' do
      before do
        sign_in(user)
      end

      it "returns an error without file" 


      it "returns an error with invalid model" 


      it "returns 404 status when object not found" 


      context 'with valid image' do
        before do
          post :create, model: 'personal_snippet', id: snippet.id, file: jpg, format: :json
        end

        it 'returns a content with original filename, new link, and correct type.' 


        it 'creates a corresponding Upload record' 

      end

      context 'with valid non-image file' do
        before do
          post :create, model: 'personal_snippet', id: snippet.id, file: txt, format: :json
        end

        it 'returns a content with original filename, new link, and correct type.' 


        it 'creates a corresponding Upload record' 

      end

      context 'temporal with valid image' do
        subject do
          post :create, model: 'personal_snippet', file: jpg, format: :json
        end

        it 'returns a content with original filename, new link, and correct type.' 


        it 'does not create an Upload record' 

      end

      context 'temporal with valid non-image file' do
        subject do
          post :create, model: 'personal_snippet', file: txt, format: :json
        end

        it 'returns a content with original filename, new link, and correct type.' 


        it 'does not create an Upload record' 

      end
    end
  end

  describe "GET show" do
    context 'Content-Disposition security measures' do
      let(:project) { create(:project, :public) }

      context 'for PNG files' do
        it 'returns Content-Disposition: inline' 

      end

      context 'for SVG files' do
        it 'returns Content-Disposition: attachment' 

      end
    end

    context "when viewing a user avatar" do
      context "when signed in" do
        before do
          sign_in(user)
        end

        context "when the user is blocked" do
          before do
            user.block
          end

          it "redirects to the sign in page" 

        end

        context "when the user isn't blocked" do
          it "responds with status 200" 


          it_behaves_like 'content not cached without revalidation and no-store' do
            subject do
              get :show, model: 'user', mounted_as: 'avatar', id: user.id, filename: 'dk.png'

              response
            end
          end
        end
      end

      context "when not signed in" do
        it "responds with status 200" 


        it_behaves_like 'content not cached without revalidation' do
          subject do
            get :show, model: 'user', mounted_as: 'avatar', id: user.id, filename: 'dk.png'

            response
          end
        end
      end
    end

    context "when viewing a project avatar" do
      let!(:project) { create(:project, avatar: fixture_file_upload("spec/fixtures/dk.png", "image/png")) }

      context "when the project is public" do
        before do
          project.update_attribute(:visibility_level, Project::PUBLIC)
        end

        context "when not signed in" do
          it "responds with status 200" 


          it_behaves_like 'content not cached without revalidation' do
            subject do
              get :show, model: 'project', mounted_as: 'avatar', id: project.id, filename: 'dk.png'

              response
            end
          end
        end

        context "when signed in" do
          before do
            sign_in(user)
          end

          it "responds with status 200" 


          it_behaves_like 'content not cached without revalidation and no-store' do
            subject do
              get :show, model: 'project', mounted_as: 'avatar', id: project.id, filename: 'dk.png'

              response
            end
          end
        end
      end

      context "when the project is private" do
        before do
          project.update_attribute(:visibility_level, Project::PRIVATE)
        end

        context "when not signed in" do
          it "redirects to the sign in page" 

        end

        context "when signed in" do
          before do
            sign_in(user)
          end

          context "when the user has access to the project" do
            before do
              project.add_maintainer(user)
            end

            context "when the user is blocked" do
              before do
                user.block
                project.add_maintainer(user)
              end

              it "redirects to the sign in page" 

            end

            context "when the user isn't blocked" do
              it "responds with status 200" 


              it_behaves_like 'content not cached without revalidation and no-store' do
                subject do
                  get :show, model: 'project', mounted_as: 'avatar', id: project.id, filename: 'dk.png'

                  response
                end
              end
            end
          end

          context "when the user doesn't have access to the project" do
            it "responds with status 404" 

          end
        end
      end
    end

    context "when viewing a group avatar" do
      let!(:group)   { create(:group, avatar: fixture_file_upload("spec/fixtures/dk.png", "image/png")) }

      context "when the group is public" do
        context "when not signed in" do
          it "responds with status 200" 


          it_behaves_like 'content not cached without revalidation' do
            subject do
              get :show, model: 'group', mounted_as: 'avatar', id: group.id, filename: 'dk.png'

              response
            end
          end
        end

        context "when signed in" do
          before do
            sign_in(user)
          end

          it "responds with status 200" 


          it_behaves_like 'content not cached without revalidation and no-store' do
            subject do
              get :show, model: 'group', mounted_as: 'avatar', id: group.id, filename: 'dk.png'

              response
            end
          end
        end
      end

      context "when the group is private" do
        before do
          group.update_attribute(:visibility_level, Gitlab::VisibilityLevel::PRIVATE)
        end

        context "when signed in" do
          before do
            sign_in(user)
          end

          context "when the user has access to the project" do
            before do
              group.add_developer(user)
            end

            context "when the user is blocked" do
              before do
                user.block
              end

              it "redirects to the sign in page" 

            end

            context "when the user isn't blocked" do
              it "responds with status 200" 


              it_behaves_like 'content not cached without revalidation and no-store' do
                subject do
                  get :show, model: 'group', mounted_as: 'avatar', id: group.id, filename: 'dk.png'

                  response
                end
              end
            end
          end

          context "when the user doesn't have access to the project" do
            it "responds with status 404" 

          end
        end
      end
    end

    context "when viewing a note attachment" do
      let!(:note) { create(:note, :with_attachment) }
      let(:project) { note.project }

      context "when the project is public" do
        before do
          project.update_attribute(:visibility_level, Project::PUBLIC)
        end

        context "when not signed in" do
          it "responds with status 200" 


          it_behaves_like 'content not cached without revalidation' do
            subject do
              get :show, model: 'note', mounted_as: 'attachment', id: note.id, filename: 'dk.png'

              response
            end
          end
        end

        context "when signed in" do
          before do
            sign_in(user)
          end

          it "responds with status 200" 


          it_behaves_like 'content not cached without revalidation and no-store' do
            subject do
              get :show, model: 'note', mounted_as: 'attachment', id: note.id, filename: 'dk.png'

              response
            end
          end
        end
      end

      context "when the project is private" do
        before do
          project.update_attribute(:visibility_level, Project::PRIVATE)
        end

        context "when not signed in" do
          it "redirects to the sign in page" 

        end

        context "when signed in" do
          before do
            sign_in(user)
          end

          context "when the user has access to the project" do
            before do
              project.add_maintainer(user)
            end

            context "when the user is blocked" do
              before do
                user.block
                project.add_maintainer(user)
              end

              it "redirects to the sign in page" 

            end

            context "when the user isn't blocked" do
              it "responds with status 200" 


              it_behaves_like 'content not cached without revalidation and no-store' do
                subject do
                  get :show, model: 'note', mounted_as: 'attachment', id: note.id, filename: 'dk.png'

                  response
                end
              end
            end
          end

          context "when the user doesn't have access to the project" do
            it "responds with status 404" 

          end
        end
      end
    end

    context 'Appearance' do
      context 'when viewing a custom header logo' do
        let!(:appearance) { create :appearance, header_logo: fixture_file_upload('spec/fixtures/dk.png', 'image/png') }

        context 'when not signed in' do
          it 'responds with status 200' 


          it_behaves_like 'content not cached without revalidation' do
            subject do
              get :show, model: 'appearance', mounted_as: 'header_logo', id: appearance.id, filename: 'dk.png'

              response
            end
          end
        end
      end

      context 'when viewing a custom logo' do
        let!(:appearance) { create :appearance, logo: fixture_file_upload('spec/fixtures/dk.png', 'image/png') }

        context 'when not signed in' do
          it 'responds with status 200' 


          it_behaves_like 'content not cached without revalidation' do
            subject do
              get :show, model: 'appearance', mounted_as: 'logo', id: appearance.id, filename: 'dk.png'

              response
            end
          end
        end
      end
    end

    context 'original filename or a version filename must match' do
      let!(:appearance) { create :appearance, favicon: fixture_file_upload('spec/fixtures/dk.png', 'image/png') }

      context 'has a valid filename on the original file' do
        it 'successfully returns the file' 

      end

      context 'has an invalid filename on the original file' do
        it 'returns a 404' 

      end
    end
  end
end

