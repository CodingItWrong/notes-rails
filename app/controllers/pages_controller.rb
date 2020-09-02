# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to notes_path(current_user.display_name)
    else
      redirect_to new_user_session_path
    end
  end
end
