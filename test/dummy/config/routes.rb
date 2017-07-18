Rails.application.routes.draw do
  mount ActiveAuthorization::Engine => '/active_authorization'
end
