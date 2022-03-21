class VacanciesController < ApplicationController
  
  def index
  	@search = Vacancy.search(params[:q])
	  @vacancies = @search.result.where('deadline >= ?', Time.now).order("created_at DESC").page(params[:page])
  end

  def show
  	@vacancy = Vacancy.find(params[:id])
  end


end
