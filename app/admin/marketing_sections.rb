ActiveAdmin.register MarketingSection do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  
  # Uncomment all parameters which should be permitted for assignment
  
  permit_params :headline_title, :description, :page_to_display, :action
  
  # # or
  
  # permit_params do
  #   permitted = [:headline_title, :description, :page_to_display, :action]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
    index do
    selectable_column
    column :headline_title
    column :page_to_display
    column :created_by
    column :last_updated_by
    column "Created At", sortable: true do |c|
      c.created_at.strftime("%b %d, %Y")
    end
    actions
  end
    form do |f|
      f.semantic_errors
      f.inputs "Marketing Section" do
        f.input :headline_title
        f.input :page_to_display, as: :select, :collection => ["home", "about", "contact", "programs"]
        f.input :description, as: :string, input_html: { maxlength: 255 }
        f.input :action
      f.actions
    end
  end
end
