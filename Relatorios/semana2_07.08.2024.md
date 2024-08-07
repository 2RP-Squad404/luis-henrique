 # Relatório de Estudos
 Nome do Estagiário: luis henrique sampaio
 Data:  /08/2024

 ## Tópicos Estudados:
 comandos do git, o que é git e git flow 

 ## O que o git 
 git é um sistema de controle de versão distribuido 
 sendo utilizado para controlar os historico de alterações 
 de arquivos e cordenar trabalhos de multiplas pessoas em projetos de desenvolvimento de softwares.
 desenvolvido em 2005 por Linus Torvalds, Git permite que os desenvolvedores colaborem de forma eficiente e segura

 ## Conceitos do git 
   
  Branch:
  branches são como fossem linhas independentes de de desinvolvimento
  todo projeto precisa conter pelo menos uma que é criada automaticamente após o primeiro commit
  chamada de main/master
  
  Merge:
  o merge é o jeito do git unir duas branchs em um unico histórico 
  comando git merge permite que você pegue as linhas de desenvolvimento independentes criadas pelo git branch e junta elas 
  
  Commit:
  o commit é como se fosse uma publicação de modificação de no repositório.
  Se algo for alterado de algun repositório teremos o registro salvo com o nome do commit
  
  Pull:
  O pull Atualiza a cópia local do repositório com as mudanças mais recentes do repositório
  
 
## Linhas de Comandos do Git

  Git Init
  cria um novo repositório git e começa a acompanhar um diretório existente
 
  Git Clone 
  cria uma cópia do repositório incluindo todos os arquivos e branchs do projeto

  Git Branch 
  mostra as branches que estão sendo trabalhadas no projeto localmente
  
  Git Status 
  mostra o status das alterações como não controladas, modificadas ou preparadas
  
  Git Push
  atualiza o repositório remoto com todos commits feitos e branchs

  Git Commit
  salva no histórico do projeto e conclui o processo de alterações.

 ## O que é git flow 
   O Gitflow é um modelo alternativo do Git baseado em branches, mas focado nas entregas. 
   Foi criado em 2010 e hoje em dia é utilizado por equipes de desenvolvedores.
   
  ## Componentes principais do GitFlow

   Develop:
   Branch contém o código que está sendo desenvolvido atualmente e inclui as últimas alterações aprovadas. 
   Como ponto de partida para o desenvolvimento de novas funcionalidades e integrações.
  
   Main: esta Branch contém código que já está em produção e é conhecido como estável. 
   Uma nova versão foi disponibilizada a cada commit feito aqui.
   
##  Estrutura Git Flow   

```
Master─────────────────────Hotfix
│
└──────Releases────────────
       │
       └─────Develop───────Bugfix
             │
             └─────Features
                   │
```

 Hotfix:
 responsável por corrigir algum erro critico que impeça o cliente de executar alguma função em ambiente de produção
 
 Releases: 
 responsável por gerenciar e documentar todas as alterações feitas a cada deploy 
 
 Features:
 branchs responsáveis por desenvolver estórias do projeto
 
 Bugfix:
 responsável por corrigir bugs pequenos em ambiente de desenvolvimento (develop)


## Desafios Encontrados:
o maior desafio foi entender o funcionamento do git flow é a sua estrutura e do git poderia dizer que foi alguns conceitos dele

## Feedback e Ajustes:
não faria nenhum ajuste até o momento

## Próximos Passos:
meus proximos passos serian começar a estudar bigquery 
