ActiveAdmin.register Admission do
permit_params :admission_name,:how_to_apply,:required_document,:payment_process,:useful_information,:study_level,:modality


  controller do
    def index
      params[:news] = 'created_at_desc'
      super
    end
  end

  index do
    selectable_column
    column :admission_name
    column :study_level
    column :modality    
    column 'Created At' do |c|
      c.created_at.strftime('%b %d, %Y')
    end
    column 'Updated At' do |c|
      c.updated_at.strftime('%b %d, %Y')
    end
    actions
  end

  filter :admission_name
  filter :study_level
  filter :modality
  filter :updated_at
  filter :created_at
  
  form do |f|
      f.semantic_errors
      f.inputs "Admission Information", :multipart => true do
        f.input :admission_name
        f.input :overview, as: :string, input_html: { maxlength: 255 }
        f.input :how_to_apply, :as => :ckeditor
        f.input :required_document, :as => :ckeditor
        f.input :payment_process, :as => :ckeditor
        f.input :useful_information, :as => :ckeditor
        f.input :study_level, as: :select, :collection => ["undergraduate", "graduate"]
        f.input :modality, as: :select, :collection => ["online", "regular", "extention", "distance"]
      end
      f.actions
  end

  show title: :admission_name do
    panel 'Admission Information' do
      attributes_table_for admission do
        row :admission_name 
        row :how_to_apply
        row :required_document 
        row :payment_process
        row :useful_information 
        row :study_level
        row :modality 
        row :created_at
        row :updated_at
      end  
      
    end
    active_admin_comments
  end
   
end
