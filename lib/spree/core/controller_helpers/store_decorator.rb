module Spree
  module Core
    module ControllerHelpers
      module StoreDecorator
        def self.prepended(base)
          base.included do
            before_action :set_user_current_store
          end
        end

        def set_user_current_store
          return if try_spree_current_user.nil?

          try_spree_current_user.current_store = current_store
          try_spree_current_user.save
        end
      end
    end
  end
end

Spree::Core::ControllerHelpers::Store.prepend Spree::Core::ControllerHelpers::StoreDecorator
