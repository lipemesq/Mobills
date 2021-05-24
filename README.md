# Mobills

Querida pessoa que vai analisar esse projeto, aqui vai um pouco de contexto do que foi feito, como e porquê:

Tempo:
- Eu fiz esse app no domingo a noite e segunda a tarde. Se quiser uma estimativa das horas é possível ver pelas horas dos commits. 
- Inicialmente eu tentei usar Combine, mas na hora de ligar a UI com a lógica de negócio eu percebi que não sabia ligar o Combine no UIKit, aí voltei e troquei tudo de volta pra um padrão de delegates asuhaushaushua.

Arquitetura:
- Eu aproveitei esse processo pra testar uma arquitetura maluca que pensei na hora: a ideia era usar uma espécie de MVVM,  as as ações do usuário (use cases) ficariam fora do viewModel pra que, assim, quem tiver acesso a um viewmdel não tenha acesso a todas as funções extras as quais ele não deveria ter acesso. Acho que não funcionou muito porque não consegui criar uma estrutura de injeção de dependência eficaz.
- Teoricamente daria pra expandir bem os módulos, trocar o Firebase pelo iCloud, por exemplo, e fazer testes unitários bem de boa nisso. Claro que é tão pequeno que  não tem necessidade, mas né, é bom pra praticar.
- Fiz a separação dos arquivos mais ou menos seguindo o esquema do uncle bob, mas mudei as coisas significativamente.
  - As views estão em uma seção própria porque elas deveriam ser independentes da lógica de negócio nessa arquiitetura maluca.

Features:
- Firebase Auth e Firestore e persistência de login.
- Acabei não tendo tempo pra fazer a interface pra fazer cadastro (sim, eu sei, tbm acho risível), apesar de o módulo e a funcionalidade estar toda implementada. Só não tem onde clicar no botão e mostrar o aviso pra pessoa e.e

**** IMPORTANTE ****
Como não tem UI pra cadastro, tu terás que usar algumas contas que eu criei direto no firebase:
- lipe@mail.com, 123456
- nome@mail.com, banana
- oi.lindo@mail.com, nemvem
- soutop@mail.com, eumesmo
********


- Acabei não tendo tempo pra fazer a interface pra fazer cadastro (sim, eu sei, tbm acho risível), apesar de o módulo e a funcionalidade estar toda implementada. Só não tem onde clicar no botão e mostrar o aviso pra pessoa e.e
- 
- Acabei não tendo tempo pra fazer a interface pra fazer cadastro (sim, eu sei, tbm acho risível), apesar de o módulo e a funcionalidade estar toda implementada. Só não tem onde clicar no botão e mostrar o aviso pra pessoa e.e

Design:
- Super simples, fiz o mínimo possível por causa do tempo, e aí mudei algumas coisinha pra ficar minimamente bonitinho.

Dificuldades:
- A pior parte foi tomar as decisões de arquitetura. Eu queria testar essa arquitura que pensei e aí fui encaixando as pequenas necessidades do app nela. Acabou que foi bem ridiculo eu tentando achar todos os possíveis casos de uso pra arquiitetura num projeto minusculo KKKKKKKKKKK, mas foi bom pra pensar, aprendi umas coisas tops.
- O processo teve um grande bug relativo ao Timestamp do firebase. Esse bug me custou algumas poucas horas.

Considerações finais:
- Dava pra ter feito esse projeto 3x ou com uma puts UI linda se eu tivesse feito em MVC normalzão, mas preferi tentar fazer uma arquitetura diferenciada pra praticar e acabei não conseguindo fazer tudo.
- Foi bem bacana.
- Na próxima vou perguntar se é preferível fazer ium pouco de tudo ou focar muiito em alguma coisa específica e.e

É nóis o/
