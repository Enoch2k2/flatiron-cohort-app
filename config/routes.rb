Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    get '/cohorts', to: 'cohorts#index', as: 'cohorts'
    get '/cohorts/:id', to: 'cohorts#show', as: 'cohort'
  end

  resources :users do
    resources :cohorts do
      get '/students/new', to: 'students#new', as: 'new_student'
      post '/students', to: 'students#create', as: 'students'
      get '/students/:id', to: 'students#show', as: 'student'
      post '/students/:student_id/meetings', to: 'meetings#create', as: 'student_meetings'
      get '/students/:student_id/meetings/:id/add_to_doc', to: 'meetings#add_to_doc', as: 'add_student_meetings_to_doc'
      get '/students/:student_id/meetings/:id/add_to_instructor_app', to: 'meetings#add_to_instructor_app', as: 'add_student_meetings_to_instructor_app'
      get '/students/:student_id/meetings/:id/destroy', to: 'meetings#destroy', as: 'delete_meeting'
    end
  end
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
