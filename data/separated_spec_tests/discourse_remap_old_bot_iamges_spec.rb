require 'rails_helper'

RSpec.describe Jobs::DiscourseNarrativeBot::RemapOldBotImages do
  context "when bot's post contains an old link" do
    let(:post) do
      Fabricate(:post,
        user_id: -2,
        raw: 'If you’d like to learn more, select <img src="/images/font-awesome-gear.png" width="16" height="16"> <img src="/images/font-awesome-ellipsis.png" width="16" height="16"> below  and <img src="/images/font-awesome-bookmark.png" width="16" height="16"> **bookmark this private message**.  If you do, there may be a :gift: in your future!'
      )
    end

    before do
      post
    end

    it 'should remap the links correctly' 


    context 'subfolder' do
      let(:post) do
        Fabricate(:post,
          user_id: -2,
          raw: 'If you’d like to learn more, select <img src="/community/images/font-awesome-ellipsis.png" width="16" height="16"> below  and <img src="/community/images/font-awesome-bookmark.png" width="16" height="16"> **bookmark this private message**.  If you do, there may be a :gift: in your future!'
        )
      end

      it 'should remap the links correctly' 

    end
  end
end

