class FriendRequestsController < ApplicationController
  def index
    @user = current_user
    @pending_friend_requests = @user.pending_friend_requests
    @requested_friend_requests = @user.requested_friend_requests
  end
end
