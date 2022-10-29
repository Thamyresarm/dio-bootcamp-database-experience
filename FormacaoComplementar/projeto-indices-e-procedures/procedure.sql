delimiter \\
create procedure procedure_manipula(
	in id integer,
    in nome_p varchar(20),
    in classif varchar(30),
    in categoria varchar(60),
    in avaliacao varchar(60),
    in tamanho varchar(60),
    in opcao integer
)
begin
case
	when opcao = 1 then 
        select * from produto;
	when opcao = 2 then 
		update produto set Pnome = nome_p, classificacao_Infantil = classif, Categoria = categoria, Avaliacao = avaliacao, Tamanho=tamanho
        where Idproduto = id;
        select 'Dados Atualizados com Sucesso!' as Message_error;
	when opcao = 3 then 
		delete from produto where Idproduto = id;
        select 'Dados deletado com Sucesso!' as Message_error;
    else
		select 'Selecione uma opção de 1 a 3' as Message_error;
	end case;
end \\
delimiter ;

call procedure_manipula(4,'Bala','1','1','10','S',4);