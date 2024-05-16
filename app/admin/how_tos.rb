ActiveAdmin.register HowTo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description, :video_link
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :video_link]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :category,:title, :description, :video_link,:image, steps_attributes: [:id, :step_name, :step_description, :step_video_link, :image]

  index do
    selectable_column
    column :title
    column :description
    column :category
    column :video_link
    column "Created At", sortable: true do |c|
      c.created_at.strftime("%b %d, %Y")
    end
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs "How To Information" do
      f.input :title
      f.input :description
      f.input :video_link
      f.input :category, as: :select, :collection => ["how to apply", "how to learn"]
      f.input :image, as: :file

      f.inputs 'Steps' do
        f.has_many  :steps do |d|
          d.input :step_name
          d.input :step_description
          d.input :step_video_link
          d.input :image, as: :file
        end
      end    
    end
    f.actions
  end

  show title: :title do
    panel "How To Information" do
      attributes_table_for how_to do
        row :title
        row :category
        row :description
        row :video_link
        row :steps do |c|
          status_tag c.title
        end
        row "photo" do |pt|
          span image_tag(pt.image, size: '300x300', class: "img-corner")
        end
      end
    end
  end

end
