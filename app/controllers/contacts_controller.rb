class ContactsController < ApplicationController
    def index
        @contacts = current_user.contacts
    end

    def new
        @contact = Contact.new
    end

    def create
        user = User.find_by(email: contact_params[:record][:email])
        @contact = current_user.contacts.build(record: user)
        if @contact.save
            flash[:notice] = "Contact successfully created"
            redirect_to contact_path
        else
            render :new
        end
    end

    def destroy
        @contact = current_user.contacts.find(params[:id])
        if @contact.destroy
            flash[:notice] = "Contact successfully removed"
        else
            flash[:alert] = "An error ocurred when trying to remove this contact"
        end
        redirect_to contact_path
    end

    private

    def contact_params
        params.require(:contact).permit(record: :email)
    end
end