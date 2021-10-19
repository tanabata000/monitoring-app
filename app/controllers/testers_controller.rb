class TestersController < ApplicationController
  def show
    @tester = Tester.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
