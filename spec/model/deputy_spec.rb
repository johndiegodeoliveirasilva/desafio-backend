require 'rails_helper'

RSpec.describe Deputy, type: :model do

  describe "validations" do
    let(:deputy) { build(:deputy) }
    
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

      it "ideCadastro duplicate invald" do
        second_deputy = duplicate.first
        second_deputy.ideCadastro = duplicate.last.ideCadastro
        expect(second_deputy).to_not be_valid
      end
    end

    context "presence" do
      it "when no has cpf" do
        deputy.cpf = nil
        expect(deputy).to_not be_valid
      end

      it "when no has txNomeParlamentar" do
        deputy.txNomeParlamentar = nil
        expect(deputy).to_not be_valid
      end

      it "when no has sgUF" do
        deputy.sgUF = nil
        expect(deputy).to_not be_valid
      end

      it "when no has ideCadastro" do
        deputy.ideCadastro = nil
        expect(deputy).to_not be_valid
      end
    end
  end
end