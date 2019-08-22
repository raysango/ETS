class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def generate_ets
    @patient = Patient.find(params[:id])
    @facility = Facility.last
    render layout: 'ets_layout'
  end
end