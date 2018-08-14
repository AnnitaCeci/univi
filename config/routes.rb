Rails.application.routes.draw do

  resources :grades
  get 'inscripciones/destroy'

  resources :records
  resources :cursos
  resources :profesors
  resources :alumnos
  resources :asignaturas
  resources :periodos
  resources :semesters
  resources :plan_estudios
  resources :carreras
  resources :inscripciones

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
