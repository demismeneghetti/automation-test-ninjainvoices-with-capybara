#language: pt

@login  
Funcionalidade: Login

@invalid
Esquema do Cenario: Login sem sucesso
  
  Dado que eu tenho um <usuario> e <senha>
  Quando faço Login
  Então vejo a seguinte mensagem <retorno_login>
  
  Exemplos:
      | usuario                     | senha      | retorno_login                       | 
      | "kato.danzo@qaninja.com.br" | "teste123" | "Incorrect password [403]"          | 
      | "padrekevedo@noexiste.com"  | "secret"   | "User not found [403]"              | 
      | "kato.danaz#qaninja.com.br" | "secret"   | "Please enter your e-mail address." |

@logout @success
Cenario: Login com sucesso
  
  Dado que eu tenho um usuário com o seguintes atributos:
      | usuario                   | senha  | 
      | kato.danzo@qaninja.com.br | secret | 
  Quando faço Login
  Então vejo a seguinte mensagem no dashboard:
    """
    Bem Vindo Kato Danzo!
    """

