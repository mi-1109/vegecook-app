class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :recipe_search

  def recipe_search
    @search = PostRecipe.ransack(params[:q])
    @new_recipes = @search.result(distinct: true).order(created_at: "DESC").page(params[:page]).per(10)
  end

  # ====== ログイン・ログアウト後の遷移先 ==========
  private

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_root_path
    else resource_or_scope == :user
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    else resource_or_scope == :admin
      new_admin_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :is_paid])
  end

end
