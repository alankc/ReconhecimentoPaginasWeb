# Reconhecimento de páginas web
O problema consiste em classificar páginas web de conteúdo acadêmico em diferentes categorias. As categorias, já previamente definidas, são:

* Professores;
* Documentos;
* Cursos;
* Alunos;
* Projetos
* Funcionários;
* Outros.

## dadosWeka
Nesta pasta está contido o arquivo produzido do pré processamento dos dados e o arquivo final produzido após a filtragem de atributos por meio do Weka.

## resultados
Estão armazenados os arquivos de log resultantes da aplicação de cada um dos algoritmos de classificação.

## src
Nesta pasta estão contidos os arquivos do matlab utilizados no pré processamento dos dados.

* palavras.m: efetua a contagem das palavras por classe.
* wC.mat: arquivo resultante do palavras.m.
* definirPalavras.m: lista as top N palavras que aparecem entre x e y classes.
* palavrasPorArquivo.m: escreve o arquivo de dados no formato aceito pelo Weka.

## webkb
Base de dados utilizada.
