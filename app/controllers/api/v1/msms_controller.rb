class Api::V1::MsmsController < ApiController
  # This method creates a new ResultDatum object with the given parameters and attempts to save it.
  # If the save is successful, a JSON response with a status of 201 and a message is returned.
  # If the save is unsuccessful, a JSON response with a status of 400 and a message is returned.
  # If an error is encountered, a JSON response with a status of 500 and the error message is returned.
  # /api/v1/results_data.json
  # {"subject": "Science", "timestamp": "2022-04-18 12:02:44.678", "marks": 123.54}
  def results_data
    @result_data = ResultDatum.new(results_data_params) 
    if @result_data.save     
      render json: {status: 201, message: 'Result Data created Successfully.'}
    else
      render json: {status: 400, message: 'Unable to create Result Data, Please Try Again.'}
    end
  rescue StandardError => error
    render json: {status: 500, message: error.message}
  end

  # It used to permit the parameters for the results data and allowing parameters :subject, :timestamp, and :marks to be passed in.
  def results_data_params
    params.permit(:subject,:timestamp, :marks)
  end
end