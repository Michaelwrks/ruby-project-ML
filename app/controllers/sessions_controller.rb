# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
    def create
        if user_authenticated
            respond_to do |format|
              format.js { render 'login_success' }
            end
          else
            respond_to do |format|
              format.js { render 'login_failure' }
            end
          end
        end
      end