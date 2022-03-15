class PagesController < ApplicationController
    before_action :authenticate

    def index

    end

    private

    def authenticate
        if session.has_key? :current_user_id and Student.find_by_id(session[:current_user_id])
            @logged_out = false
            student = Student.find_by_id(session[:current_user_id])
            @name = student.first_name + " " + student.last_name
        else
            @logged_out = true
        end
    end
end