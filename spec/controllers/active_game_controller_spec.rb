require 'rails_helper'

RSpec.describe ActiveGameController, type: :controller do
  let!(:dan) { create(:dan) }
  let!(:serial_number) { create(:active_serial_number, user: dan) }
  let!(:first_game) { create(:game, user: dan) }
  let!(:second_game) { create(:game, user: dan, name: 'Catch Me') }

  describe 'GET #index' do
    let(:route) do
      {
        user_id: dan.to_param,
        format: :json
      }
    end

    context 'the second game is active' do
      let!(:ten_commands) do
        10.times.map do |i|
          create(:command, data: i, name: SecureRandom.hex(5))
        end
      end

      let!(:ten_instructions) do
        ten_commands.map do |c|
          second_game.instructions.create!(command: c)
        end
      end

      before :each do
        ActiveGame.create(user: dan, game: second_game)
      end

      let(:expected_json) do
        {
          'instructions' => ten_instructions.map { |i| i.command.data }
        }
      end

      it 'returns the list of instructions of the second game' do
        get :index, route

        json = JSON.parse(response.body)
        expect(json).to eq(expected_json)
      end
    end
  end

  describe "GET #activate on the first game" do
    let(:route) do
      {
        user_id: dan.id,
        game_id: game.id
      }
    end

    context 'no active game' do
      let(:first_active_game) do
        ActiveGame.where(user: dan, game: first_game)
      end

      let(:second_active_game) do
        ActiveGame.where(user: dan, game: second_game)
      end

      context 'active the first game' do
        let(:game) { first_game }

        before :each do
          get :activate, route
        end

        it 'The first game is active' do
          expect(first_active_game.exists?).to eq(true)
        end

        it 'The second game is inactive' do
          expect(second_active_game.exists?).to eq(false)
        end
      end

      context 'active the second game' do
        let(:game) { second_game }

        before :each do
          get :activate, route
        end

        it 'The first game is inactive' do
          expect(first_active_game.exists?).to eq(false)
        end

        it 'The second game is active' do
          expect(second_active_game.exists?).to eq(true)
        end
      end

      context 'first game is already active' do
        let(:game) { second_game }

        before :each do
          first_active_game.create!
        end

        context 'activate the second game' do
          before :each do
            get :activate, route
          end

          it 'The first game is inactive' do
            expect(first_active_game.exists?).to eq(false)
          end

          it 'The second game is active' do
            expect(second_active_game.exists?).to eq(true)
          end
        end
      end

      it 'redirects to user_games_path' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
