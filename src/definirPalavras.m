function [listaDePalavras] = definirPalavras(qtdPalavras, wCC, qtdInicio, qtdFim)
    palavras = {};
    for i = 1:1:size(wCC, 2)
        palavras{i} = wCC{1, i}{1:1:qtdPalavras, 1};
    end

    palavrasDisjuncao = "";
    for i = 1:1:size(palavras, 2)
        palavrasI = palavras{:, i};
         for j = 1:1:size(palavrasI, 1)
             palavrasDisjuncao = palavrasDisjuncao + " " + palavrasI(j);
         end
    end
    palavrasArquivos = wordCloudCounts(palavrasDisjuncao);

    listaDePalavras = palavrasArquivos{find(palavrasArquivos{:,2} >= qtdInicio & palavrasArquivos{:,2} <= qtdFim), 1};
end