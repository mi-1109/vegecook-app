class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :recipe_search

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e
    render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
  end

  def recipe_search
    @search = PostRecipe.includes(:user).where(is_draft: false).joins(%|
      LEFT OUTER JOIN (
        SELECT
          `likes`.`post_recipe_id` AS post_recipe_id,
          COUNT(*) AS like_count
        FROM
          `likes`
        GROUP BY
          `likes`.`post_recipe_id`
      ) AS post_recipe_like_count
      ON post_recipes.id = post_recipe_like_count.post_recipe_id
    |).ransack(params[:q])
    @latest_recipes = @search.result(distinct: true).order(created_at: "DESC").page(params[:page]).per(12)
    @popular_recipes = @search.result(distinct: true).order(like_count: "DESC").page(params[:page]).per(12)
  end

  private

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    else
      new_admin_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :is_paid])
  end
end
