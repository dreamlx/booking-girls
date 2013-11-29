# coding: utf-8
ActiveAdmin.register MenuOrder do
  index do
    column :customers
    column :desk
    column :waiter
    column '菜品数量' do |menu_order|
      menu_order.menu_items.size
    end
    column '合计价格' do |menu_order|
      menu_order.total_price
    end

    default_actions 
  end 

  show do |menu_order|
     attributes_table do
      row :customers
      row :desk
      row :waiter
      row '菜品数量' do |menu_order|
        menu_order.menu_items.size
      end
      row '菜单详细' do |menu_order|
        table_for menu_order.menu_items do
          column "菜品" do |menu_item|
            menu_item.title
          end
          column "单价" do |menu_item|
            menu_item.price
          end
        end
      end

      row '合计价格' do |menu_order|
        menu_order.total_price
      end
    end
  end
end
