ActiveAdmin.register Training do

 permit_params :photo,:title,:overview,:description,:duration,:total_tuition,:created_by,:last_updated_by, training_modules_attributes: [:id,:title]

  index do
    selectable_column
    column :title
    column :duration
    number_column "Tuition",:total_tuition, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2 
    column "Created At", sortable: true do |c|
      c.created_at.strftime("%b %d, %Y")
    end
    actions
  end

  filter :title
  filter :duration
  filter :total_tuition
  filter :created_by
  filter :last_updated_by
  filter :created_at
  filter :updated_at

  form do |f|
    f.semantic_errors
    f.inputs "training information" do
      f.input :title
      f.input :overview,  :as => :ckeditor
      f.input :description,  :as => :ckeditor
      f.input :duration
      f.input :total_tuition
      f.input :photo, as: :file

      f.inputs 'Trainings Modules' do
        f.has_many  :training_modules do |d|
          d.input :title
        end
      end  
      if f.object.new_record?
        f.input :created_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
      else
        f.input :last_updated_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
      end      
    end
    f.actions
  end

  show title: :title do
    panel "Training Information" do
      attributes_table_for training do
        row :title
        row :overview
        row :description
        row :duration
        # row :total_tuition
        number_row :total_tuition, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2 
        row :created_by
        row :last_updated_by
        row :created_at
        row :updated_at
        row "photo" do |pt|
          span image_tag(pt.photo, size: '300x300', class: "img-corner")
        end
      end
    end

  end
  
end
