class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def generate_ets
    @patient = Patient.find(params[:id])
    @facility = Facility.last # Example Facility to test ETS Form
    render layout: 'ets_layout'
  end
end