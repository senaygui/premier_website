module ApplicationHelper
  def safe_photo_tag(record, fallback_image = "ac.jpg", options = {})
    if record.respond_to?(:photo) && record.photo.attached?
      begin
        return image_tag(record.photo, options)
      rescue StandardError => e
        Rails.logger.error("ActiveStorage image rendering failed: #{e.message}")
        return image_tag(fallback_image, options)
      end
    elsif record.respond_to?(:accreditation_documents) && record.accreditation_documents.attached?
      begin
        return image_tag(record.accreditation_documents.first, options)
      rescue StandardError => e
        Rails.logger.error("ActiveStorage document image rendering failed: #{e.message}")
        return image_tag(fallback_image, options)
      end
    end

    image_tag(fallback_image, options)
  end

  def safe_photo_url(record, fallback_image = "pic1.jpg")
    if record.respond_to?(:photo) && record.photo.attached?
      begin
        return Rails.application.routes.url_helpers.rails_blob_path(record.photo, only_path: true)
      rescue StandardError => e
        Rails.logger.error("ActiveStorage image url failed: #{e.message}")
        return image_path(fallback_image)
      end
    end
    image_path(fallback_image)
  end

  # Ethiopian New Year seasonal check: September 01 - September 28
  def ethiopian_new_year_active?
    return true if params[:new_year].present? # preview support
    now = Time.current
    now.month == 9 && (1..28).cover?(now.day)
  end
end
