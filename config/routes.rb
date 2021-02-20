Rails.application.routes.draw do
  devise_for :user, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registraton: 'signup'
  }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
