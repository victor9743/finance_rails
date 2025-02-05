require "faker"
require "cpf_cnpj"

if Rails.env.production?
    puts "Seed não permitido rodar em produção"
    exit
end

if User.all.size == 0

    puts "criando usuários"

    # users
    20.times do
        name_user = Faker::Name.unique.name
        email_user = Faker::Internet.unique.email
        cpf_user = CPF.generate(true)

        User::find_or_create_by(name: name_user, email: email_user, cpf: cpf_user ) do |user|
            user.name = name_user
            user.email = email_user
            user.cpf = cpf_user
            user.password = "123456"
        end
    end

    puts "usuários criados com sucesso"
end


puts "criando movimentações"
# movements
50000.times do
    description = [
        # Entradas (Receitas)
        { description: "Salário", type: 1 },
        { description: "Freelance/Autônomo", type: 1 },
        { description: "Dividendos", type: 1 },
        { description: "Rendimentos de Aluguéis", type: 1 },
        { description: "Restituição de Impostos", type: 1 },
        { description: "Prêmios e Bonificações", type: 1 },
        { description: "Venda de Produtos/Bens", type: 1 },
        { description: "Transferências e Doações Recebidas", type: 1 },
        { description: "Reembolsos", type: 1 },
        { description: "Investimentos", type: 1 },

        # Saídas (Despesas)
        { description: "Aluguel/Financiamento", type: 2 },
        { description: "Conta de Água, Luz, Gás", type: 2 },
        { description: "Internet e Telefonia", type: 2 },
        { description: "Supermercado", type: 2 },
        { description: "Saúde", type: 2 },
        { description: "Educação", type: 2 },
        { description: "Transporte", type: 2 },
        { description: "Seguro", type: 2 },
        { description: "Lazer e Entretenimento", type: 2 },
        { description: "Assinaturas e Serviços", type: 2 },
        { description: "Compras Pessoais", type: 2 },
        { description: "Viagens e Turismo", type: 2 },
        { description: "Doações e Caridade", type: 2 },
        { description: "Pagamentos de Empréstimos e Financiamentos", type: 2 },
        { description: "Cartão de Crédito", type: 2 },
        { description: "Aportes em Investimentos", type: 2 }
    ].sample

    Movement.create!(
        description: description[:description],
        movement_type: description[:type],
        value: Faker::Number.decimal(l_digits: rand(2..5), r_digits: 2),
        user_id: User.ids.sample, 
        created_at: Faker::Date.between(from: '1970-01-01', to: '2024-12-31')

    )
end

puts "movimentações criadas com sucesso"

puts "Fim do seed"