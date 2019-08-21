module Spree::Admin::ResourceControllerDecorator
  def self.prepend(base)
    base.rescue_from CanCan::AccessDenied, with: :unauthorized
  end
end
Spree::Admin::ResourceController.prepend(Spree::Admin::ResourceControllerDecorator)
