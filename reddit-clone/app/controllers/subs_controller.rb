class SubsController < ApplicationController
    
    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.new[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
         if @sub.update(sub_params)
            redirect_to sub_url(@sub)
         else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
         end
    end

    def destroy
        @sub = Sub.find_by(id: params[:id])
        @sub.destroy
        redirect_to subs_url
    end

    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end






end