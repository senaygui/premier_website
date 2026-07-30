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
end
