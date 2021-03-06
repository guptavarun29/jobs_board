class JobsController < ApplicationController
before_action :find_job , except: [:create , :index , :new]  

  def index
  	if params[:category].blank?
  	@jobs = Job.all
    else
    	
    @category = Category.find_by(name: params[:category])
    @jobs = @category.jobs
    end	
  end
  def show
  end	
  def new
  	@job = Job.new
  
  end	
  def create
  	@job = Job.new(jobs_params)
  	if @job.save
  		
  		redirect_to @job 
  	else
  	   
  	    redirect_to :back	
    end
  end
  
     
  def destroy
  	@job.destroy
  	redirect_to root_path
  end
  
  def update
    if @job.update(jobs_params)
      redirect_to @job
    else 
     render 'edit'     
    end
  end
  def show
  
  end

  def edit

  end

  private
  
  def jobs_params
    params.require(:job).permit(:title , :description , :company , :url ,:category_id)
  end	
  def find_job
  	@job = Job.find(params[:id])
  end
  
end
