class DocumentsController < ApplicationController
	before_action :set_document, only: [:edit, :show, :update, :destroy]

	def index
		@documents = Document.all
	end

	def new
		@document = Document.new
	end

	def create
		@document = Document.new(document_params)
		if @document.save
			redirect_to documents_path, notice: "Document created successfully"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @document.update(document_params)
			redirect_to documents_path, notice: "Document updated successfully"
		else
			render :edit
		end
	end

	def show
	end

	def destroy
		if @document.destroy
			redirect_to documents_path, notice: "Document deleted successfully"
		else
			flash[:errors] = "Something went wrong!"
			redirect_to documents_path
		end
	end

	private

	def set_document
		@document = Document.find(params[:id])
	rescue ActiveRecord::RecordNotFound => error
		redirect_to documents_path, notice: "Document not found"
	end


	def document_params
		params.require(:document).permit(:name, :doc_type, :employee_id, :file)
	end
end
