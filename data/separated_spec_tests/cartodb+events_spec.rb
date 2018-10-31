# encoding: utf-8

require 'factories/carto_visualizations'
require 'spec_helper_min'

module Carto
  module Tracking
    module Events
      describe 'Events' do
        include Carto::Factories::Visualizations

        before(:all) do
          @user = FactoryGirl.create(:carto_user, private_maps_enabled: true)
          @intruder = FactoryGirl.create(:carto_user)
          @map, @table, @table_visualization, @visualization = create_full_visualization(@user)
          @visualization.privacy = 'private'
          @visualization.save!
          @visualization.reload
        end

        after(:all) do
          destroy_full_visualization(@map, @table, @table_visualization, @visualization)
          @user.destroy
          @intruder.destroy
        end

        def days_with_decimals(time_object)
          time_object.to_f / 60 / 60 / 24
        end

        def check_hash_has_keys(hash, keys)
          keys.each do |key|
            puts "checking #{key} is not nil"
            hash[key].should_not be_nil
          end
        end

        describe ExportedMap do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must have read access to visualization' 


            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports by user with access' 


          it 'matches current prod properties' 

        end

        describe CreatedMap do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires a origin' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must have write access to visualization' 


            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports by user with access' 


          it 'matches current prod properites' 

        end

        describe AppliedSql do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError) if @event
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires a sql' 


            it 'can have a node_id' 


            it 'can have a dataset_id' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must have write access to visualization' 


            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports by user with access' 

        end

        describe AppliedCartocss do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires a layer_id' 


            it 'requires a cartocss' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must have write access to visualization' 


            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports by user with access' 

        end

        describe ModifiedStyleForm do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires a layer_id' 


            it 'requires a cartocss' 


            it 'requires a style_properties' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must have write access to visualization' 


            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports by user with access' 

        end

        describe DeletedMap do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must have write access to visualization' 


            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports by user with access' 


          it 'matches current prod properites' 

        end

        describe PublishedMap do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must have write access to visualization' 


            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports by user with access' 


          it 'matches current prod properites' 

        end

        describe CompletedConnection do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          let(:connection) do
            {
              data_from: 'Manolo',
              imported_from: 'Escobar',
              sync: true,
              file_type: '.manolo'
            }
          end

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a connection' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must be reported by user' 

          end

          it 'reports' 


          it 'matches current prod properites' 

        end

        describe FailedConnection do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          let(:connection) do
            {
              data_from: 'Manolo',
              imported_from: 'Escobar',
              sync: true,
              file_type: '.manolo'
            }
          end

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a connection' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must be reported by user' 

          end

          it 'reports' 


          it 'matches current prod properites' 

        end

        describe ExceededQuota do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports with optional quota_overage' 


          it 'matches current prod properites' 

        end

        describe ScoredTrendingMap do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires mapviews' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must have write access to visualization' 


            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports by user with access' 


          it 'matches current prod properites' 

        end

        describe VisitedPrivatePage do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          it 'reports' 


          it 'updates dashboard_viewed_at for dashboard visits' 


          it 'does not update dashboard_viewed_at for other visits' 

        end

        describe CreatedDataset do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires a origin' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must have write access to visualization' 


            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports by user with access' 


          it 'matches current prod properites' 

        end

        describe DeletedDataset do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must have write access to visualization' 


            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports by user with access' 


          it 'matches current prod properites' 

        end

        describe CreatedAnalysis do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          let(:analysis) do
            {
              id: 'xxx-xxx-xxx-xxx',
              natural_id: 'z3',
              type: 'georeference'
            }
          end

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires an analysis' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must have write access to visualization' 


            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports by user with access' 


          it 'matches current prod properites' 

        end

        describe ModifiedAnalysis do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          let(:analysis) do
            {
              id: 'xxx-xxx-xxx-xxx',
              natural_id: 'z3',
              type: 'georeference'
            }
          end

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires an analysis' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must have write access to visualization' 


            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports by user with access' 


          it 'matches current prod properites' 

        end

        describe CreatedWidget do
          before(:all) do
            @widget = FactoryGirl.create(:widget, layer: @visualization.data_layers.first)
          end

          after(:all) do
            @widget.destroy
          end

          it 'should validate the widget exists' 


          it 'should report when valid widget' 

        end

        describe DeletedAnalysis do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          let(:analysis) do
            {
              id: 'xxx-xxx-xxx-xxx',
              natural_id: 'z3',
              type: 'georeference'
            }
          end

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires an analysis' 


            it 'does not allow adding any additional property' 

          end

          describe '#security validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnauthorizedError)
            end

            after(:all) do
              @event = nil
            end

            it 'must have write access to visualization' 


            it 'must be reported by user' 

          end

          it 'reports' 


          it 'reports by user with access' 


          it 'matches current prod properites' 

        end

        describe DownloadedLayer do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires a layer_id' 


            it 'requires a format' 


            it 'requires a source' 


            it 'requires a table_name' 


            it 'requires a visible' 


            it 'does not allow adding any other additional property' 

          end

          it 'matches current prod properties' 

        end

        describe DraggedNode do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'does not allow adding any additional property' 

          end
        end

        describe CreatedLayer do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires a layer_id' 


            it 'requires a empty' 


            it 'does not allow adding any additional property' 

          end

          it 'matches current prod properties' 

        end

        describe StyledByValue do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires an attribute' 


            it 'requires an attribute_type' 


            it 'does not allow adding any additional property' 

          end

          it 'matches current prod properties' 

        end

        describe ChangedDefaultGeometry do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'does not allow adding any additional property' 

          end
        end

        describe AggregatedGeometries do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires a agg_type' 

            it 'requires a previous_agg_type' 


            it 'does not allow adding any additional property' 

          end

          it 'matches current prod properties' 

        end

        describe UsedAdvancedMode do
          before (:all) { @event_class = self.class.description.constantize }
          after  (:all) { @event_class = nil }

          describe '#properties validation' do
            after(:each) do
              expect { @event.report! }.to raise_error(Carto::UnprocesableEntityError)
            end

            after(:all) do
              @event = nil
            end

            it 'requires a user_id' 


            it 'requires a visualization_id' 


            it 'requires a mode_type' 


            it 'does not allow adding any additional property' 

          end

          it 'matches current prod properties' 

        end
      end
    end
  end
end

