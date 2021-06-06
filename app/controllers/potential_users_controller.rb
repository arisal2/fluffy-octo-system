# frozen_string_literal: true

# Controller to import potential users for mailing list
class PotentialUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html
      format.json { render json: PotentialUserDatatable.new(params) }
    end
  end

  def import
    PotentialUser.import(params[:file])
    redirect_to potential_users_path, notice: 'File was successfully imported.'
  rescue StandardError => e
    redirect_to potential_users_path, notice: e.message.to_s
  end
end
