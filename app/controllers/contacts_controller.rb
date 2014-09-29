class ContactsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: {
      contacts: user.contacts,
      shared:   user.shared_contacts
    }
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    contact = Contact.find(params[:id])
    render json: {
      contact: contact,
      user: contact.owner,
      shared: contact.shared_users,
      groups: contact.groups,
      comments: contact.comments
    }
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    render json: contact
    contact.destroy
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
