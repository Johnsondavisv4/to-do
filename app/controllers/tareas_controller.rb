class TareasController < ApplicationController
  # Desactivamos el chequeo de token CSRF ya que las APIs no lo usan
  skip_before_action :verify_authenticity_token, raise: false

  def index
    tareas = Tarea.order(created_at: :desc)
    render json: tareas
  end

  def show
    tarea = Tarea.find(params[:id])
    render json: tarea
  end

  def create
    tarea = Tarea.new(tarea_params)
    if tarea.save
      render json: tarea, status: :created
    else
      render json: { errors: tarea.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    tarea = Tarea.find(params[:id])
    if tarea.update(tarea_params)
      render json: tarea
    else
      render json: { errors: tarea.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    tarea = Tarea.find(params[:id])
    tarea.destroy
    head :no_content
  end

  private

  def tarea_params
    params.require(:tarea).permit(:nombre, :completada)
  end
end
