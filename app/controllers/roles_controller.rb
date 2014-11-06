class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end

  def new_form
  end

  def create_row
    @role = Role.new
    @role.character_name = params[:character_name]
    @role.movie_id = params[:movie_id]
    @role.actor_id = params[:actor_id]

    @role.save

    render("show")
  end

  def edit_form
    @role = Role.find(params[:id])
  end

  def update_row
    @role = Role.find(params[:id])

    @role.character_name = params[:character_name]
    @role.movie_id = params[:movie_id]
    @role.actor_id = params[:actor_id]

    @role.save

    render("show")
  end

  def destroy
    @role = Role.find(params[:id])

    @role.destroy
  end
end
