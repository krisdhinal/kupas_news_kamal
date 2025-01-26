Trestle.resource(:news) do
  menu do
    item :news, icon: "fa fa-newspaper"
  end

  form do |news|
    text_field :title
    text_area :body 
    file_field :image

    # Tampilkan tombol simpan
    # submit
  end

  
  table do
    column :title
    column :body
    column :image do |news|
      image_tag(news.image.url, style: "width: 90px; height: 80px; border-radius: 50%;") if news.image?
    end
    column :created_at do |news|
      news.created_at.strftime("%d %B %Y") # Contoh: 26 Januari 2025
    end
    column :updated_at do |news|
      news.updated_at.strftime("%d %B %Y") # Contoh: 26 Januari 2025
    end
    actions
  end
  

  

  search do |query|
    News.search(query)
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |news|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:news).permit(:name, ...)
  # end
end
