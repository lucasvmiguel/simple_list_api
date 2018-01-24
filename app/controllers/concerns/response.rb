module Response
  def render_or_unprocessable_entity(success, entity, status)
    if success
      render json: { status: 'success', data: entity }, status: status
    else
      render json: { status: 'fail', errors: entity.errors }, status: :unprocessable_entity
    end
  end
end