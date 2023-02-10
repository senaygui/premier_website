ActiveAdmin.register Service do

permit_params :service_name,:service_overview,:details

  index do
    selectable_column
    column :service_name
    column :service_overview
    column "Created At", sortable: true do |c|
      c.created_at.strftime("%b %d, %Y")
    end
    actions
  end
  filter :service_name
  filter :service_overview
  filter :created_at
  filter :updated_at

  
  form do |f|
    f.semantic_errors
    f.inputs "Service information" do
      
      f.input :service_name
      f.input :service_overview
      f.input :details    
    end
    f.actions
  end

  show title: :service_name do
    panel "Service information" do
      attributes_table_for service do
        row :service_name
        row :service_overview
        row :details
        row :created_at
        row :updated_at
      end
    end
  end 
  
end
