ActiveAdmin.register Staff do

permit_params :fullname,:message,:job_title,:office_name,:major_responsibilities,:offices_that_answerable_to,:office_address,:office_phone_number,:email, :photo, :office_photo


  controller do
    def index
      params[:news] = 'created_at_desc'
      super
    end
  end

  index do
    selectable_column
    column :fullname
    column :job_title
    column :publish
    column :office_name    
    column 'Created At' do |c|
      c.created_at.strftime('%b %d, %Y')
    end
    column 'Updated At' do |c|
      c.updated_at.strftime('%b %d, %Y')
    end
    actions
  end


  
  form do |f|
      f.semantic_errors
      f.inputs "Staff Information", :multipart => true do
        f.input :fullname
        f.input :message
        f.input :job_title
        f.input :office_name
        f.input :major_responsibilities
        f.input :offices_that_answerable_to
        f.input :office_address
        f.input :office_phone_number
        f.input :email
        f.input :photo, as: :file
        f.input :office_photo, as: :file
      end
      f.actions
  end

  show title: :fullname do
    panel 'Staff Information' do
      attributes_table_for staff do
        row "photo" do |pt|
          span image_tag(pt.photo, size: '300x300', class: "img-corner")
        end
        
        row :fullname
        row :message
        row :job_title
        row :office_name
        row :major_responsibilities
        row :offices_that_answerable_to
        row :office_address
        row :office_phone_number
        row :email
        row :created_at
        row :updated_at
        
        row "office_photo" do |pt|
          span image_tag(pt.office_photo, size: '300x300', class: "img-corner")
        end
        
      end  
      
    end
    active_admin_comments
  end
  
end
