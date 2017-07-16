class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = feed.paginate(page: params[:page])
      # @feed_items = current_user.microposts.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end

  private

    # ユーザーのfeedを返す
    def feed
      following_ids = "SELECT followed_id FROM relationships
                       WHERE follower_id = :user_id"
      Micropost.where("user_id IN (#{following_ids})
                       OR user_id = :user_id", user_id: current_user.id)
    end

end
