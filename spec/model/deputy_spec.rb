require 'rails_helper'

RSpec.describe Deputy, type: :model do

  describe "validations" do
    let(:deputy) { build(:deputy) }
    
    context "relationship" do
      let(:with_expenditures) { deputy_with_expenditures(expenditures_count: 5) }
      it '5 expenditures' do
        expect(with_expenditures.expenditures.count).to eq(5)
      end
      
      it 'without expenditures' do
        expect(deputy.expenditures).to eq([])
      end
    end

    context "uniqueless" do
      let(:duplicate) { create_list(:deputy, 2) }

      it 'cpf valid' do
        expect(deputy).to be_valid
      end

      it "cpf duplicate invalid" do
        second_deputy = duplicate.first
        second_deputy.cpf = duplicate.last.cpf
        expect(second_deputy).to_not be_valid
      end

      it "id_cadastro duplicate invald" do
        second_deputy = duplicate.first
        second_deputy.id_cadastro = duplicate.last.id_cadastro
        expect(second_deputy).to_not be_valid
      end
    end

    context "presence" do
      it "when no has cpf" do
        deputy.cpf = nil
        expect(deputy).to_not be_valid
      end

      it "when no has tx_nome_parlamentar" do
        deputy.tx_nome_parlamentar = nil
        expect(deputy).to_not be_valid
      end

      it "when no has sg_uf" do
        deputy.sg_uf = nil
        expect(deputy).to_not be_valid
      end

      it "when no has id_cadastro" do
        deputy.id_cadastro = nil
        expect(deputy).to_not be_valid
      end
    end
  end
end