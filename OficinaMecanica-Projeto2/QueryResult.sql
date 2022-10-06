Select c.Marca, c.Placa, os.idOrdem_Servico, os.DataConclusao, os.Status, p.idPecas, p.Descricao, pu.Qtd, p.Valor from ordem_servico os 
INNER JOIN pecasutilizadas pu ON os.idOrdem_Servico = pu.IdOS
INNER JOIN pecas p ON p.idPecas = pu.IdPecas
INNER JOIN carro c ON c.idCarro = os.idCarro;

Select c.Marca, c.Placa, os.idOrdem_Servico, os.DataConclusao, os.Status, s.idServicos, s.Descricao, s.Valor from ordem_servico os 
INNER JOIN servicorealizado sr ON os.idOrdem_Servico = sr.IdOS
INNER JOIN servicos s ON sr.IdServico = s.idServicos
INNER JOIN carro c ON c.idCarro = os.idCarro;

Select f.idFuncionario, f.Nome, f.Especialidade, e.Descricao from funcionario f
INNER JOIN equipe e ON e.idEquipe = f.IdEquipe
where f.IdEquipe = 2;

Select * from funcionario f
where f.Especialidade = 'MECANICO';

Select os.idOrdem_Servico, os.Status, count(*) from ordem_servico os where os.Status = 'Aguardando'