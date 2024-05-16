ActiveAdmin.register College do
  permit_params :video_link,:college_name,:background,:mission,:vision,:overview,:establishment_date,:student_enrolled,:distance_center,:number_of_prorgam,:mandate,:history,:headquarter_address,:alternative_address,:sub_city,:state,:region,:zone,:worda,:city,:country,:phone_number,:alternative_phone_number,:email,:facebook_handle,:twitter_handle,:instagram_handle,:linkedin_handle,:map_embed,:created_by,:last_updated_by, branches_attributes: [:id,:name,:location,:phone_number,:second_phone_number,:map,:email],section_headline_attributes: [:id,:gallery_headline,:service_headline,:accreditation,:testimonial_headline,:home_page_video_embed,:home_page_carousel_headline,:home_page_carousel_description,:primary_cta_action,:secondary_cta_action]
  
  index do
    selectable_column
    column :college_name
    column :headquarter_address
    column :created_by
    column :last_updated_by
    column "Created At", sortable: true do |c|
      c.created_at.strftime("%b %d, %Y")
    end
    actions
  end

  filter :college_name
  filter :created_by
  filter :last_updated_by
  filter :created_at
  filter :updated_at

  form do |f|
    f.semantic_errors
    f.inputs "College basic information" do
      f.input :college_name
      f.input :overview
      f.input :background
      f.input :mission
      f.input :vision
      f.input :history
      f.input :mandate  
      f.input :establishment_date, as: :date_time_picker
      f.input :student_enrolled
      f.input :distance_center
      f.input :number_of_prorgam
      f.input :video_link
    end

    f.inputs "College address" do
      f.input :headquarter_address 
      f.input :alternative_address 
      f.input :country, as: :country, selected: 'ET', priority_countries: ["ET", "US"], include_blank: "select country"
      #TODO: add select list to city,sub_city,state,region,zone
      f.input :city
      f.input :sub_city
      f.input :state
      f.input :region
      f.input :zone
      f.input :worda
      #TODO: add phone number mask
      f.input :phone_number
      f.input :alternative_phone_number
      f.input :email
      f.input :map_embed
    end

    f.inputs "Social media address" do
      f.input :facebook_handle
      f.input :twitter_handle
      f.input :instagram_handle
       f.input :linkedin_handle
    end

    # f.inputs 'Branches' do
    #   f.has_many  :branches, allow_destroy: true, new_record: true do |d|
    #     d.input :location
    #     d.input :name
    #     d.input :map
    #     d.input :phone_number
    #     d.input :second_phone_number
    #     d.input :email
    #   end
    # end  
    if f.object.new_record?
      f.input :created_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
    else
      f.input :last_updated_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
    end 
    f.actions
  end

  show title: :college_name do
    panel "College basic information" do
      attributes_table_for college do
        row :college_name
        row :overview
        row :background
        row :mission
        row :vision 
        row :mandate
        row :history
        row :establishment_date
        row :student_enrolled
        row :distance_center
        row :number_of_prorgam
        row :headquarter_address
        row :alternative_address
        row :country
        row :city
        row :sub_city
        row :state
        row :region
        row :zone
        row :worda
        row :phone_number
        row :alternative_phone_number
        row :email 
        row "map", class: "video-responsive" do |s|
          s.map_embed.html_safe
        end
        row :facebook_handle
        row :twitter_handle
        row :instagram_handle
        row :linkedin_handle 
        row :created_by
        row :last_updated_by
        row :created_at
        row :updated_at
        row "branches" do |pr|
		    	pr.branches.name
		    end
      end
    end
  end
end
