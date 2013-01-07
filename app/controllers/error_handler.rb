module ErrorHandler
  def self.included(base)
    unless Rails.application.config.consider_all_requests_local
      base.module_eval do
        # rescue_from CanCan::AccessDenied do |exception|
        #   render "shared/_access_denied", :status => 403
        # end

        def page_not_found(exception)
          # ExceptionNotifier::Notifier.exception_notification(request.env, exception).deliver if Object.const_defined?(:ExceptionNotifier)
          # render "shared/_404", :status => 404
          render :status => 404
        end

        rescue_from AbstractController::ActionNotFound, ActionController::RoutingError,
          ActionController::UnknownController, ActiveRecord::RecordNotFound, :with => :page_not_found
      end
    end
  end
end
