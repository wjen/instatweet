class TweetsController < ApplicationController
before_action :logged_in_user, only: [:create :destroy]
  def create
    @tweet = current_user.tweets.build(tweet_params)
      if @tweet.save
        flash[:success] = "Tweet created!"
        redirect_to root_url
      else
        render 'static_pages/home'
      end
  end

  def destroy

  end

  private

    def tweets_params
      params.require(:tweet).permit(:content)
    end


end
