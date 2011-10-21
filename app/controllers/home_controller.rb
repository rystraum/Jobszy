class HomeController < ApplicationController
  def index
    @jobs = Job.limit(10)
  end
end
