class StudentsController < ApplicationController
  def index
  end

  def new
    @dojo = Dojo.find(params[:dojo_id])
  end

  def create
    @student = Student.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], dojo_id: params[:student_id])
    redirect_to "/dojos/" + params[:dojo_id].to_s
  end

  def show
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
    @students = Student.where(dojo_id: params[:dojo_id]).where.not(id: params[:id])
  end

  def edit
    @student = Student.find(params[:id])
    @dojo = Dojo.find(params[:dojo_id])
    @all_dojos = Dojo.where.not(id: params[:dojo_id])
    @all_students = Student.where("dojo_id = ? AND DATE(created_at) = ?")
  end

  def update
    student = Student.find(params[:id])
    @dojo = Dojo.find(params[:dojo_id])
    student.first_name = params[:first_name]
    student.last_name = params[:last_name]
    student.email = params[:email]
    student.dojo_id = params[:student_id]
    student.save
    redirect_to '/dojos/' + student.dojo_id.to_s + '/students/' + params[:id].to_s
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    redirect_to '/dojos'
  end
end
