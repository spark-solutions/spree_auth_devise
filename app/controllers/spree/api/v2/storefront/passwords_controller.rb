module Spree
  module Api
    module V2
      module Storefront
        class PasswordsController < ::Devise::PasswordsController
          def create
            user = Spree.user_class.find_by(email: params[:user][:email])

            if user&.send_reset_password_instructions
              head :ok
            else
              head :not_found
            end
          end

          def update
            binding.pry

            if params[:user][:password].blank?
              self.resource = resource_class.new
              resource.reset_password_token = params[:user][:reset_password_token]
              set_flash_message(:error, :cannot_be_blank)
              render :edit
            else
              super
            end
          end
        end
      end
    end
  end
end
