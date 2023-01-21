Rails.application.routes.draw do
  
  resources :frequently_asked_questions
  resources :branches
  get 'contact' => 'pages#contact'
  # get 'trainings' => "programs#trainings"
  get 'about' => 'pages#about'
  get 'accreditation' => 'pages#accreditation'
  post 'request'=>'requests#create'
  resources :admissions
  resources :trainings
  resources :requests
  resources :programs
  resources :news
  resources :almunis
  resources :staffs
  resources :vacancies
  resource  :visitor_comments
  resources :how_tos do
    resources :steps
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
