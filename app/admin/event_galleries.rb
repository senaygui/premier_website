ActiveAdmin.register EventGallery do
  menu priority: 6, label: "Event Gallery"

  permit_params :title, :caption, :event_date, :category, :display_on_homepage, :order_number, :photo

  index do
    selectable_column
    column "Photo" do |gallery|
      if gallery.photo.attached?
        image_tag(gallery.photo, size: "80x60", style: "object-fit: cover; border-radius: 6px;")
      else
        span "No Photo", class: "text-muted"
      end
    end
    column :title
    column :category
    column :event_date do |g|
      g.event_date.present? ? g.event_date.strftime("%b %d, %Y") : "-"
    end
    column :display_on_homepage
    column :order_number
    column "Created At", sortable: true do |g|
      g.created_at.strftime("%b %d, %Y")
    end
    actions
  end

  filter :title
  filter :category, as: :select, collection: EventGallery::CATEGORIES
  filter :display_on_homepage
  filter :event_date

  form do |f|
    f.semantic_errors
    f.inputs "Event Gallery Details" do
      f.input :title, placeholder: "e.g. 2026 Annual Commencement Ceremony"
      f.input :category, as: :select, collection: EventGallery::CATEGORIES, include_blank: false
      f.input :event_date, as: :datepicker
      f.input :caption, as: :text, input_html: { rows: 3 }, placeholder: "Brief context or highlight of this college event"
      f.input :display_on_homepage, as: :boolean, label: "Display in Homepage Event Gallery"
      f.input :order_number, label: "Display Order (lower numbers appear first)"
    end

    f.inputs "Event Photo", multipart: true do
      if f.object.photo.attached?
        div style: "margin-bottom: 12px;" do
          span "Current Photo:"
          div do
            image_tag(f.object.photo, size: "260x160", style: "object-fit: cover; border-radius: 8px; margin-top: 6px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);")
          end
        end
      end
      f.input :photo, as: :file, hint: "Upload high-quality JPEG or PNG event image"
    end

    f.actions
  end

  show do
    attributes_table do
      row "Photo" do |gallery|
        if gallery.photo.attached?
          image_tag(gallery.photo, size: "480x300", style: "object-fit: cover; border-radius: 12px; box-shadow: 0 8px 20px rgba(0,0,0,0.15);")
        else
          span "No Photo Attached"
        end
      end
      row :title
      row :category
      row :event_date do |g|
        g.event_date.present? ? g.event_date.strftime("%B %d, %Y") : "-"
      end
      row :caption
      row :display_on_homepage
      row :order_number
      row :created_at
      row :updated_at
    end
  end
end
