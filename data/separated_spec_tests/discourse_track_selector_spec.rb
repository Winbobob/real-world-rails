require 'rails_helper'

describe DiscourseNarrativeBot::TrackSelector do
  let(:user) { Fabricate(:user) }
  let(:discobot_user) { User.find(-2) }
  let(:narrative) { DiscourseNarrativeBot::NewUserNarrative.new }

  let(:random_mention_reply) do
    I18n.t('discourse_narrative_bot.track_selector.random_mention.reply',
     discobot_username: discobot_user.username,
     help_trigger: described_class.help_trigger
    )
  end

  let(:help_message) do
    discobot_username = discobot_user.username

    end_message = <<~RAW
    #{I18n.t(
      'discourse_narrative_bot.track_selector.random_mention.tracks',
      discobot_username: discobot_username,
      default_track: DiscourseNarrativeBot::NewUserNarrative.reset_trigger,
      reset_trigger: described_class.reset_trigger,
      tracks: "#{DiscourseNarrativeBot::NewUserNarrative.reset_trigger}, #{DiscourseNarrativeBot::AdvancedUserNarrative.reset_trigger}"
    )}

    #{I18n.t(
      'discourse_narrative_bot.track_selector.random_mention.bot_actions',
      discobot_username: discobot_username,
      dice_trigger: described_class.dice_trigger,
      quote_trigger: described_class.quote_trigger,
      magic_8_ball_trigger: described_class.magic_8_ball_trigger
    )}
    RAW

    end_message.chomp
  end

  describe '#select' do
    context 'in a PM with discobot' do
      let(:first_post) { Fabricate(:post, user: discobot_user) }

      let(:topic) do
        Fabricate(:private_message_topic, first_post: first_post,
                                          topic_allowed_users: [
            Fabricate.build(:topic_allowed_user, user: discobot_user),
            Fabricate.build(:topic_allowed_user, user: user),
          ]
        )
      end

      let(:post) { Fabricate(:post, topic: topic, user: user) }

      context 'during a tutorial track' do
        before do
          narrative.set_data(user,
            state: :tutorial_formatting,
            topic_id: topic.id,
            track: "DiscourseNarrativeBot::NewUserNarrative"
          )
        end

        context 'when bot is mentioned' do
          it 'should select the right track' 

        end

        context 'when bot is replied to' do
          it 'should select the right track' 


          it 'should not enqueue any user email' 

        end

        context 'when a non regular post is created' do
          it 'should not do anything' 

        end

        describe 'when user thank the bot' do
          it 'should like the post' 

        end

        context 'when reply contains a reset trigger' do
          it 'should reset the track' 


          describe 'reset trigger in surrounded by quotes' do
            it 'should reset the track' 

          end

          describe 'reset trigger in a middle of a sentence' do
            describe 'when post is less than reset trigger exact match limit' do
              it 'should reset the track' 

            end

            describe 'when post exceeds reset trigger exact match limit' do
              it 'should not reset the track' 

            end
          end
        end

        context 'when a new user is added into the topic' do
          before do
            topic.allowed_users << Fabricate(:user)
          end

          it 'should stop the new user track' 

        end
      end

      context 'at the end of a tutorial track' do
        before do
          narrative.set_data(user,
            state: :end,
            topic_id: topic.id,
            track: "DiscourseNarrativeBot::NewUserNarrative"
          )
        end

        context 'generic replies' do
          after do
            $redis.del("#{described_class::GENERIC_REPLIES_COUNT_PREFIX}#{user.id}")
          end

          it 'should create the right generic do not understand responses' 

        end

        context 'when discobot is mentioned at the end of a track' do
          it 'should create the right reply' 


          describe 'when asking discobot for help' do
            it 'should create the right reply' 


            describe 'as an admin or moderator' do
              it 'should include the commands to start the advanced user track' 

            end

            describe 'as a user that has completed the new user track' do
              it 'should include the commands to start the advanced user track' 

            end
          end

          describe 'when discobot is asked to roll dice' do
            before do
              narrative.set_data(user,
                state: :end,
                topic_id: topic.id
              )
            end

            it 'should create the right reply' 


            describe 'when range of dice request is too high' do
              before do
                srand(1)
              end

              it 'should create the right reply' 

            end

            describe 'when number of dice to roll is too high' do
              it 'should create the right reply' 

            end

            describe 'when dice combination is invalid' do
              it 'should create the right reply' 

            end
          end
        end
      end

      context 'when in a normal PM with discobot' do
        describe 'when discobot is replied to' do
          it 'should create the right reply' 


          it 'should not rate limit help message' 

        end
      end
    end

    context 'random discobot mentions' do
      let(:topic) { Fabricate(:topic) }
      let(:post) { Fabricate(:post, topic: topic, user: user) }

      describe 'when discobot public replies are disabled' do
        before do
          SiteSetting.discourse_narrative_bot_disable_public_replies = true
        end

        describe 'when discobot is mentioned' do
          it 'should not reply' 

        end
      end

      describe 'when discobot is mentioned' do
        it 'should create the right reply' 


        it "should be case insensitive towards discobot's username" 


        describe 'rate limiting random reply message in public topic' do
          let(:topic) { Fabricate(:topic) }
          let(:other_post) { Fabricate(:post, raw: '@discobot show me something', topic: topic) }
          let(:post) { Fabricate(:post, topic: topic) }

          after do
            $redis.flushall
          end

          describe 'when random reply massage has been displayed in the last 6 hours' do
            it 'should not do anything' 

          end

          describe 'when random reply message has not been displayed in the last 6 hours' do
            it 'should create the right reply' 

          end

          describe 'when random reply message has been displayed in the last 10 replies' do
            it 'should not do anything' 

          end
        end

        describe 'when asking discobot for help' do
          it 'should create the right reply' 

        end

        describe 'when asking discobot to start new user track' do
          describe 'invalid text' do
            it 'should not trigger the bot' 

          end
        end

        describe 'when discobot is asked to roll dice' do
          it 'should create the right reply' 


          describe 'when dice roll is requested incorrectly' do
            it 'should create the right reply' 

          end

          describe 'when roll dice command is present inside a quote' do
            it 'should ignore the command' 

          end
        end

        describe 'when a quote is requested' do
          it 'should create the right reply' 


          describe 'when quote is requested incorrectly' do
            it 'should create the right reply' 

          end

          describe 'when quote command is present inside a onebox or quote' do
            it 'should ignore the command' 

          end

          describe 'when user requesting quote has a preferred locale' do
            before do
              SiteSetting.allow_user_locale = true
              user.update!(locale: 'it')
              srand(1)
            end

            it 'should create the right reply' 

          end
        end

        describe 'when magic 8 ball is requested' do
          before do
            srand(1)
          end

          it 'should create the right reply' 

        end

        describe 'when bot is asked to reset/start a track' do
          describe 'when user likes a post containing a reset trigger' do
            it 'should not start the track' 

          end
        end
      end
    end

    context 'pm to self' do
      let(:other_topic) do
        topic_allowed_user = Fabricate.build(:topic_allowed_user, user: user)
        Fabricate(:private_message_topic, topic_allowed_users: [topic_allowed_user])
      end

      let(:other_post) { Fabricate(:post, topic: other_topic) }

      describe 'when a new message is made' do
        it 'should not do anything' 

      end
    end

    context 'pms to bot' do
      let(:other_topic) do
        topic_allowed_user = Fabricate.build(:topic_allowed_user, user: user)
        bot = Fabricate.build(:topic_allowed_user, user: discobot_user)
        Fabricate(:private_message_topic, topic_allowed_users: [topic_allowed_user, bot])
      end

      let(:other_post) { Fabricate(:post, topic: other_topic) }

      describe 'when a new like is made' do
        it 'should not do anything' 

      end

      describe 'when a new message is made' do
        it 'should create the right reply' 

      end

      describe 'when user thanks the bot' do
        it 'should like the post' 

      end
    end
  end
end

