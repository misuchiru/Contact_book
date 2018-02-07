class VisitsController < ApplicationController
  before_action :find_contact, only: [:new, :create]
  before_action :find_visit, only: [:edit, :update, :destroy]
  def new
    @visit = @contact.visits.new
  end
  def create
    @visit = @contact.visits.new(visit_params)
    if @visit.save
      redirect_to contact_path(@visit.contact)
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @visit.update(visit_params)
      redirect_to contact_path(@visit.contact)
    else
      render :edit
    end
  end
  def destroy
    @visit.destroy if @visit
    redirect_to contact_path(@visit.contact)
  end

  private
  def visit_params
    params.require(:visit).permit(:visit_time, :description, :visitors)
  end
  def find_contact
    @contact = Contact.find(params[:contact_id])
  end
  def find_visit
    @visit = Visit.find_by(id: params[:id])
  end
end
