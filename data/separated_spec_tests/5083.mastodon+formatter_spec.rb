require 'rails_helper'

RSpec.describe Formatter do
  let(:local_account)  { Fabricate(:account, domain: nil, username: 'alice') }
  let(:remote_account) { Fabricate(:account, domain: 'remote.test', username: 'bob', url: 'https://remote.test/') }

  shared_examples 'encode and link URLs' do
    context 'given a stand-alone medium URL' do
      let(:text) { 'https://hackernoon.com/the-power-to-build-communities-a-response-to-mark-zuckerberg-3f2cac9148a4' }

      it 'matches the full URL' 

    end

    context 'given a stand-alone google URL' do
      let(:text) { 'http://google.com' }

      it 'matches the full URL' 

    end

    context 'given a stand-alone IDN URL' do
      let(:text) { 'https://nic.みんな/' }

      it 'matches the full URL' 


      it 'has display URL' 

    end

    context 'given a URL with a trailing period' do
      let(:text) { 'http://www.mcmansionhell.com/post/156408871451/50-states-of-mcmansion-hell-scottsdale-arizona. ' }

      it 'matches the full URL but not the period' 

    end

    context 'given a URL enclosed with parentheses' do
      let(:text) { '(http://google.com/)' }

      it 'matches the full URL but not the parentheses' 

    end

    context 'given a URL with a trailing exclamation point' do
      let(:text) { 'http://www.google.com!' }

      it 'matches the full URL but not the exclamation point' 

    end

    context 'given a URL with a trailing single quote' do
      let(:text) { "http://www.google.com'" }

      it 'matches the full URL but not the single quote' 

    end

    context 'given a URL with a trailing angle bracket' do
      let(:text) { 'http://www.google.com>' }

      it 'matches the full URL but not the angle bracket' 

    end

    context 'given a URL with a query string' do
      let(:text) { 'https://www.ruby-toolbox.com/search?utf8=%E2%9C%93&q=autolink' }

      it 'matches the full URL' 

    end

    context 'given a URL with parentheses in it' do
      let(:text) { 'https://en.wikipedia.org/wiki/Diaspora_(software)' }

      it 'matches the full URL' 

    end

    context 'given a URL with Japanese path string' do
      let(:text) { 'https://ja.wikipedia.org/wiki/日本' }

      it 'matches the full URL' 

    end

    context 'given a URL with Korean path string' do
      let(:text) { 'https://ko.wikipedia.org/wiki/대한민국' }

      it 'matches the full URL' 

    end

    context 'given a URL with Simplified Chinese path string' do
      let(:text) { 'https://baike.baidu.com/item/中华人民共和国' }

      it 'matches the full URL' 

    end

    context 'given a URL with Traditional Chinese path string' do
      let(:text) { 'https://zh.wikipedia.org/wiki/臺灣' }

      it 'matches the full URL' 

    end

    context 'given a URL containing unsafe code (XSS attack, visible part)' do
      let(:text) { %q{http://example.com/b<del>b</del>} }

      it 'escapes the HTML in the URL' 

    end

    context 'given a URL containing unsafe code (XSS attack, invisible part)' do
      let(:text) { %q{http://example.com/blahblahblahblah/a<script>alert("Hello")</script>} }

      it 'escapes the HTML in the URL' 

    end

    context 'given text containing HTML code (script tag)' do
      let(:text) { '<script>alert("Hello")</script>' }

      it 'escapes the HTML' 

    end

    context 'given text containing HTML (XSS attack)' do
      let(:text) { %q{<img src="javascript:alert('XSS');">} }

      it 'escapes the HTML' 

    end

    context 'given an invalid URL' do
      let(:text) { 'http://www\.google\.com' }

      it 'outputs the raw URL' 

    end

    context 'given text containing a hashtag' do
      let(:text)  { '#hashtag' }

      it 'creates a hashtag link' 

    end
  end

  describe '#format_spoiler' do
    subject { Formatter.instance.format_spoiler(status) }

    context 'given a post containing plain text' do
      let(:status) { Fabricate(:status, text: 'text', spoiler_text: 'Secret!', uri: nil) }

      it 'Returns the spoiler text' 

    end

    context 'given a post with an emoji shortcode at the start' do
      let!(:emoji) { Fabricate(:custom_emoji) }
      let(:status) { Fabricate(:status, text: 'text', spoiler_text: ':coolcat: Secret!', uri: nil) }
      let(:text) { ':coolcat: Beep boop' }

      it 'converts the shortcode to an image tag' 

    end
  end

  describe '#format' do
    subject { Formatter.instance.format(status) }

    context 'given a post with local status' do
      context 'given a reblogged post' do
        let(:reblog) { Fabricate(:status, account: local_account, text: 'Hello world', uri: nil) }
        let(:status) { Fabricate(:status, reblog: reblog) }

        it 'returns original status with credit to its author' 

      end

      context 'given a post containing plain text' do
        let(:status) { Fabricate(:status, text: 'text', uri: nil) }

        it 'paragraphizes the text' 

      end

      context 'given a post containing line feeds' do
        let(:status) { Fabricate(:status, text: "line\nfeed", uri: nil) }

        it 'removes line feeds' 

      end

      context 'given a post containing linkable mentions' do
        let(:status) { Fabricate(:status, mentions: [ Fabricate(:mention, account: local_account) ], text: '@alice') }

        it 'creates a mention link' 

      end

      context 'given a post containing unlinkable mentions' do
        let(:status) { Fabricate(:status, text: '@alice', uri: nil) }

        it 'does not create a mention link' 

      end

      context do
        subject do
          status = Fabricate(:status, text: text, uri: nil)
          Formatter.instance.format(status)
        end

        include_examples 'encode and link URLs'
      end

      context 'given a post with custom_emojify option' do
        let!(:emoji) { Fabricate(:custom_emoji) }
        let(:status) { Fabricate(:status, account: local_account, text: text) }

        subject { Formatter.instance.format(status, custom_emojify: true) }

        context 'given a post with an emoji shortcode at the start' do
          let(:text) { ':coolcat: Beep boop' }

          it 'converts the shortcode to an image tag' 

        end

        context 'given a post with an emoji shortcode in the middle' do
          let(:text) { 'Beep :coolcat: boop' }

          it 'converts the shortcode to an image tag' 

        end

        context 'given a post with concatenated emoji shortcodes' do
          let(:text) { ':coolcat::coolcat:' }

          it 'does not touch the shortcodes' 

        end

        context 'given a post with an emoji shortcode at the end' do
          let(:text) { 'Beep boop :coolcat:' }

          it 'converts the shortcode to an image tag' 

        end
      end
    end

    context 'given a post with remote status' do
      let(:status) { Fabricate(:status, account: remote_account, text: 'Beep boop') }

      it 'reformats the post' 


      context 'given a post with custom_emojify option' do
        let!(:emoji) { Fabricate(:custom_emoji, domain: remote_account.domain) }
        let(:status) { Fabricate(:status, account: remote_account, text: text) }

        subject { Formatter.instance.format(status, custom_emojify: true) }

        context 'given a post with an emoji shortcode at the start' do
          let(:text) { '<p>:coolcat: Beep boop<br />' }

          it 'converts the shortcode to an image tag' 

        end

        context 'given a post with an emoji shortcode in the middle' do
          let(:text) { '<p>Beep :coolcat: boop</p>' }

          it 'converts the shortcode to an image tag' 

        end

        context 'given a post with concatenated emoji' do
          let(:text) { '<p>:coolcat::coolcat:</p>' }

          it 'does not touch the shortcodes' 

        end

        context 'given a post with an emoji shortcode at the end' do
          let(:text) { '<p>Beep boop<br />:coolcat:</p>' }

          it 'converts the shortcode to an image tag' 

        end
      end
    end
  end

  describe '#reformat' do
    subject { Formatter.instance.reformat(text) }

    context 'given a post containing plain text' do
      let(:text) { 'Beep boop' }

      it 'keeps the plain text' 

    end

    context 'given a post containing script tags' do
      let(:text) { '<script>alert("Hello")</script>' }

      it 'strips the scripts' 

    end

    context 'given a post containing malicious classes' do
      let(:text) { '<span class="mention	status__content__spoiler-link">Show more</span>' }

      it 'strips the malicious classes' 

    end
  end

  describe '#plaintext' do
    subject { Formatter.instance.plaintext(status) }

    context 'given a post with local status' do
      let(:status) { Fabricate(:status, text: '<p>a text by a nerd who uses an HTML tag in text</p>', uri: nil) }

      it 'returns the raw text' 

    end

    context 'given a post with remote status' do
      let(:status) { Fabricate(:status, account: remote_account, text: '<script>alert("Hello")</script>') }

      it 'returns tag-stripped text' 

    end
  end

  describe '#simplified_format' do
    subject { Formatter.instance.simplified_format(account) }

    context 'given a post with local status' do
      let(:account) { Fabricate(:account, domain: nil, note: text) }

      context 'given a post containing linkable mentions for local accounts' do
        let(:text) { '@alice' }

        before { local_account }

        it 'creates a mention link' 

      end

      context 'given a post containing linkable mentions for remote accounts' do
        let(:text) { '@bob@remote.test' }

        before { remote_account }

        it 'creates a mention link' 

      end

      context 'given a post containing unlinkable mentions' do
        let(:text) { '@alice' }

        it 'does not create a mention link' 

      end

      context 'given a post with custom_emojify option' do
        let!(:emoji) { Fabricate(:custom_emoji) }

        before { account.note = text }
        subject { Formatter.instance.simplified_format(account, custom_emojify: true) }

        context 'given a post with an emoji shortcode at the start' do
          let(:text) { ':coolcat: Beep boop' }

          it 'converts the shortcode to an image tag' 

        end

        context 'given a post with an emoji shortcode in the middle' do
          let(:text) { 'Beep :coolcat: boop' }

          it 'converts the shortcode to an image tag' 

        end

        context 'given a post with concatenated emoji shortcodes' do
          let(:text) { ':coolcat::coolcat:' }

          it 'does not touch the shortcodes' 

        end

        context 'given a post with an emoji shortcode at the end' do
          let(:text) { 'Beep boop :coolcat:' }

          it 'converts the shortcode to an image tag' 

        end
      end

      include_examples 'encode and link URLs'
    end

    context 'given a post with remote status' do
      let(:text) { '<script>alert("Hello")</script>' }
      let(:account) { Fabricate(:account, domain: 'remote', note: text) }

      it 'reformats' 


      context 'with custom_emojify option' do
        let!(:emoji) { Fabricate(:custom_emoji, domain: remote_account.domain) }

        before { remote_account.note = text }

        subject { Formatter.instance.simplified_format(remote_account, custom_emojify: true) }

        context 'given a post with an emoji shortcode at the start' do
          let(:text) { '<p>:coolcat: Beep boop<br />' }

          it 'converts shortcode to image tag' 

        end

        context 'given a post with an emoji shortcode in the middle' do
          let(:text) { '<p>Beep :coolcat: boop</p>' }

          it 'converts shortcode to image tag' 

        end

        context 'given a post with concatenated emoji shortcodes' do
          let(:text) { '<p>:coolcat::coolcat:</p>' }

          it 'does not touch the shortcodes' 

        end

        context 'given a post with an emoji shortcode at the end' do
          let(:text) { '<p>Beep boop<br />:coolcat:</p>' }

          it 'converts shortcode to image tag' 

        end
      end
    end
  end

  describe '#sanitize' do
    let(:html) { '<script>alert("Hello")</script>' }

    subject { Formatter.instance.sanitize(html, Sanitize::Config::MASTODON_STRICT) }

    it 'sanitizes' 

  end
end

