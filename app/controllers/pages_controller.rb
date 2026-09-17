class PagesController < ApplicationController
  def home
    @college = College.last
    @comment = VisitorComment.all
    @marketing = MarketingSection.all
    @news = News.where(publish: true).order(created_at: :desc).first(6)
    @featured_news = News.homepage_features.with_attached_photo.to_a
    @programs = Program.all
    @admissions = Admission.all
    @accreditations = Accreditation.all
    @event_galleries = EventGallery.homepage_items.with_attached_photo.limit(7).to_a
    @event_galleries = EventGallery.with_attached_photo.order(created_at: :desc).limit(7).to_a if @event_galleries.empty?
    @total_gallery_count = EventGallery.count
  end

  def gallery
    @categories = EventGallery::CATEGORIES
    @active_category = params[:category]
    scope = EventGallery.with_attached_photo.order(order_number: :asc, created_at: :desc)
    if @active_category.present? && @categories.include?(@active_category)
      scope = scope.where(category: @active_category)
    end
    @event_galleries = scope.to_a
    @total_gallery_count = EventGallery.count
  end

  def contact
    @branches=Branch.all
    @faq= FrequentlyAskedQuestion.all
    @marketing = MarketingSection.all
  end

  def about
  	@college = College.last
    @staff = Staff.all
    @service = Service.all
    @accreditations = Accreditation.all
    @comment = VisitorComment.all
    @marketing = MarketingSection.all
    @news = News.where(publish: true).order('created_at DESC').first(6)
    @faq= FrequentlyAskedQuestion.all
  end

  def how_to_learn
  end
  def how_to_apply
  end
  def remind_me
  end

  def accreditation
  	@accreditations = Accreditation.all
    @marketing = MarketingSection.all
  end
end
