class CpfValidator < ActiveModel::Validator
  def validate(record)
    cpf = CPF.new(record.cpf)
    
    unless cpf.valid?
      record.errors.add(:cpf, 'não é valido')
    end
  end
end