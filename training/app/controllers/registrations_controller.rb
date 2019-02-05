class RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :exception
end    