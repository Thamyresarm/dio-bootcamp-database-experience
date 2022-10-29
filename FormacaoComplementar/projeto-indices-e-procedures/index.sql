create index idx_btree_Rastreio on entrega(Codigo_Rastreio) using Btree;
show index from ecommerce.entrega;

show index from ecommerce.pedido;

select p.IdPedido, p.Descricao, e.StatusEntrega, Codigo_Rastreio from entrega e JOIN pedido p 
WHERE p.IdPedido = e.IdPedido 
AND StatusEntrega = 'Enviado';

create index idx_btree_Produto on produto(Pnome) using Btree;
show index from ecommerce.produto;

create index idx_btree_Estoque on estoque(Localizacao) using Btree;
show index from ecommerce.estoque;

create index idx_btree_QtdEstoque on qtd_estoque(Qtd) using Btree;
show index from ecommerce.qtd_estoque;

SELECT Pnome as Produto, Localizacao as Estoque, Qtd FROM qtd_estoque qe JOIN produto p , estoque e
WHERE p.Idproduto = qe.IdProduto
AND e.idEstoque = qe.IdEstoque
AND Qtd <= 20