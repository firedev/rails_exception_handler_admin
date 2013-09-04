require_dependency "rails_exception_handler_admin/application_controller"

module RailsExceptionHandlerAdmin
  class ErrorMessagesController < ApplicationController
    # GET /error_messages
    # GET /error_messages.json
    def index
      @error_messages = params[:app] ? ErrorMessage.where(app_name: params[:app]).order('created_at DESC') : ErrorMessage.order('created_at DESC')

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @error_messages }
      end
    end

    # GET /error_messages/1
    # GET /error_messages/1.json
    def show
      @error_message = ErrorMessage.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @error_message }
      end
    end

    # PUT /error_messages/1
    # PUT /error_messages/1.json
    def update
      @error_message = ErrorMessage.find(params[:id])

      respond_to do |format|
        if @error_message.update_attributes(params[:error_message])
          format.html { redirect_to @error_message, notice: 'Error message was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @error_message.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /error_messages/1
    # DELETE /error_messages/1.json
    def destroy
      @error_message = ErrorMessage.find(params[:id])
      @error_message.destroy

      respond_to do |format|
        format.html { redirect_to error_messages_url }
        format.json { head :no_content }
      end
    end
  end
end
