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

    private

    def contact_params
        params.require(:contact).permit(record: :email)
    end
end