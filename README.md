# Projeto SAG - Controle de Lotes Avícolas

Este projeto faz parte de um teste técnico para desenvolvedor Delphi. 
O objetivo é gerenciar o ciclo de vida de lotes de aves, controlando pesagens e mortalidades.

 Tecnologias Utilizadas
- Delphi (VCL)
- Banco de Dados Firebird 3.0
- IBExpert para administração do banco

 Estrutura do Projeto
- `/src`: Código-fonte da aplicação Delphi.
- `/database`: Arquivo de banco de dados (.FDB) e scripts SQL.
- `/bin`: Binários compilados.
- `/database_schema.sql`: Aqui está exibindo todos meus scripts e as querys utilizadas no banco de dados. 

## Como Executar

Para rodar a aplicação principal e validar as funcionalidades de controle avícola, siga estes passos:

Abertura do Projeto: Abra o Delphi e carregue os arquivo de projeto ProjectSAG.dproj localizado na pasta /src.

Para visualizar as Units de lógica e interface (Principal, Dados, Pesagem, etc.), basta navegar pelas abas do Editor ou abrir os arquivos .pas correspondentes na pasta /src

Configuração de Caminho:

Acesse o Data Module (UdmDados).

No componente FDConnection, altere a propriedade Database para o local onde o arquivo .FDB está salvo em sua máquina.

Execução: Pressione F9 para compilar e iniciar o sistema.

Navegação:

O sistema abrirá na aba Gestão de Lotes.

Utilize os botões superiores para lançar Pesagem ou Mortalidade.

O painel lateral à direita atualizará automaticamente a cor (Verde/Amarelo/Vermelho) conforme os dados inseridos, demonstrando a saúde do lote em tempo real.


