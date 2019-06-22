class FriendshipsController < ApplicationController

  before_action :authenticate_user!

  def create
    friendship = current_user.requested_friendships.build(friendship_params)
    if friendship.save
      flash[:success] = "Sent friend request."
    else
      flash[:danger] = "Error. Friend request not sent."
    end
    redirect_back(fallback_location: root_path)
  end

  def update
  	friendship = Friendship.find(params[:id])
  	potential_friend = friendship.friender
  	if params[:accepted]
	  	friendship.accept_friend_request
	  	flash[:success] = "You are now friends with #{potential_friend.username}."
	  else
	  	current_user.unfriend(potential_friend)
	  	flash[:notice] = "You have declined #{potential_friend.username}'s "\
	  									 "friend request."
	  end
	  redirect_back(fallback_location: root_path)
  end

  def destroy
  	Friendship.find(params[:id]).destroy
  	flash[:success] = "User unfriended."
  	redirect_to friends_path
  end

  private
  def friendship_params
    params.permit(:friended_id)
  end
end
