puts "Criando áreas de atuação..."

AreaAtuacao.find_or_create_by!(nome: "Silvicultura") do |a|
  a.descricao = "Consultoria em manejo florestal, reflorestamento e sustentabilidade ambiental"
end

AreaAtuacao.find_or_create_by!(nome: "Sistemas Inteligentes") do |a|
  a.descricao = "Desenvolvimento de sistemas de automação, IoT e soluções inteligentes"
end

AreaAtuacao.find_or_create_by!(nome: "Agroindústria") do |a|
  a.descricao = "Consultoria em processamento agroindustrial, cadeia produtiva e qualidade"
end

AreaAtuacao.find_or_create_by!(nome: "Mecanização") do |a|
  a.descricao = "Consultoria em maquinário agrícola, manutenção e otimização de processos"
end

puts "Áreas criadas: #{AreaAtuacao.count}"
