module Spree
  class UserMailer < BaseMailer
    def reset_password_instructions(user, token, *_args)
      @current_store = user&.current_store || Spree::Store.current
      @locale = user&.current_store&.default_locale
      I18n.locale = @locale if @locale.present?
      @edit_password_reset_url = spree.edit_spree_user_password_url(reset_password_token: token, host: @current_store.url)

      mail to: user.email, from: from_address, subject: @current_store.name + ' ' + I18n.t(:subject, scope: [:devise, :mailer, :reset_password_instructions])
    end

    def confirmation_instructions(user, token, _opts = {})
      @current_store = user&.current_store || Spree::Store.current
      @locale = user&.current_store&.default_locale
      I18n.locale = @locale if @locale.present?
      @confirmation_url = spree.spree_user_confirmation_url(confirmation_token: token, host: @current_store.url)
      @email = user.email

      mail to: user.email, from: from_address, subject: @current_store.name + ' ' + I18n.t(:subject, scope: [:devise, :mailer, :confirmation_instructions])
    end
  end
end
