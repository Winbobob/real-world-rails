#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

describe CustomStylesController, type: :controller do
  before do
    login_as user
  end

  context 'with admin' do
    let(:user) { FactoryBot.build(:admin) }

    describe '#show' do
      subject { get :show }
      render_views

      context 'when active token exists' do
        before do
          with_enterprise_token(:define_custom_style)
        end

        it 'renders show' 

      end

      context 'when no active token exists' do
        before do
          allow(EnterpriseToken).to receive(:current).and_return(nil)
        end

        it 'redirects to #upsale' 

      end
    end

    describe "#upsale" do
      subject { get :upsale }
      render_views

      it 'renders upsale' 

    end

    describe "#create" do
      let(:custom_style) { CustomStyle.new }
      let(:params) do
        {
          custom_style: { logo: 'foo', favicon: 'bar', icon_touch: 'yay' }
        }
      end

      before do
        with_enterprise_token(:define_custom_style)

        expect(CustomStyle).to receive(:create).and_return(custom_style)
        expect(custom_style).to receive(:valid?).and_return(valid)

        post :create, params: params
      end

      context 'valid custom_style input' do
        let(:valid) { true }

        it 'redirects to show' 

      end

      context 'invalid custom_style input' do
        let(:valid) { false }

        it 'renders with error' 

      end
    end

    describe "#update" do
      let(:custom_style) { FactoryBot.build(:custom_style_with_logo) }
      let(:params) do
        {
          custom_style: { logo: 'foo', favicon: 'bar', icon_touch: 'yay' }
        }
      end

      before do
        with_enterprise_token(:define_custom_style)

        expect(CustomStyle).to receive(:current).and_return(custom_style)
        expect(custom_style).to receive(:update_attributes).and_return(valid)

        post :update, params: params
      end

      context 'valid custom_style input' do
        let(:valid) { true }

        it 'redirects to show' 

      end

      context 'invalid custom_style input' do
        let(:valid) { false }

        it 'renders with error' 

      end
    end

    describe "#logo_download" do
      render_views

      before do
        expect(CustomStyle).to receive(:current).and_return(custom_style)
        allow(controller).to receive(:send_file) { controller.head 200 }
        get :logo_download, params: { digest: "1234", filename: "logo_image.png" }
      end

      context "when logo is present" do
        let(:custom_style) { FactoryBot.build(:custom_style_with_logo) }

        it 'will send a file' 

      end

      context "when no custom style is present" do
        let(:custom_style) { nil }

        it 'renders with error' 

      end

      context "when no logo is present" do
        let(:custom_style) { FactoryBot.build_stubbed(:custom_style) }

        it 'renders with error' 

      end
    end

    describe "#logo_delete" do
      let(:custom_style) { FactoryBot.build(:custom_style_with_logo) }

      before do
        with_enterprise_token(:define_custom_style)
      end

      context 'if it exists' do
        before do
          expect(CustomStyle).to receive(:current).and_return(custom_style)
          expect(custom_style).to receive(:remove_logo!).and_return(custom_style)
          delete :logo_delete
        end

        it 'removes the logo from custom_style' 

      end

      context 'if it does not exist' do
        before do
          expect(CustomStyle).to receive(:current).and_return(nil)
          delete :logo_delete
        end

        it 'renders 404' 

      end
    end

    describe "#favicon_download" do
      render_views

      before do
        expect(CustomStyle).to receive(:current).and_return(custom_style)
        allow(controller).to receive(:send_file) { controller.head 200 }
        get :favicon_download, params: { digest: "1234", filename: "favicon_image.png" }
      end

      context "when favicon is present" do
        let(:custom_style) { FactoryBot.build(:custom_style_with_favicon) }

        it 'will send a file' 

      end

      context "when no custom style is present" do
        let(:custom_style) { nil }

        it 'renders with error' 

      end

      context "when no favicon is present" do
        let(:custom_style) { FactoryBot.build(:custom_style) }

        it 'renders with error' 

      end
    end

    describe "#favicon_delete" do
      let(:custom_style) { FactoryBot.build(:custom_style_with_favicon) }

      before do
        with_enterprise_token(:define_custom_style)
      end

      context 'if it exists' do
        before do
          expect(CustomStyle).to receive(:current).and_return(custom_style)
          expect(custom_style).to receive(:remove_favicon!).and_return(custom_style)
          delete :favicon_delete
        end

        it 'removes the favicon from custom_style' 

      end

      context 'if it does not exist' do
        before do
          expect(CustomStyle).to receive(:current).and_return(nil)
          delete :favicon_delete
        end

        it 'renders 404' 

      end
    end

    describe "#touch_icon_download" do
      render_views

      before do
        expect(CustomStyle).to receive(:current).and_return(custom_style)
        allow(controller).to receive(:send_file) { controller.head 200 }
        get :touch_icon_download, params: { digest: "1234", filename: "touch_icon_image.png" }
      end

      context "when touch icon is present" do
        let(:custom_style) { FactoryBot.build(:custom_style_with_touch_icon) }

        it 'will send a file' 

      end

      context "when no custom style is present" do
        let(:custom_style) { nil }

        it 'renders with error' 

      end

      context "when no touch icon is present" do
        let(:custom_style) { FactoryBot.build(:custom_style) }

        it 'renders with error' 

      end
    end

    describe "#touch_icon_delete" do
      let(:custom_style) { FactoryBot.build(:custom_style_with_touch_icon) }

      before do
        with_enterprise_token(:define_custom_style)
      end

      context 'if it exists' do
        before do
          expect(CustomStyle).to receive(:current).and_return(custom_style)
          expect(custom_style).to receive(:remove_touch_icon!).and_return(custom_style)
          delete :touch_icon_delete
        end

        it 'removes the touch icon from custom_style' 

      end

      context 'if it does not exist' do
        before do
          expect(CustomStyle).to receive(:current).and_return(nil)
          delete :touch_icon_delete
        end

        it 'renders 404' 

      end
    end

    describe "#update_colors" do
      let(:params) do
        {
          design_colors: [{ "primary-color" => "#990000" }]
        }
      end

      before do
        with_enterprise_token(:define_custom_style)

        post :update_colors, params: params
      end

      it "saves DesignColor instances" 


      it "updates DesignColor instances" 


      it "deletes DesignColor instances for each param" 

    end
  end

  context 'regular user' do
    let(:user) { FactoryBot.build(:user) }

    describe '#get' do
      before do
        get :show
      end

      it 'requires admin' 

    end
  end

  context 'anonymous user' do
    let(:user) { User.anonymous }

    describe "#logo_download" do
      render_views

      before do
        expect(CustomStyle).to receive(:current).and_return(custom_style)
        allow(controller).to receive(:send_file) { controller.head 200 }
        get :logo_download, params: { digest: "1234", filename: "logo_image.png" }
      end

      context "when logo is present" do
        let(:custom_style) { FactoryBot.build(:custom_style_with_logo) }

        it 'will send a file' 

      end

      context "when no logo is present" do
        let(:custom_style) { nil }

        it 'renders with error' 

      end
    end
  end
end

