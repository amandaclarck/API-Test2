# Atualização do e-commerce da Principia

Configuração do projeto: 


* Ruby version: 2.4.2
* Rails version: ~> 5.1.7

* Passos para rodar o projeto:

  - Configure as variáveis do ambiente no ~/.bashrc
        - sudo nano ~/.bashrc
  - As variáveis a serem configuradas são: 
  - Exemplo: export DB_USER="USER"
    - DB_USER
    - DB_PASS
    - DB_HOST
   - Não esqueça de rodar source ~/.bashrc para carregar as variáveis de ambiente 
  - Execute _rails db:create_ e depois _rails db:migrate_
  - Importe a lista de seller_sku a serem atualizados (fiz via pgAdmin)
  - rails s para levantar o servidor
  
  * Para acessar as rotas, utilize o postman.<br/>
    Exemplo:<br/>
    -> Rota: api/products (get) <br/>
    No postman:
    - Digite localhost:3000/api/products
    - Escolha a requisição http como get 
    - Clique em send e veja a resposta (nesse caso, deve trazer todos os produtos)

    _Não é necessário enviar headers pois isso já está sendo tratado no código_
    
 * Caso haja dúvidas entrar em contato com amanda.lssc@gmail.com
