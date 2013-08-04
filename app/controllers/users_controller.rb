class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			redirect_to @user, notice: "Thank you for signing up for Ribbit!"
			session[:user_id] = @user.id
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
    @ribbit = Ribbit.new
  end

  def following? user
      self.followeds.include? user
  end

  def follow user
    Relationship.create follower_id: self.id, followed_id: user_id
  end


end
