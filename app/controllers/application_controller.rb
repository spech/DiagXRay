# app/controllers/application_controller.rb
class ApplicationController < ActionController::API

  include ExceptionHandler
  include ActionController::MimeResponds
  include ::ActionView::Layouts
end
