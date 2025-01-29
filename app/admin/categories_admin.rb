Trestle.resource(:categories) do
    menu do
      group :content_management, priority: :first do
        item :categories, icon: "fa fa-list"
      end
    end
  
    # Table configuration
    table do
      column :name, header: "Category Name"
      column :created_at, align: :center
      actions
    end
  
    # Form configuration
    form do |category|
      text_field :name
    end
end
  