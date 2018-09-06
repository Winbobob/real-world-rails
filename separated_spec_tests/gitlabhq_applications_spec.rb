require 'spec_helper'

feature 'Clusters Applications', :js do
  include GoogleApi::CloudPlatformHelpers

  let(:project) { create(:project) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)
  end

  describe 'Installing applications' do
    before do
      visit project_cluster_path(project, cluster)
    end

    context 'when cluster is being created' do
      let(:cluster) { create(:cluster, :providing_by_gcp, projects: [project])}

      scenario 'user is unable to install applications' do
        page.within('.js-cluster-application-row-helm') do
          expect(page.find(:css, '.js-cluster-application-install-button')['disabled']).to eq('true')
          expect(page).to have_css('.js-cluster-application-install-button', exact_text: 'Install')
        end
      end
    end

    context 'when cluster is created' do
      let(:cluster) { create(:cluster, :provided_by_gcp, projects: [project])}

      scenario 'user can install applications' do
        page.within('.js-cluster-application-row-helm') do
          expect(page.find(:css, '.js-cluster-application-install-button')['disabled']).to be_nil
          expect(page).to have_css('.js-cluster-application-install-button', exact_text: 'Install')
        end
      end

      context 'when user installs Helm' do
        before do
          allow(ClusterInstallAppWorker).to receive(:perform_async)

          page.within('.js-cluster-application-row-helm') do
            page.find(:css, '.js-cluster-application-install-button').click
          end
        end

        it 'he sees status transition' 

      end

      context 'when user installs Ingress' do
        context 'when user installs application: Ingress' do
          before do
            allow(ClusterInstallAppWorker).to receive(:perform_async)
            allow(ClusterWaitForIngressIpAddressWorker).to receive(:perform_in)
            allow(ClusterWaitForIngressIpAddressWorker).to receive(:perform_async)

            create(:clusters_applications_helm, :installed, cluster: cluster)

            page.within('.js-cluster-application-row-ingress') do
              expect(page).to have_css('.js-cluster-application-install-button:not([disabled])')
              page.find(:css, '.js-cluster-application-install-button').click
            end
          end

          it 'he sees status transition' 

        end
      end
    end
  end
end

