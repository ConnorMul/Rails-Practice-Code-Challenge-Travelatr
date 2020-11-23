class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
        @post = Post.new

        if @post.valid?
            @post.save
            redirect_to @post
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def index
        @posts = Post.all
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update
        redirect_to @post
    end

end
