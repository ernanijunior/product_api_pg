namespace :dev do

  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.production?
  #    show_spinner("Apagando BD...") { %x(rails db:drop) }
   #   show_spinner("Criando BD...") { %x(rails db:create) }
   #   show_spinner("Migrando BD...") { %x(rails db:migrate) }
       show_spinner("Cadastrando produtos...") { %x(rails dev:add_Stock) }

    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end
####################Perguntas e Respostas Questions############################
desc "Adiciona produtos"
task add_Stock: :environment do
  10.times do |i|
    rand(5..10).times do |i|
    Stock.create!(
    provider:      Faker::Company.name,
    name:          "#{Faker::Commerce.product_name} #{Faker::Commerce.material}",
    description:   Faker::Commerce.product_name,
    price:         Faker::Commerce.price,
    amount:        Faker::Address.building_number

)

      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end
end
