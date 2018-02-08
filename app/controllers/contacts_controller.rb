class ContactsController < ApplicationController
  before_action :find_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:welcome]
  before_action :comfirm_required, except:[:welcome]

  def welcome
  end
  def index
    @districts = District.all
    if params[:district]
      @district = District.find_by(title: params[:district])
      @contacts = @district.contacts
    else
      @contacts = Contact.all
    end
  end

  def show
    @visits = @contact.visits
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path(district: @contact.district.title)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to contacts_path(district: @contact.district.title)
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy if @contact
    redirect_to contacts_path(district: @contact.district.title)
  end

  private
  def find_contact
    @contact = Contact.find_by(id: params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :cell_phone, :phone, :district_id)
  end
end
