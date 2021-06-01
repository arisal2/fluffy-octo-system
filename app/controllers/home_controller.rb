# frozen_string_literal: true

# Controller to handle homepage actions
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
