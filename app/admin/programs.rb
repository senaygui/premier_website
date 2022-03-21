ActiveAdmin.register Program do

  permit_params :program_name,:study_level,:modality,:overview,:program_description,:program_duration,:total_tuition,:monthly_tuition,:created_by,:last_updated_by, :credit_hour,:photo, career_opportunities_attributes: [:id,:title]

  index do
    selectable_column
    column :program_name
    column :study_level
    column :modality
    column "duration",:program_duration
    number_column "Tuition",:total_tuition, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2 
    column "Created At", sortable: true do |c|
      c.created_at.strftime("%b %d, %Y")
    end
    actions
  end

  filter :program_name
  filter :study_level, as: :select, :collection => ["undergraduate", "graduate", "training","research" ]
  filter :modality, as: :select, :collection => ["online", "regular", "evening", "weekend"]
  filter :program_duration, as: :select, :collection => [1, 2,3,4,5,6,7]       
  filter :created_by
  filter :last_updated_by
  filter :created_at
  filter :updated_at

  scope :recently_added
  scope :undergraduate
  scope :graduate
  scope :online
  scope :regular
  scope :extention
  scope :distance
  form do |f|
    f.semantic_errors
    f.inputs "porgram information" do
      f.input :program_name
      f.input :overview,  :as => :ckeditor
      f.input :program_description,  :as => :ckeditor
      f.input :study_level, as: :select, :collection => ["undergraduate", "graduate", "training","research"], :include_blank => false
      f.input :modality, as: :select, :collection => ["online", "regular", "evening", "weekend"], :include_blank => false
      f.input :program_duration, as: :select, :collection => [1, 2,3,4,5,6,7], :include_blank => false
      f.input :monthly_tuition
      f.input :total_tuition
      f.input :credit_hour
      f.input :photo, as: :file

      f.inputs 'Career Opportunities' do
        f.has_many  :career_opportunities do |d|
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

  show title: :program_name do
    panel "Program information" do
      attributes_table_for program do
        row :program_name
        row :overview
        row :program_description
        row :study_level
        row :modality
        row :program_duration
        number_row :total_tuition, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2 
        number_row :monthly_tuition, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2 
        number_row :credit_hour, as: :currency, unit: "hour",  format: "%n %u" ,delimiter: ",", precision: 2 
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
