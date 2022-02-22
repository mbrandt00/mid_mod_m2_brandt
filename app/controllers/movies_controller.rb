class MoviesController < ApplicationController
    def show 
        @movie = Movie.find(params[:id])
    end
    def update 
        @movie = Movie.find(params[:id])
        if params[:name].present? 
            actor = Actor.create(actor_params)
            @movie.roles.create(name: role_params[:role], actor_id: actor.id)
            redirect_to("/movies/#{@movie.id}", notice: 'Created successfully')
        end
    end
    private 
    def actor_params
        params.permit(:name, :age)
    end
    def role_params
        params.permit(:role)
    end
end