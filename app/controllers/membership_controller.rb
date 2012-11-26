def new
	@membership = Membership.new
end
def create
    @membership = Membership.new(params[:membership])
end