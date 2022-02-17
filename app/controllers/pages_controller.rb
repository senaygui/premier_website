class PagesController < ApplicationController
  def home
    @college = College.last
    @comment = VisitorComment.all
    @marketing = MarketingSection.all
    @news = News.order('created_at DESC').first(6)
    @programs = Program.all
    @admissions = Admission.all
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

  def accreditation
  	@accreditations = Accreditation.all
    @marketing = MarketingSection.all
  end
end
