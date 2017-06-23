#language: pt

@login  
Funcionalidade: Login

Esquema do Cenario: Login sem sucesso
  Dado que eu tenho um <Usuario> e <Senha>
  Quando faço Login
  Então vejo a seguinte mensagem <Mensagem_de_erro>
  
  Exemplos:
      | Usuario                     | Senha      | Mensagem_de_erro                    | 
      | "kato.danzo@qaninja.com.br" | "teste123" | "Incorrect password [403]"          | 
      | "padrekevedo@noexiste.com"  | "secret"   | "User not found [403]"              | 
      | "kato.danaz#qaninja.com.br" | "secret"   | "Please enter your e-mail address." |


Cenario: Login com sucesso
  Dado que eu tenho um usuário com o seguintes atributos:
      | Usuario                   | Senha  | 
      | kato.danzo@qaninja.com.br | secret | 
  Quando faço Login
  Então vejo a seguinte mensagem no dashboard:
    """
    Bem Vindo Kato Danzo!
    """