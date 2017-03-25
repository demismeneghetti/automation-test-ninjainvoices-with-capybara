#language: pt

@cadastro
Funcionalidade: Cadastro de clientes
    Sendo um usuário no Invoices
    Posso cadastrar um novo cliente
    Para gerencia-lo e lançar faturas e cobranças

Cenario: Uma só vez
    * usuario logado acessa cadastro de clientes

Esquema do Cenario: Cadastrar novo cliente

  Dado que eu tenho um cliente <tipo>
  Quando faço o cadastro desse cliente
  Então esse cliente é cadastrado no sistema
  
  Exemplos:
  | tipo    |
  | "Prime" |
  | "Gold"  |

