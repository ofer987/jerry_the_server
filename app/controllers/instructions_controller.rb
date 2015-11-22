class InstructionsController < ApplicationController
  before_action :set_user
  before_action :set_game
  before_action :set_instruction, only: [:show, :edit, :update, :destroy]

  # GET /instructions
  # GET /instructions.json
  def index
    @instructions = @game.instructions.all

    respond_to do |format|
      format.html { render action: :index }
      format.json do
        render json: { instructions: @instructions.map { |i| i.command.data } }
      end
    end
  end

  # GET /instructions/1
  # GET /instructions/1.json
  def show
  end

  # GET /instructions/new
  def new
    @instruction = @game.instructions.build
  end

  # GET /instructions/1/edit
  def edit
  end

  # POST /instructions
  # POST /instructions.json
  def create
    @instruction = Instruction.new(instruction_params)

    respond_to do |format|
      if @instruction.save
        format.html { redirect_to [@user, @game, @instruction], notice: 'Instruction was successfully created.' }
        format.json { render :show, status: :created, location: @instruction }
      else
        format.html { render :new }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructions/1
  # PATCH/PUT /instructions/1.json
  def update
    respond_to do |format|
      if @instruction.update(instruction_params)
        format.html { redirect_to [@user, @game, @instruction], notice: 'Instruction was successfully updated.' }
        format.json { render :show, status: :ok, location: @instruction }
      else
        format.html { render :edit }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructions/1
  # DELETE /instructions/1.json
  def destroy
    @instruction.destroy
    respond_to do |format|
      format.html { redirect_to user_game_instructions_url(@user, @game), notice: 'Instruction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_instruction
    @instruction = @game.instructions.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def instruction_params
    params
      .require(:instruction)
      .permit(:game_id, :command_id, :name, :parameters, :precedence)
  end
end
