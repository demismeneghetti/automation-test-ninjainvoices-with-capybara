#language: pt

@remove
Funcionalidade: Exclusão de clientes

Cenario: Usuario Logado
    * usuario logado acessa cadastro de clientes

@save_for_remove
Cenario: Remover cliente

  Quando faço a exclusão desse cliente
  Então esse cliente não deve ser exbido na busca
  