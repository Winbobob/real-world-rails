require 'rails_helper'

RSpec.describe Formatter do
  let(:local_account)  { Fabricate(:account, domain: nil, username: 'alice') }
  let(:remote_account) { Fabricate(:account, domain: 'remote.test', username: 'bob', url: 'https://remote.test/') }

  shared_examples 'encode and link URLs' do
    context 'matches a stand-alone medium URL' do
      let(:text) { 'https://hackernoon.com/the-power-to-build-communities-a-response-to-mark-zuckerberg-3f2cac9148a4' }

      it 'has valid URL' 

    end

    context 'matches a stand-alone google URL' do
      let(:text) { 'http://google.com' }

      it 'has valid URL' 

    end

    context 'matches a stand-alone IDN URL' do
      let(:text) { 'https://nic.みんな/' }

      it 'has valid URL' 


      it 'has display URL' 

    end

    context 'matches a URL without trailing period' do
      let(:text) { 'http://www.mcmansionhell.com/post/156408871451/50-states-of-mcmansion-hell-scottsdale-arizona. ' }

      it 'has valid URL' 

    end

    context 'matches a URL without closing paranthesis' do
      let(:text) { '(http://google.com/)' }

      it 'has valid URL' 

    end

    context 'matches a URL without exclamation point' do
      let(:text) { 'http://www.google.com!' }

      it 'has valid URL' 

    end

    context 'matches a URL without single quote' do
      let(:text) { "http://www.google.com'" }

      it 'has valid URL' 

    end

    context 'matches a URL without angle brackets' do
      let(:text) { 'http://www.google.com>' }

      it 'has valid URL' 

    end

    context 'matches a URL with a query string' do
      let(:text) { 'https://www.ruby-toolbox.com/search?utf8=%E2%9C%93&q=autolink' }

      it 'has valid URL' 

    end

    context 'matches a URL with parenthesis in it' do
      let(:text) { 'https://en.wikipedia.org/wiki/Diaspora_(software)' }

      it 'has valid URL' 

    end

    context 'matches a URL with Japanese path string' do
      let(:text) { 'https://ja.wikipedia.org/wiki/日本' }

      it 'has valid URL' 

    end

    context 'matches a URL with Korean path string' do
      let(:text) { 'https://ko.wikipedia.org/wiki/대한민국' }

      it 'has valid URL' 

    end

    context 'matches a URL with Simplified Chinese path string' do
      let(:text) { 'https://baike.baidu.com/item/中华人民共和国' }

      it 'has valid URL' 

    end

    context 'matches a URL with Traditional Chinese path string' do
      let(:text) { 'https://zh.wikipedia.org/wiki/臺灣' }

      it 'has valid URL' 

    end

    context 'contains unsafe URL (XSS attack, visible part)' do
      let(:text) { %q{http://example.com/b<del>b</del>} }

      it 'has escaped HTML' 

    end

    context 'contains unsafe URL (XSS attack, invisible part)' do
      let(:text) { %q{http://example.com/blahblahblahblah/a<script>alert("Hello")</script>} }

      it 'has escaped HTML' 

    end

    context 'contains HTML (script tag)' do
      let(:text) { '<script>alert("Hello")</script>' }

      it 'has escaped HTML' 

    end

    context 'contains HTML (XSS attack)' do
      let(:text) { %q{<img src="javascript:alert('XSS');">} }

      it 'has escaped HTML' 

    end

    context 'contains invalid URL' do
      let(:text) { 'http://www\.google\.com' }

      it 'has raw URL' 

    end

    context 'contains a hashtag' do
      let(:text)  { '#hashtag' }

      it 'has a link' 

    end
  end

  describe '#format' do
    subject { Formatter.instance.format(status) }

    context 'with local status' do
      context 'with reblog' do
        let(:reblog) { Fabricate(:status, account: local_account, text: 'Hello world', uri: nil) }
        let(:status) { Fabricate(:status, reblog: reblog) }

        it 'returns original status with credit to its author' 

      end

      context 'contains plain text' do
        let(:status)  { Fabricate(:status, text: 'text', uri: nil) }

        it 'paragraphizes' 

      end

      context 'contains line feeds' do
        let(:status)  { Fabricate(:status, text: "line\nfeed", uri: nil) }

        it 'removes line feeds' 

      end

      context 'contains linkable mentions' do
        let(:status) { Fabricate(:status, mentions: [ Fabricate(:mention, account: local_account) ], text: '@alice') }

        it 'links' 

      end

      context 'contains unlinkable mentions' do
        let(:status) { Fabricate(:status, text: '@alice', uri: nil) }

        it 'does not link' 

      end

      context do
        subject do
          status = Fabricate(:status, text: text, uri: nil)
          Formatter.instance.format(status)
        end

        include_examples 'encode and link URLs'
      end

      context 'with custom_emojify option' do
        let!(:emoji) { Fabricate(:custom_emoji) }
        let(:status) { Fabricate(:status, account: local_account, text: text) }

        subject { Formatter.instance.format(status, custom_emojify: true) }

        context 'with emoji at the start' do
          let(:text) { ':coolcat: Beep boop' }

          it 'converts shortcode to image tag' 

        end

        context 'with emoji in the middle' do
          let(:text) { 'Beep :coolcat: boop' }

          it 'converts shortcode to image tag' 

        end

        context 'with concatenated emoji' do
          let(:text) { ':coolcat::coolcat:' }

          it 'does not touch the shortcodes' 

        end

        context 'with emoji at the end' do
          let(:text) { 'Beep boop :coolcat:' }

          it 'converts shortcode to image tag' 

        end
      end
    end

    context 'with remote status' do
      let(:status) { Fabricate(:status, account: remote_account, text: 'Beep boop') }

      it 'reformats' 


      context 'with custom_emojify option' do
        let!(:emoji) { Fabricate(:custom_emoji, domain: remote_account.domain) }
        let(:status) { Fabricate(:status, account: remote_account, text: text) }

        subject { Formatter.instance.format(status, custom_emojify: true) }

        context 'with emoji at the start' do
          let(:text) { '<p>:coolcat: Beep boop<br />' }

          it 'converts shortcode to image tag' 

        end

        context 'with emoji in the middle' do
          let(:text) { '<p>Beep :coolcat: boop</p>' }

          it 'converts shortcode to image tag' 

        end

        context 'with concatenated emoji' do
          let(:text) { '<p>:coolcat::coolcat:</p>' }

          it 'does not touch the shortcodes' 

        end

        context 'with emoji at the end' do
          let(:text) { '<p>Beep boop<br />:coolcat:</p>' }

          it 'converts shortcode to image tag' 

        end
      end
    end
  end

  describe '#reformat' do
    subject { Formatter.instance.reformat(text) }

    context 'contains plain text' do
      let(:text) { 'Beep boop' }

      it 'contains plain text' 

    end

    context 'contains scripts' do
      let(:text) { '<script>alert("Hello")</script>' }

      it 'strips scripts' 

    end

    context 'contains malicious classes' do
      let(:text) { '<span class="mention	status__content__spoiler-link">Show more</span>' }

      it 'strips malicious classes' 

    end
  end

  describe '#plaintext' do
    subject { Formatter.instance.plaintext(status) }

    context 'with local status' do
      let(:status)  { Fabricate(:status, text: '<p>a text by a nerd who uses an HTML tag in text</p>', uri: nil) }

      it 'returns raw text' 

    end

    context 'with remote status' do
      let(:status)  { Fabricate(:status, account: remote_account, text: '<script>alert("Hello")</script>') }

      it 'returns tag-stripped text' 

    end
  end

  describe '#simplified_format' do
    subject { Formatter.instance.simplified_format(account) }

    context 'with local status' do
      let(:account) { Fabricate(:account, domain: nil, note: text) }

      context 'contains linkable mentions for local accounts' do
        let(:text) { '@alice' }

        before { local_account }

        it 'links' 

      end

      context 'contains linkable mentions for remote accounts' do
        let(:text) { '@bob@remote.test' }

        before { remote_account }

        it 'links' 

      end

      context 'contains unlinkable mentions' do
        let(:text) { '@alice' }

        it 'returns raw mention texts' 

      end

      context 'with custom_emojify option' do
        let!(:emoji) { Fabricate(:custom_emoji) }

        before { account.note = text }
        subject { Formatter.instance.simplified_format(account, custom_emojify: true) }

        context 'with emoji at the start' do
          let(:text) { ':coolcat: Beep boop' }

          it 'converts shortcode to image tag' 

        end

        context 'with emoji in the middle' do
          let(:text) { 'Beep :coolcat: boop' }

          it 'converts shortcode to image tag' 

        end

        context 'with concatenated emoji' do
          let(:text) { ':coolcat::coolcat:' }

          it 'does not touch the shortcodes' 

        end

        context 'with emoji at the end' do
          let(:text) { 'Beep boop :coolcat:' }

          it 'converts shortcode to image tag' 

        end
      end

      include_examples 'encode and link URLs'
    end

    context 'with remote status' do
      let(:text) { '<script>alert("Hello")</script>' }
      let(:account) { Fabricate(:account, domain: 'remote', note: text) }

      it 'reformats' 


      context 'with custom_emojify option' do
        let!(:emoji) { Fabricate(:custom_emoji, domain: remote_account.domain) }

        before { remote_account.note = text }

        subject { Formatter.instance.simplified_format(remote_account, custom_emojify: true) }

        context 'with emoji at the start' do
          let(:text) { '<p>:coolcat: Beep boop<br />' }

          it 'converts shortcode to image tag' 

        end

        context 'with emoji in the middle' do
          let(:text) { '<p>Beep :coolcat: boop</p>' }

          it 'converts shortcode to image tag' 

        end

        context 'with concatenated emoji' do
          let(:text) { '<p>:coolcat::coolcat:</p>' }

          it 'does not touch the shortcodes' 

        end

        context 'with emoji at the end' do
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

