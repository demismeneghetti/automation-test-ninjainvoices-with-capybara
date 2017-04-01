#language: pt

@edit
Funcionalidade: Edição de clientes

Cenario: Usuario Logado
    * usuario logado acessa cadastro de clientes

Cenario: Editar cliente

  Dado que eu tenho um email "grady.dedrick@yahoo.com"
  Quando faço a edição desse cliente
  Então os dados do cliente são alterados com sucesso
  