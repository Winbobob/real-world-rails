require 'spec_helper'

describe ::Skills::UserSkillRates::Update do
  subject do
    described_class.new(
      user_skill_rate_id: user_skill_rate.id,
      params: params
    )
  end

  describe '#call' do
    let(:user) { create(:user) }
    let(:user_skill_rate) do
      create(:user_skill_rate, note: 'abc', rate: 0, favorite: false, user: user)
    end
    let(:params) do
      {
        id: user_skill_rate.id,
        note: 'def',
        rate: 1,
        favorite: true
      }
    end

    it 'updates note on user rate skill' 


    it 'updates favorite on user rate skill' 


    it 'updates favorite on user favorite skill' 


    context "when user_skill_rate_content doesn't exist today" do
      let(:last_content) { user_skill_rate.contents.last }

      it 'creates new user_skill_rate_content' 


      it 'sets correct values on new content', :aggregate_failures do
        subject.call
        user_skill_rate.reload
        expect(last_content.favorite).to eq(user_skill_rate.favorite)
        expect(last_content.note).to eq(user_skill_rate.note)
        expect(last_content.rate).to eq(user_skill_rate.rate)
      end
    end

    context 'when user_skill_rate_content exists today' do
      let!(:user_skill_rate_content) do
        create(
          :user_skill_rate_content,
          user_skill_rate_id: user_skill_rate.id
        )
      end

      it "doesn't create new user_skill_rate_content" 


      it 'updates content', :aggregate_failures do
        subject.call
        user_skill_rate_content.reload
        user_skill_rate.reload
        expect(user_skill_rate_content.favorite)
          .to eq(user_skill_rate.favorite)
        expect(user_skill_rate_content.note).to eq(user_skill_rate.note)
        expect(user_skill_rate_content.rate).to eq(user_skill_rate.rate)
      end
    end

    context 'when two last user_skill_rate_contents are equal' do
      let(:params) do
        {
          id: user_skill_rate.id,
          note: 'def',
          rate: 1,
          favorite: true
        }
      end

      before do
        Timecop.freeze(DateTime.now - 3.days) do
          create(
            :user_skill_rate_content,
            user_skill_rate_id: user_skill_rate.id,
            note: 'def',
            rate: 1,
            favorite: true
          )
        end
      end

      context 'when add new user_skill_rate_content' do
        it "doesn't add new user_skill_rate_content" 

      end

      context 'when update last user_skill_rate_content' do
        let!(:user_skill_rate_content) do
          create(
            :user_skill_rate_content,
            user_skill_rate_id: user_skill_rate.id,
            note: 'def',
            rate: 1,
            favorite: true
          )
        end

        it 'removes last user_skill_rate_content' 

      end
    end
  end
end

