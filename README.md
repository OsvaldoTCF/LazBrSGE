# LazBrSGE
Sistema de gestao empresarial (ERP) escrito em lazarus

##Introdução
Elaborar um aplicativo funcional para maioria das empresas utilizando o minimo de componentes de terceiro possiveis.

##Licença
Este aplicativo é gratuito e codigo aberto ,caso for utilizar para sua empresa use por conta e risco , não haverá garantias de adequação ou de funcionamento,o objetivo é a criação de um aplicativo funcional e gratuito funcional para a maioria das empresas.O aplicativo pode ser vendido desde que compilado , o suporte tecnico tambem pode ser cobrado por algum colaborador,porem o codigo fonte é gratuito e esta a disposição da comunidade.

##Doações
O aplicativo nao tem custo , mas se quiser ajudar o projeto com qualquer valor em uma das contas abaixo:

Bradesco 
Titular Alex Pereira Silva
Agencia 1493-1
Conta :021964-9

Banco do Brasil
Titular Alex Pereira Silva
Agencia 0478-2
Conta :7.079-3

##Pacotes de terceiros
* ACBR PCN
* Pack_powerpdf
* Postgresql (banco de dados) , ou outro compativel com sqldb (mysql,firebird,oracle,sqlite) porem alterando o codigo
* demais fornecidos junto com projeto

##SUPPORT, BUGS, CONTACT
Por favor use [issues page](https://github.com/alexpseletr/LazBrSGE/issues) ou se tiver mais experiencia pode fazer um fork e adicionar um patch com as alterações.

##Recursos
* Cadastro de clientes,fornecedores e transportadoras ... etc (funcional)
* Contas a pagar e receber  (funcional)
* Boleto Bancario (funcional , melhorar componente)
* Lançamentos NFe (funcional,mas pendente finalização geração arquivo SPED)
* Cadastro de produtos (funcional, mas pendente geração custo atualizado)
* Orçamentos (funcional, mas pendente relatorio em pdf direto pelo sistema sem uso de app externo)
* Recibo  (funcional, mas pendente relatorio em pdf direto pelo sistema sem uso de app externo)
* NFe  (funcional, mas pendente melhoria danfe pdf e assinatura direto pelo sistema sem uso de app externo) hoje otimizado para simples.

##Instalação Binario
* Instalar Postgresql
* Copiar o Executavel,para qualquer pasta(se linux dar permissao de execução).
* Copiar o config.ini para a mesma pasta do executavel
* Criar uma subasta com nome temp e outra com nome de remessa.
