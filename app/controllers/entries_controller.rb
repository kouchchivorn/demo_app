class EntriesController < ApplicationController
  before_action :signed_in_user, only: [:create,:new]
  before_action :correct_user, only: :destroy
  def new
    @entry = Entry.new
  end

  def index
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @entries = Entry.paginate(:page => params[:page])
    end
  end

  def show
    @entry = Entry.find(params[:id])
    @comment = Comment.new
    @comment.entry = @entry
  end

  def create
    @entry = Entry.new(params[:entry].permit(:title, :content))
    @entry.user = current_user

    if @entry.save
      flash[:notice] = 'Entry Created'
      redirect_to @entry
    else
      flash[:alert]= @entry.errors.full_messages.join(", ")
      render 'new'
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry =Entry.find(params[:id])
    if @entry.update_attributes(params[:entry].permit(:title,:content))
      flash[:notice] = "Post Updated"
      redirect_to @entry
    else
      flash[:alert] = @entry.errors.full_messages.join(", ")
      render "edit"
    end
  end

  private
    def correct_user
      @entry = current_user.entries.find_by(id: params[:id])
      redirect_to root_url if @entry.nil
    end
end
