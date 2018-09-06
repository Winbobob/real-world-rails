require 'rails_helper'

feature 'Order management' do
    
    store_setting
    feature_login_admin
    given(:undispatched) { create(:undispatched_complete_order) }
    given(:pending) { create(:addresses_pending_order) }
    given(:complete) { create(:addresses_complete_order) }
    given(:build_dispatch) { build(:edit_dispatch_order, actual_shipping_cost: '2.20') }
    given(:build_dispatch_incomplete) { build(:edit_dispatch_order) }

    scenario 'should display an index of orders' do
        undispatched
        pending

        visit admin_root_path
        find('a[data-original-title="Orders"]').click
        expect(current_path).to eq admin_orders_path
        within 'h2' do
            expect(page).to have_content 'Orders'
        end
        within '#breadcrumbs li.current' do
            expect(page).to have_content 'Orders'
        end
        within 'thead tr th:first-child' do
            expect(page).to have_content 'Order No.'
        end
        within 'tbody tr:first-child td:last-child' do
            expect(page).to have_selector('a', count: 2)
        end
        within 'tbody tr:last-child td:last-child' do
            expect(page).to have_selector('a', count: 2)
        end
    end

    scenario 'should display a pending order' do
        pending

        visit admin_orders_path
        find('tbody tr td:last-child a:first-child').click
        expect(current_path).to eq admin_order_path(pending)
        within 'h2' do
            expect(page).to have_content "Order ##{pending.id}"
        end
        within '#breadcrumbs li.current' do
            expect(page).to have_content "##{pending.id}"
        end
        within '#delivery-details' do
            expect(find('#email')).to have_content pending.email
            expect(find('#delivery-status p span')).to have_content 'Pending'
        end
        within '#billing-address' do
            expect(page).to have_content pending.billing_address.full_name
        end
        within '#delivery-address' do
            expect(page).to have_content pending.delivery_address.address
        end
        within '.table-margin tbody' do
            expect(find('tr:nth-child(2) td:last-child')).to have_content pending.delivery.price
        end
        within 'table:not(.table-margin) tbody' do
            expect(find('tr td:first-child')).to have_content pending.latest_transaction.transaction_type
            expect(find('tr td:nth-child(3) span')).to have_content 'Pending'
        end
    end

    scenario 'should display a complete order' do
        complete

        visit admin_orders_path
        find('tbody tr td:last-child a:first-child').click
        expect(current_path).to eq admin_order_path(complete)
        within 'h2' do
            expect(page).to have_content "Order ##{complete.id}"
        end
        within '#breadcrumbs li.current' do
            expect(page).to have_content "##{complete.id}"
        end
        within '#delivery-details' do
            expect(find('#email')).to have_content complete.email
            expect(find('#delivery-status p span')).to have_content 'Dispatched'
        end
        within '#billing-address' do
            expect(page).to have_content complete.billing_address.full_name
        end
        within '#delivery-address' do
            expect(page).to have_content complete.delivery_address.address
        end
        within '.table-margin tbody' do
            expect(find('tr:nth-child(2) td:last-child')).to have_content complete.delivery.price
        end
        within 'table:not(.table-margin) tbody' do
            expect(find('tr td:first-child')).to have_content complete.latest_transaction.transaction_type
            expect(find('tr td:nth-child(3) span')).to have_content 'Completed'
            expect(find('tr td:last-child')).to have_selector('a', count: 1)
        end
    end

    scenario 'should edit an order', js: true, broken: true do
        build_dispatch.save(validate: false)
        
        visit admin_orders_path
        find('tbody tr:first-child td:last-child a:nth-child(2)').trigger('click')
        sleep 1

        within '.modal#order-form' do
            expect(find('.modal-header h3')).to have_content "Edit Order ##{build_dispatch.id}"
            fill_in('order_consignment_number', with: '123456')
            fill_in('order_shipping_date', with: '14/02/2017')
            click_button 'Submit'
        end
        sleep 1

        expect(current_path).to eq admin_orders_path
        build_dispatch.reload
        within '.alert.alert-success' do
            expect(page).to have_content "Successfully updated Order ##{build_dispatch.id} as being dispatched on #{build_dispatch.shipping_date.strftime("%d/%m/%Y %R")}."
        end
        expect(build_dispatch.actual_shipping_cost).to eq BigDecimal.new('2.2')
        expect(build_dispatch.consignment_number).to eq '123456'
    end
end

