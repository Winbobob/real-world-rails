require 'spec_helper'

describe TagSetNominationsController do
  include LoginMacros
  include RedirectExpectationHelper

  let(:tag_set_nomination) { FactoryGirl.create(:tag_set_nomination) }
  let(:owned_tag_set) { tag_set_nomination.owned_tag_set }

  let(:tag_nominator_pseud) { tag_set_nomination.pseud }
  let(:tag_nominator) { tag_nominator_pseud.user }
  let(:mod_pseud) {
    FactoryGirl.create(:pseud).tap do |pseud|
      owned_tag_set.add_moderator(pseud)
      owned_tag_set.save!
    end
  }
  let(:moderator) { mod_pseud.user }

  let(:random_user) { FactoryGirl.create(:user) }

  describe 'GET index' do
    context 'user is not logged in' do
      it 'redirects and returns an error message' 

    end

    context 'user is logged in' do
      before do
        fake_login_known_user(user)
      end

      context 'user_id param is truthy' do
        let(:user) { tag_nominator }

        context 'user_id does not match logged in user' do
          it 'redirects and returns an error message' 

        end

        context 'user_id matches logged in user' do
          before do
            get :index, params: { user_id: tag_nominator.login, tag_set_id: owned_tag_set.id }
          end

          it 'renders the index template' 


          it 'returns expected tag set nominations' 

        end
      end

      context 'user_id param is falsey' do
        context 'tag set exists' do
          context 'logged in user is moderator' do
            let(:user) { moderator.reload }

            it 'renders the index template' 


            context 'no unreviewed tag_nominations' do
              it 'returns a flash notice about no unreviewed nominations' 

            end

            context 'unreviewed tag_nominations exist' do
              it 'does not return a flash notice about no unreviewed nominations' 


              context 'tag set freeform_nomination_limit is > 0' do
                before do
                  owned_tag_set.update_column(:freeform_nomination_limit, 1)
                end

                context 'unreviewed freeform_nominations' do
                  context 'unreviewed freeform nominations <= 30' do
                    before do
                      add_unreviewed_freeform_nominations(30)
                      get :index, params: { tag_set_id: owned_tag_set.id }
                    end

                    it 'returns all freeform nominations in order' 


                    it 'does not return a flash notice about too many nominations' 

                  end

                  context 'unreviewed freeform nominations > 30' do
                    before do
                      add_unreviewed_freeform_nominations(31)
                      get :index, params: { tag_set_id: owned_tag_set.id }
                    end

                    it 'returns 30 freeform nominations' 


                    it 'returns a flash notice about too many nominations' 

                  end

                  def add_unreviewed_freeform_nominations(num)
                    num.times do |i|
                      FreeformNomination.create(tag_set_nomination: tag_set_nomination, tagname: "New Freeform #{i}")
                    end
                  end
                end

                context 'reviewed freeform_nominations' do
                  it 'does not return freeform nominations' 

                end
              end

              context 'tag set freeform_nomination_limit is 0' do
                it 'does not return freeform nominations' 

              end

              context 'tag set fandom_nomination_limit is > 0' do
                before do
                  owned_tag_set.update_column(:fandom_nomination_limit, 1)
                  owned_tag_set.update_column(:character_nomination_limit, 1)
                  owned_tag_set.update_column(:relationship_nomination_limit, 1)

                  add_fandom_nominations(fandom_nom_num, fandom_nom_status)
                  CharacterNomination.create(tag_set_nomination: tag_set_nomination,
                                             fandom_nomination: FandomNomination.last, tagname: 'Unreviewed Character')
                  RelationshipNomination.create(tag_set_nomination: tag_set_nomination,
                                                fandom_nomination: FandomNomination.last, tagname: 'Unreviewed Relationship')
                end

                context 'unreviewed fandom nominations' do
                  let(:fandom_nom_status) { :unreviewed }

                  before do
                    get :index, params: { tag_set_id: owned_tag_set.id }
                  end

                  context 'unreviewed fandom nominations <= 30' do
                    let(:fandom_nom_num) { 30 }

                    it 'returns all fandom nominations in order' 


                    it 'does not return associated character and relationship nominations' 


                    it 'does not return a flash notice about too many nominations' 

                  end

                  context 'unreviewed fandom nominations > 30' do
                    let(:fandom_nom_num) { 31 }

                    it 'returns 30 fandom nominations' 


                    it 'returns a flash notice about too many nominations' 

                  end
                end

                context 'rejected fandom nominations' do
                  let(:fandom_nom_num) { 1 }
                  let(:fandom_nom_status) { :rejected }

                  before do
                    get :index, params: { tag_set_id: owned_tag_set.id }
                  end

                  it 'does not return fandom nominations' 


                  it 'does not return associated character and relationship nominations' 

                end

                context 'approved fandom nominations' do
                  let(:fandom_nom_num) { 1 }
                  let(:fandom_nom_status) { :approved }

                  it 'does not return fandom nominations' 


                  it 'does not return associated reviewed character and relationship nominations' 


                  context 'character_ and relationship_nomination_limit are > 0' do
                    it 'returns associated unreviewed character and relationship nominations' 

                  end

                  context 'either character_ or relationship_nomination_limit is > 0' do
                    it 'returns associated unreviewed character and relationship nominations' 

                  end

                  context 'character_ and relationship_nomination_limit are 0' do
                    it 'does not return associated character and relationship nominations' 

                  end
                end

                def add_fandom_nominations(num, status)
                  num.times do |i|
                    fandom_nom = FandomNomination.create(tag_set_nomination: tag_set_nomination, tagname: "New Fandom #{i}")
                    fandom_nom.update_column(status, true) if status != :unreviewed
                  end
                end
              end

              context 'tag set fandom_nomination_limit is 0' do
                let(:fandom_nom) { FandomNomination.create(tag_set_nomination: tag_set_nomination, tagname: 'New Fandom') }

                before do
                  owned_tag_set.update_column(:fandom_nomination_limit, 0)
                end

                context 'character_ and relationship_nomination_limit are > 0' do
                  before do
                    owned_tag_set.update_column(:character_nomination_limit, 1)
                    owned_tag_set.update_column(:relationship_nomination_limit, 1)
                  end

                  context 'unreviewed character and relationship nominations <= 30' do
                    before do
                      add_unreviewed_character_nominations(30)
                      add_unreviewed_relationship_nominations(30)
                      get :index, params: { tag_set_id: owned_tag_set.id }
                    end

                    it 'returns all ordered character and relationship nominations' 


                    it 'does not return a flash notice about too many nominations' 

                  end

                  context 'unreviewed character or relationship nominations > 30' do
                    before do
                      add_unreviewed_character_nominations(1)
                      add_unreviewed_relationship_nominations(31)
                      get :index, params: { tag_set_id: owned_tag_set.id }
                    end

                    it 'returns 30 character and relationship nominations' 


                    it 'returns a flash notice about too many nominations' 

                  end
                end

                context 'character_nomination_limit is 0' do
                  it 'does not return character nominations' 

                end

                context 'relationship_nomination_limit is 0' do
                  it 'does not return relationship nominations' 

                end

                def add_unreviewed_character_nominations(num)
                  num.times do |i|
                    CharacterNomination.create(tag_set_nomination: tag_set_nomination, fandom_nomination: fandom_nom,
                                               tagname: "New Character #{i}")
                  end
                end

                def add_unreviewed_relationship_nominations(num)
                  num.times do |i|
                    RelationshipNomination.create(tag_set_nomination: tag_set_nomination, fandom_nomination: fandom_nom,
                                                  tagname: "New Relationship #{i}")
                  end
                end
              end
            end
          end

          context 'logged in user is not moderator' do
            let(:user) { random_user }

            it 'redirects and returns an error message' 

          end
        end

        context 'no tag set' do
          let(:user) { random_user }

          it 'redirects and returns an error message' 

        end
      end
    end
  end

  describe 'GET show' do
    context 'user is not logged in' do
      it 'redirects and returns an error message' 

    end

    context 'user is logged in' do
      context 'invalid params' do
        before do
          fake_login_known_user(tag_nominator)
        end

        context 'no tag set' do
          it 'redirects and returns an error message' 

        end

        context 'no tag set nomination' do
          it 'redirects and returns an error message' 

        end
      end

      context 'valid params' do
        context 'user is not associated with nomination' do
          before do
            fake_login_known_user(random_user)
          end

          it 'redirects and returns an error message' 

        end

        context 'user is author of nomination' do
          before do
            fake_login_known_user(tag_nominator.reload)
          end

          it 'renders the show template' 

        end

        context 'user is moderator of tag set' do
          before do
            fake_login_known_user(moderator.reload)
          end

          it 'renders the show template' 

        end
      end
    end
  end

  describe 'GET new' do
    context 'user is not logged in' do
      it 'redirects and returns an error message' 

    end

    context 'user is logged in' do
      context 'invalid params' do
        context 'no tag set' do
          it 'redirects and returns an error message' 

        end
      end

      context 'valid params' do
        context 'user already has nominated tags for tag set' do
          before do
            fake_login_known_user(tag_nominator)
            get :new, params: { tag_set_id: owned_tag_set.id }
          end

          it 'redirects to edit page' 


          it 'does not build a new tag set nomination' 

        end

        context 'user has not yet nominated tags for tag set' do
          before do
            fake_login_known_user(random_user)
          end

          it 'renders the new template' 


          it 'builds a new tag set nomination' 


          it 'builds new freeform nominations until freeform_nomination_limit' 


          context 'fandom_nomination_limit is > 0' do
            before do
              owned_tag_set.update_column(:fandom_nomination_limit, 2)
              owned_tag_set.update_column(:character_nomination_limit, 3)
              owned_tag_set.update_column(:relationship_nomination_limit, 1)
              get :new, params: { tag_set_id: owned_tag_set.id }
            end

            it 'builds new fandom nominations until fandom_nomination_limit' 


            it 'builds new character nominations for each fandom nomination' 


            it 'builds new relationship nominations for each fandom nomination' 

          end

          context 'fandom_nomination_limit is 0' do
            before do
              owned_tag_set.update_column(:fandom_nomination_limit, 0)
              owned_tag_set.update_column(:character_nomination_limit, 2)
              owned_tag_set.update_column(:relationship_nomination_limit, 3)
              get :new, params: { tag_set_id: owned_tag_set.id }
            end

            it 'does not build new fandom nominations' 


            it 'builds new character nominations until character_nomination_limit' 


            it 'builds new relationship nominations until relationship_nomination_limit' 

          end
        end
      end
    end
  end

  describe 'GET edit' do
    context 'user is not logged in' do
      it 'redirects and returns an error message' 

    end

    context 'user is logged in' do
      context 'invalid params' do
        before do
          fake_login_known_user(tag_nominator)
        end

        context 'no tag set' do
          it 'redirects and returns an error message' 

        end

        context 'no tag set nomination' do
          it 'redirects and returns an error message' 

        end
      end

      context 'valid params' do
        let(:fandom_nom) { FandomNomination.create(tag_set_nomination: tag_set_nomination, tagname: 'New Fandom') }

        context 'user is not associated with nomination' do
          before do
            fake_login_known_user(random_user)
          end

          it 'redirects and returns an error message' 

        end

        context 'user is author of nomination' do
          before do
            fake_login_known_user(tag_nominator.reload)
            owned_tag_set.update_column(:fandom_nomination_limit, 1)
            owned_tag_set.update_column(:character_nomination_limit, 3)
            owned_tag_set.update_column(:relationship_nomination_limit, 2)
            owned_tag_set.update_column(:freeform_nomination_limit, 4)
          end

          it 'renders the edit template' 


          context 'number of tag nominations matches limits specified on tag set' do
            before do
              add_character_nominations(owned_tag_set.character_nomination_limit)
              add_relationship_nominations(owned_tag_set.relationship_nomination_limit)
              add_freeform_nominations(owned_tag_set.freeform_nomination_limit)

              get :edit, params: { id: tag_set_nomination.id, tag_set_id: owned_tag_set.id }
            end

            it 'returns only existing associated tag nominations' 

          end

          context 'fewer tag nominations than limit specified on tag set' do
            before do
              add_character_nominations(1)
              add_relationship_nominations(1)
              add_freeform_nominations(1)

              get :edit, params: { id: tag_set_nomination.id, tag_set_id: owned_tag_set.id }
            end

            it 'returns existing associated tag nominations' 


            it 'builds new tag nominations until _nomination_limit is reached' 

          end
        end

        context 'user is moderator of tag set' do
          before do
            fake_login_known_user(moderator.reload)
            owned_tag_set.update_column(:fandom_nomination_limit, 1)
            add_character_nominations(1)
            add_relationship_nominations(1)
            add_freeform_nominations(1)

            get :edit, params: { id: tag_set_nomination.id, tag_set_id: owned_tag_set.id }
          end

          it 'renders the edit template' 


          it 'returns associated tag nominations' 

        end

        def add_character_nominations(num)
          num.times do |i|
            CharacterNomination.create(tag_set_nomination: tag_set_nomination, fandom_nomination: fandom_nom,
                                       tagname: "New Character #{i}")
          end
        end

        def add_relationship_nominations(num)
          num.times do |i|
            RelationshipNomination.create(tag_set_nomination: tag_set_nomination, fandom_nomination: fandom_nom,
                                          tagname: "New Relationship #{i}")
          end
        end

        def add_freeform_nominations(num)
          num.times do |i|
            FreeformNomination.create(tag_set_nomination: tag_set_nomination, tagname: "New Freeform #{i}")
          end
        end
      end
    end
  end

  describe 'POST create' do
    context 'user is not logged in' do
      it 'redirects and returns an error message' 

    end

    context 'user is logged in' do
      context 'invalid params' do
        before do
          fake_login_known_user(random_user)
        end

        context 'no tag set' do
          it 'redirects and returns an error message' 

        end

        context 'pseud_id param does not match user' do
          it 'redirects and returns an error message' 

        end
      end

      context 'valid params' do
        before do
          fake_login_known_user(random_user)
        end

        context "success when fandom_nomination_limit is 0" do
          let(:owned_tag_set) do
            create(:owned_tag_set,
                   fandom_nomination_limit: 0,
                   character_nomination_limit: 1,
                   relationship_nomination_limit: 1)
          end

          let(:new_nomination) { owned_tag_set.tag_set_nominations.first }

          before do
            post :create, params: {
                 tag_set_id: owned_tag_set.id,
                 tag_set_nomination: {
                   pseud_id: random_user.default_pseud.id,
                   owned_tag_set_id: owned_tag_set.id,
                   character_nominations_attributes: {
                     "0": {
                       tagname: "Character A",
                       parent_tagname: "Fandom A"
                     }
                   },
                   relationship_nominations_attributes: {
                     "0": {
                       tagname: "Characters B & C",
                       parent_tagname: "Fandom B"
                     }
                   }
                 }
                }

            owned_tag_set.reload
          end

          it "creates the new tag set nomination" 


          it "creates the character and relationship nominations" 


          it "does not create a fandom nomination" 


          it "redirects and returns a success message" 

        end

        context "success when fandom_nomination_limit > 0" do
          before do
            owned_tag_set.update_column(:character_nomination_limit, 1)
            post :create, params: {
                 tag_set_id: owned_tag_set.id,
                 tag_set_nomination: { pseud_id: random_user.default_pseud.id,
                                       owned_tag_set_id: owned_tag_set.id,
                                       fandom_nominations_attributes: {
                                         '0': { tagname: 'New Fandom',
                                                character_nominations_attributes: {
                                                  '0': { tagname: 'New Character',
                                                         from_fandom_nomination: true }
                                                } }
                                       } }
            }
          end

          it 'creates a new tag set nomination' 


          it 'creates associated tag nominations' 


          it 'redirects and returns a success message' 

        end

        context 'tag set nomination save fails' do
          before do
            owned_tag_set.update_column(:nominated, false)
          end

          it 'renders the new template' 


          it 'builds a new tag set nomination' 


          it 'builds new tag nominations until limits' 

        end
      end
    end
  end

  describe 'PUT update' do
    context 'user is not logged in' do
      it 'redirects and returns an error message' 

    end

    context 'user is logged in' do
      context 'invalid params' do
        before do
          fake_login_known_user(tag_nominator)
        end

        context 'no tag set' do
          it 'redirects and returns an error message' 

        end

        context 'pseud_id param does not match user' do
          it 'redirects and returns an error message' 

        end

        context 'no tag set nomination' do
          it 'redirects and returns an error message' 

        end
      end

      context 'valid params' do
        let(:fandom_nom) { FandomNomination.create(tag_set_nomination: tag_set_nomination, tagname: 'New Fandom') }

        context 'user is not associated with nomination' do
          before do
            fake_login_known_user(random_user)
          end

          it 'redirects and returns an error message' 

        end

        context 'user is author of nomination' do
          before do
            fake_login_known_user(tag_nominator.reload)
          end

          context "success when fandom_nomination_limit is 0" do
            let(:owned_tag_set) do
              create(:owned_tag_set,
                     fandom_nomination_limit: 0,
                     character_nomination_limit: 1,
                     relationship_nomination_limit: 1)
            end

            let(:tag_set_nom) do
              TagSetNomination.create(owned_tag_set: owned_tag_set,
                                      pseud: random_user.default_pseud)
            end

            let(:character_nom) do
              CharacterNomination.create(tag_set_nomination: tag_set_nom,
                                         tagname: "Character A",
                                         parent_tagname: "Fandom A")
            end

            let(:relationship_nom) do
              RelationshipNomination.create(tag_set_nomination: tag_set_nom,
                                            tagname: "Characters B & C",
                                            parent_tagname: "Fandom B")
            end

            before do
              fake_login_known_user(tag_set_nom.pseud.user)

              post :update, params: {
                   tag_set_id: owned_tag_set.id,
                   id: tag_set_nom.id,
                   tag_set_nomination: {
                     pseud_id: tag_set_nom.pseud.id,
                     owned_tag_set_id: owned_tag_set.id,
                     character_nominations_attributes: {
                       "0": {
                         id: character_nom.id,
                         tagname: "Character D",
                         parent_tagname: "Fandom C"
                       }
                     },
                     relationship_nominations_attributes: {
                       "0": {
                         id: relationship_nom.id,
                         tagname: "Characters E & F",
                         parent_tagname: "Fandom D"
                       }
                     }
                   }
                 }

              owned_tag_set.reload
              tag_set_nom.reload
              character_nom.reload
              relationship_nom.reload
            end

            it "does not create new nominations" 


            it "modifies the character and relationship nominations" 


            it "redirects and returns a success message" 

          end

          context "success when fandom_nomination_limit > 0" do
            let!(:character_nom) { CharacterNomination.create(tag_set_nomination: tag_set_nomination,
                                                              fandom_nomination: fandom_nom, tagname: 'New Character') }

            before do
              owned_tag_set.update_column(:character_nomination_limit, 1)
              put :update, params: {
                  tag_set_id: owned_tag_set.id,
                  id: tag_set_nomination.id,
                  tag_set_nomination: { pseud_id: tag_nominator_pseud.id,
                                        owned_tag_set_id: owned_tag_set.id,
                                        fandom_nominations_attributes: {
                                          '0': { tagname: 'Renamed Fandom',
                                                 id: fandom_nom.id,
                                                 character_nominations_attributes: {
                                                   '0': { tagname: 'Renamed Character',
                                                          id: character_nom.id,
                                                          from_fandom_nomination: true }
                                                 } }
                                        } }
                  }
            end

            it 'updates the tag set nomination and associated tag nominations' 


            it 'redirects and returns a success message' 

          end

          context 'tag set nomination save fails' do
            before do
              owned_tag_set.update_column(:nominated, false)
              owned_tag_set.update_column(:fandom_nomination_limit, 1)
              owned_tag_set.update_column(:character_nomination_limit, 2)
              owned_tag_set.update_column(:relationship_nomination_limit, 3)
              owned_tag_set.update_column(:freeform_nomination_limit, 1)

              put :update, params: {
                  tag_set_id: owned_tag_set.id,
                  id: tag_set_nomination.id,
                  tag_set_nomination: { pseud_id: tag_nominator_pseud.id,
                                        owned_tag_set_id: owned_tag_set.id }
                }
            end

            it 'builds new tag nominations until limits' 


            it 'renders the edit template' 

          end
        end

        context 'user is moderator of tag set' do
          let!(:character_nom) { CharacterNomination.create(tag_set_nomination: tag_set_nomination,
                                                            fandom_nomination: fandom_nom, tagname: 'New Character') }

          before do
            fake_login_known_user(moderator.reload)
            owned_tag_set.update_column(:character_nomination_limit, 1)
            put :update, params: {
                tag_set_id: owned_tag_set.id,
                id: tag_set_nomination.id,
                tag_set_nomination: { pseud_id: mod_pseud.id,
                                      owned_tag_set_id: owned_tag_set.id,
                                      fandom_nominations_attributes: {
                                        '0': { tagname: 'Renamed Fandom',
                                               id: fandom_nom.id,
                                               character_nominations_attributes: {
                                                 '0': { tagname: 'Renamed Character',
                                                        id: character_nom.id,
                                                        from_fandom_nomination: true }
                                               } }
                                      } }
            }
          end

          it 'updates the tag set nomination and associated tag nominations' 


          it 'redirects and returns a success message' 

        end
      end
    end
  end

  describe 'DELETE destroy' do
    context 'user is not logged in' do
      it 'redirects and returns an error message' 

    end

    context 'user is logged in' do
      context 'invalid params' do
        before do
          fake_login_known_user(tag_nominator)
        end

        context 'no tag set' do
          it 'redirects and returns an error message' 

        end

        context 'no tag set nomination' do
          it 'redirects and returns an error message' 

        end
      end

      context 'valid params' do
        before do
          allow(TagSetNomination).to receive(:find_by_id) { tag_set_nomination }
        end

        context 'user is not moderator of tag set' do
          before do
            fake_login_known_user(tag_nominator.reload)
          end

          context 'at least one tag nomination associated with tag_set_nomination is reviewed' do
            before do
              allow(tag_set_nomination).to receive(:unreviewed?) { false }
            end

            it 'does not delete the tag set nomination' 


            it 'redirects and returns an error message' 

          end

          context 'all tag nominations associated with tag_set_nomination are unreviewed' do
            before do
              allow(tag_set_nomination).to receive(:unreviewed?) { true }
            end

            it 'deletes the tag set nomination' 


            it 'redirects and returns a success message' 

          end
        end

        context 'user is moderator of tag set' do
          before do
            allow(tag_set_nomination).to receive(:unreviewed?) { false }
            fake_login_known_user(moderator.reload)
          end

          it 'deletes the tag set nomination' 


          it 'redirects and returns a success message' 

        end
      end
    end
  end

  describe 'GET confirm_destroy_multiple' do
    context 'user is not logged in' do
      it 'redirects and returns an error message' 

    end

    context 'user is logged in' do
      before do
        fake_login_known_user(random_user)
      end

      context 'invalid params' do
        context 'no tag set' do
          it 'redirects and returns an error message' 

        end
      end

      context 'valid params' do
        it 'renders the confirm_destroy_multiple template' 

      end
    end
  end

  describe 'DELETE destroy_multiple' do
    before do
      allow(OwnedTagSet).to receive(:find_by_id).with(owned_tag_set.id.to_s) { owned_tag_set }
      allow(owned_tag_set).to receive(:clear_nominations!)
    end

    context 'user is not logged in' do
      it 'redirects and returns an error message' 

    end

    context 'logged in user is owner of tag set' do
      before do
        fake_login_known_user(owned_tag_set.owners.first.user)
        delete :destroy_multiple, params: { tag_set_id: owned_tag_set.id }
      end

      it 'deletes all associated tag nominations' 


      it 'redirects and returns a success message' 

    end

    context 'logged in user is not owner of tag set' do
      before do
        fake_login_known_user(moderator)
        delete :destroy_multiple, params: { tag_set_id: owned_tag_set.id }
      end

      it 'redirects and returns an error message' 


      it 'does not delete associated tag nominations' 

    end
  end

  describe 'PUT update_multiple' do
    context 'user is not logged in' do
      it 'redirects and returns an error message' 

    end

    context 'logged in user is moderator of tag set' do
      let(:fandom_nom) { FandomNomination.create(tag_set_nomination: tag_set_nomination, tagname: 'New Fandom') }
      let!(:character_nom1) { CharacterNomination.create(tag_set_nomination: tag_set_nomination,
                                                         fandom_nomination: fandom_nom,
                                                         tagname: 'New Character 1') }
      let!(:character_nom2) { CharacterNomination.create(tag_set_nomination: tag_set_nomination,
                                                         fandom_nomination: fandom_nom,
                                                         tagname: 'New Character 2') }
      let!(:relationship_nom) { RelationshipNomination.create(tag_set_nomination: tag_set_nomination,
                                                              fandom_nomination: fandom_nom,
                                                              tagname: 'New Relationship') }
      let!(:freeform_nom) { FreeformNomination.create(tag_set_nomination: tag_set_nomination, tagname: 'New Freeform') }
      let(:base_params) { { 'character_change_New Character 1': '',
                            'character_change_New Character 2': '',
                            'relationship_change_New Relationship': '',
                            'fandom_change_New Fandom': '',
                            'freeform_change_New Freeform': '' } }

      before do
        fake_login_known_user(moderator.reload)
      end

      context 'not all tag nominations have an associated _approve, _reject, _change, or _synonym param value' do
        it 'redirects and returns a flash message' 

      end

      context 'all tag nominations have an associated _approve, _reject, _change, or _synonym param value' do
        it 'redirects and returns a flash message' 

      end

      context 'tag nomination _reject param has a value' do
        before do
          put :update_multiple, params: { tag_set_id: owned_tag_set.id }.merge(base_params).
            merge('relationship_reject_New Relationship': 1)
        end

        it 'updates tag_nomination.rejected to true' 


        it 'returns a success message' 

      end

      context 'tag nomination _approve param has a value' do
        context 'approving the tag nomination is successful' do
          before do
            put :update_multiple, params: { tag_set_id: owned_tag_set.id }.merge(base_params).
              merge('fandom_approve_New Fandom': 1, 'character_approve_New Character 2': 1)
          end

          it 'updates tag_nomination.approved to true' 


          it 'returns a success message' 

        end

        context 'approving the tag nomination fails' do
          before do
            allow(OwnedTagSet).to receive(:find_by_id).with(owned_tag_set.id.to_s) { owned_tag_set }
            allow(owned_tag_set).to receive(:add_tagnames).with('fandom', ['New Fandom']) { false }
            put :update_multiple, params: { tag_set_id: owned_tag_set.id }.merge(base_params).
              merge('fandom_approve_New Fandom': 1, 'character_approve_New Character 2': 1)
          end

          it 'renders the index template and returns an error message' 

        end

        context 'other tag nominations exist in tag set that go by a synonym of the approved nom' do
          before do
            character_nom1.update_column(:synonym, 'New Character 2')
          end

          context 'name change is successful' do
            it 'calls TagNomination.change_tagname! with old and new tagnames' 

          end

          context 'name change fails' do
            it 'renders the index template and returns an error message' 

          end
        end
      end

      context 'tag nomination _approve and _reject params have a value' do
        before do
          put :update_multiple, params: { tag_set_id: owned_tag_set.id }.merge(base_params).
            merge('relationship_approve_New Relationship': 1, 'relationship_reject_New Relationship': 2)
        end

        it 'renders the index template' 


        it 'returns expected errors' 

      end

      context 'tag nomination _change param is not empty' do
        context '_change param = current tag nomination tagname' do
          it 'does not update the tag nomination' 

        end

        context '_change param is different from current tag nomination tagname' do
          context 'new name is invalid' do
            before do
              put :update_multiple, params: { tag_set_id: owned_tag_set.id }.
                merge(base_params).merge('freeform_change_New Freeform': 'N*w Fr**f*rm')
            end

            it 'renders the index template' 


            it 'returns expected errors' 

          end

          context 'no tag nomination associated with name' do
            before do
              put :update_multiple, params: { tag_set_id: owned_tag_set.id }.merge(base_params).
                merge('freeform_change_A Freeform Masquerade': 'Different Freeform')
            end

            it 'renders the index template' 


            it 'returns expected errors' 

          end

          context 'new name is valid' do
            context 'name change is successful' do
              before do
                allow(TagNomination).to receive(:change_tagname!).and_call_original
                put :update_multiple, params: { tag_set_id: owned_tag_set.id }.merge(base_params).
                  merge('freeform_change_New Freeform': 'Different Freeform')
              end

              it 'calls TagNomination.change_tagname! with _change param value' 


              it 'updates tag_nomination.approved to true' 


              it 'returns a success message' 

            end

            context 'name change is not successful' do
              before do
                allow(TagNomination).to receive(:change_tagname!) { false }
                put :update_multiple, params: { tag_set_id: owned_tag_set.id }.merge(base_params).
                  merge('freeform_change_New Freeform': 'Different Freeform')
              end

              it 'renders the index template' 


              it 'returns an error message' 

            end
          end
        end
      end

      context 'tag nomination _synonym param is not empty' do
        context '_synonym param = current tag nomination tagname' do
          it 'does not update the tag nomination' 

        end

        context '_synonym param is different from current tag nomination tagname' do
          context 'new name is invalid' do
            before do
              put :update_multiple, params: { tag_set_id: owned_tag_set.id }.merge(base_params).
                merge('freeform_synonym_New Freeform': 'N*w Fr**f*rm')
            end

            it 'renders the index template' 


            it 'returns expected errors' 

          end

          context 'no tag nomination associated with name' do
            before do
              put :update_multiple, params: { tag_set_id: owned_tag_set.id }.merge(base_params).
                merge('freeform_synonym_A Freeform Masquerade': 'Different Freeform')
            end

            it 'renders the index template' 


            it 'returns expected errors' 

          end

          context 'new name is valid' do
            before do
              freeform_nom.update_column(:synonym, 'Different Freeform')
              put :update_multiple, params: { tag_set_id: owned_tag_set.id }.merge(base_params).
                merge('freeform_synonym_New Freeform': 'Different Freeform')
            end

            it 'updates tag_nomination.approved to true' 


            it 'returns a success message' 

          end
        end
      end
    end

    context 'logged in user is not moderator of tag set' do
      before do
        fake_login_known_user(tag_nominator)
        put :update_multiple, params: { tag_set_id: owned_tag_set.id }
      end

      it 'redirects and returns an error message' 

    end
  end
end

