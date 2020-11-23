class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end 

    def new
        @blogger = Blogger.new
    end 

    def show
        @blogger = Blogger.find(params[:id])
    end

    def create
        @blogger = Blogger.new

        if @blogger.valid?
            @blogger.save
            redirect_to @blogger
        else
            flash[:errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end


end
