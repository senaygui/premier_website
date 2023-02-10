ActiveAdmin.register News do

permit_params :news_title,:overview,:body,:publish,:published_by, :photo


  controller do
    def index
      params[:news] = 'created_at_desc'
      super
    end
  end

  index do
    selectable_column
    column :news_title do |t|
      truncate(t.news_title, line_width: 9)
    end
    column :overview do |t|
      truncate(t.overview , line_width: 12)
    end
    column :publish
    column :published_by    
    column 'Created At' do |c|
      c.created_at.strftime('%b %d, %Y')
    end
    column 'Updated At' do |c|
      c.updated_at.strftime('%b %d, %Y')
    end
    actions
  end

  filter :news_title
  filter :overview
  filter :publish
  filter :published_by
  filter :created_at
  
  form do |f|
      f.semantic_errors
      f.inputs "News", :multipart => true do
        f.input :news_title 
        f.input :overview
        f.input :body
        f.input :publish
        f.input :published_by 
        f.input :photo, as: :file
      end
      f.actions
  end

  show title: :news_title do
    panel 'News' do
      attributes_table_for news do
        row :news_title 
        row :overview
        row :body 
        row :publish
        row :published_by 
        row :created_at
        row :updated_at
        row "photo" do |pt|
          span image_tag(pt.photo, size: '300x300', class: "img-corner")
        end
      end  
      
    end
    active_admin_comments
  end
  
end
