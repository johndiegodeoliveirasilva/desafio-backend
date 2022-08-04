class FileCeapsController < ApplicationController

  def index
    @q = FileCeap.ransack(params[:q])
    @file_ceaps = @q.result(distinct: true)

    respond_to do |format|
      format.html
    end
  end

  def new
    @file_ceap = FileCeap.new
    respond_to do |format|
      format.js
    end
  end


  def create
    @file_ceap = FileCeap.new(params_file_ceap)
    respond_to do |format|
      if @file_ceap.save
        # flash[:notice] = t('.digisacs.controllers.create.success!')
        format.html  { redirect_to file_ceaps_url }
      else
        flash[:error] = @file_ceap.errors.full_messages
        format.js
      end
    end
  end

  def process_file
    resp = Imports::Creator.run(params[:file])
    if resp.is_a?(FileCeap)
      Process::Creator.run(resp)
      redirect_to action: :index
    else
      render "new"
    end
  end

  private

  def params_file_ceap
    params.require(:file_ceap).permit(:title, :avatar)
  end
end

