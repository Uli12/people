class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
      if @person.update(person_params)

        redirect_to person_path(@person)
      else
        render :edit
      end
  end

  def new
    @page = Page.new
  end

  def create
    @person = Person.create(person_params)
    if @person.save
      redirect_to people_path
    else
      render :new
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    redirect_to peope_path
  end

  private
  def person_params
    params.require(:person).permit(:first_name, :last_name, :age, :career, :single, :movie_quotes)

  end
end
