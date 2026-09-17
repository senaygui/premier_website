ActiveAdmin.register News do

  permit_params :news_title, :overview, :body, :publish, :published_by, :photo, :featured, :content_type

  controller do
    def index
      params[:news] = 'created_at_desc'
      super
    end
  end

  index do
    selectable_column
    column :news_title do |t|
      truncate(t.news_title, length: 30)
    end
    column :overview do |t|
      truncate(t.overview, length: 40)
    end
    column :content_type do |t|
      status_tag(t.content_type.capitalize, class: t.content_type == 'event' ? 'warning' : 'ok')
    end
    column :featured
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
  filter :content_type, as: :select, collection: [["News", "news"], ["Event", "event"]]
  filter :featured
  filter :publish
  filter :published_by
  filter :created_at
  
  form do |f|
    f.semantic_errors
    f.inputs "News / Event Details", multipart: true do
      f.input :news_title, label: "Title"
      f.input :overview, as: :text, input_html: { rows: 3 }, hint: "Brief summary shown on the homepage carousel slide and list cards"
      f.input :body, hint: "Full detailed story or event description"
      f.input :content_type, as: :select, collection: [["News Story", "news"], ["Event", "event"]], include_blank: false, hint: "Select whether this entry is a news report or an upcoming event"
      f.input :featured, label: "Feature on homepage carousel", hint: "If checked and published, this item appears after the main homepage slide (newest first)"
      f.input :publish, label: "Publish", hint: "Must be checked for the item to appear publicly"
      f.input :published_by, hint: "e.g. Premier College Communications, Office of the Registrar"
      f.input :photo, as: :file, hint: f.object.photo.attached? ? image_tag(f.object.photo, size: '120x80') : "Recommended: High resolution 16:9 or 4:3 landscape image"
    end
    f.actions
  end

  show title: :news_title do
    panel 'Post Details' do
      attributes_table_for news do
        row :news_title 
        row :overview
        row :body 
        row :content_type do |n|
          status_tag(n.content_type.capitalize, class: n.content_type == 'event' ? 'warning' : 'ok')
        end
        row :featured
        row :publish
        row :published_by 
        row :created_at
        row :updated_at
        row "Photo" do |pt|
          if pt.photo.attached?
            image_tag(pt.photo, size: '300x200', class: "img-corner")
          else
            span "No photo uploaded"
          end
        end
      end  
    end
    active_admin_comments
  end
  
end
