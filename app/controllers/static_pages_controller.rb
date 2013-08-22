class StaticPagesController < ApplicationController

  def home
  end

  def empresa
  end

  def destroy
    do_logout
    redirect_to root_url

  end
end
