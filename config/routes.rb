Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :cohorts, except: [:new, :create]
    get '/cohorts/:cohort_id/students/:id', to: 'students#show', as: 'cohort_student'
    get '/students/:id', to: 'students#show', as: 'student'
    resources :users
  end

  resources :users do
    resources :cohorts do
      get '/students/new', to: 'students#new', as: 'new_student'
      post '/students', to: 'students#create', as: 'students'
      get '/students/:id', to: 'students#show', as: 'student'
      get '/students/:id/edit', to: 'students#edit', as: 'edit_student'
      patch '/students/:id', to: 'students#update', as: 'student_update'
      post '/students/:student_id/meetings', to: 'meetings#create', as: 'student_meetings'
      get '/students/:student_id/meetings/:id/add_to_instructor_app', to: 'meetings#add_to_instructor_app', as: 'add_student_meetings_to_instructor_app'
      get '/students/:student_id/meetings/:id/destroy', to: 'meetings#destroy', as: 'delete_meeting'
    end
  end
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
