class DefaultController < ApplicationController
	before_action :authenticate_user!
end