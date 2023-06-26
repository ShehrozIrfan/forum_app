class ForumThreadsController < ApplicationController
  def index
  end

  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.new
  end

  def create
    # need to create the thread for the current user and add the user id to forum_posts
    @forum_thread = User.first.forum_threads.new(forum_thread_params)
    @forum_thread.forum_posts.first.user_id = User.first.id

    if @forum_thread.save
      redirect_to @forum_thread
    else
      render :new
    end
  end

  def show
    @forum_thread = ForumThread.find_by(id: params[:id])
  end

  private

  def forum_thread_params
    params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])
  end
end
