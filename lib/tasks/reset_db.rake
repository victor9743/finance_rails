namespace :reset do
    desc "Reinicia o banco de dados: drop, create e migrate"
    task db: :environment do
      puts "Resetando o banco de dados..."
      
      system("rails db:drop")
      system("rails db:create")
      system("rails db:migrate")
      
      puts "Banco de dados reiniciado com sucesso!, rode o rails db:seed para popula-lo"
    end
  end
  