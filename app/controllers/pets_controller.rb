class PetsController < ApplicationController

    before_action :authorize, only: [:show]

    def index
        @pets_by_species = Pet.preload(:breed).group_by { |pet| pet.breed.species }
    end

    def show 
        @pet = Pet.find_by(id: params[:id])
    end

    def new
        @pet = Pet.new
    end 

end
