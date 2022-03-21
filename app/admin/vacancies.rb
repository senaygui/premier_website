ActiveAdmin.register Vacancy do

	permit_params :admin_user_id, :title,:description,:deadline,:salary,:number_of_employee,:catagory,:career_level,:employment_type,:requirement,:organization_name,:website,:email,:city,:subcity,:address_1,:address_2,:phone_number_1,:phone_number_2


  controller do
    before_action :show_page_title, only: [:show]
    def index
      params[:order] = "created_at_desc"
      super
    end
    private
      def show_page_title
        @page_title = "#{Vacancy.find(params[:id]).title}"
      end
  end


  index  :sortable => true do
    selectable_column
    column "Vacancy title" do |t|
    	truncate t.title
    end
    column "Organization Name",:organization_name
    column :catagory
    column "Created At" do |c|
      c.created_at.strftime("%b %d, %Y")
    end
    column "Created By" do |u|
    	 user = AdminUser.find(u.admin_user_id)
	     word_wrap(user.first_name, :line_width => 7)
    end
    actions
  end

  filter :title
  filter :organization_name
  filter :catagory
  filter :created_at
  filter :admin_user, label: "Created By", as: :select, collection: -> {
    AdminUser.all.map { |user| [user.first_name, user.id] }
  }
  

  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs do
    	f.input :admin_user_id, as: :hidden, :input_html => { :value => current_admin_user.id }
	    f.input :title, :label => "Vacancy title"  
	    f.input :description, :label => "Vacancy description"
	    f.input :salary
	    f.input :number_of_employee
	    f.input :catagory
	    f.input :career_level
	    f.input :employment_type
	    f.input :requirement
	    f.input :deadline, as: :date_time_picker
	    f.input :organization_name, :label => "Organization name"
	    f.input :website
	    f.input :email
	    f.input :city
	    f.input :subcity
	    f.input :address_1
	    f.input :address_2
	    f.input :phone_number_1
	    f.input :phone_number_2

    end
    f.actions
  end

  show do
    panel "Vacancy" do
    	attributes_table_for vacancy do
	      row "Created By" do |r|
		      user = AdminUser.find(r.admin_user_id)
		      user.first_name
		    end
	     	row :title
        row :description
	     	row :salary
	     	row :number_of_employee
	     	row :catagory
				row :career_level
				row :employment_type
	     	row :requirement	
	     	row :deadline
        row :created_at
        row :updated_at
     	end	
    end
    panel "Organization Info" do
    	attributes_table_for vacancy do
    		row :organization_name
				row :website
				row :email
				row :city
				row :subcity
				row :address_1
				row :address_2
				row :phone_number_1
				row :phone_number_2
			end	
      active_admin_comments
  	end
  end
end
