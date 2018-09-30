
root = 'C:\Users\cechi\Desktop\webkb\#\*\*';
paths = {'course', 'department', 'faculty', 'other', 'project', 'staff', 'student'};
%campos '' significa que o plural foi desconsiderado
words = {'computer','computers','programming','','page','pages','gmt','','project','projects','system','systems','information','informations','date','dates','server','servers','contenttype','','texthtml','','science','sciences','home','homes','lastmodified','','contentlength','','nov','','university','universities','research','researches','language','languages','design','designs','department','departments','new','news','parallel','parallels','network','networks','software','softwares','work','works','course','courses','office','offices','email','emails','student','students','engineering','engineerings','group','groups','distributed','','lab','labs','time','','algorithm','algorithms','web','','tue','','link','links','interest','interests','publication','publications','development','developments','model','models','application','applications','class','classes','problem','problems','cs','','postscript','','c','','schedule','schedules','graduate','graduates','report','reports','technical','technicals','college','colleges','last','','welcome','','conference','conferences','phd','','associate','associates','j','','thu','','fax','','data','','processing','','general','','mimeversion','','technology','technologies','support','','currently','','phone','','cornell','','href','','src','','li',''};
universities = {'cornell', 'utexas', 'washington', 'wisc'};   

for p = 1:1:size(paths,2)
    
    disp("Para a pasta: " + paths{1, p});
       
    rootTemp = replace(root,'#', strtrim(paths{1, p}));
    files = dir(fullfile(rootTemp));
    
    for i = 1:1:size(files,1)
        if files(i).isdir == false
            
            path = [files(i).folder '\' files(i).name];
            str = extractFileText(path);
            str = lower(str);
            
            %contando palavras
            wc = wordCloudCounts(str);
            
            %verificando se as palavras da lista estão 
            %entre as que foram encontradas no arquivo
            data = {};
            for j = 1:1:size(words, 2)
                data{j} = 0;
                if ~strcmp(words{j},'')
                    index = find(wc{:,1} == words{j});
                    if (~isempty(index))      
                        data{j} = wc{index, 2};
                    end
                end
            end
			
            %agrupando plural e singular
            dataToPrint = {};
            for k = 1:1:(size(data, 2)/2)
                dataToPrint{k} = data{k * 2} + data{k * 2 - 1};
            end
            
            %nome da universidade
            dataToPrint{size(words, 2)/2 + 1} = 0; %uma qualquer
            for n = 1:1:size(universities, 2)
                if ~isempty(strfind(files(i).name, universities{n}))
                    dataToPrint{size(words, 2)/2 + 1} = n;
                    break;
                end
            end
            
            dataToPrint{size(words, 2)/2 + 2} = paths{p};     
            
            printFile("dados.arff", dataToPrint);

        end
        if mod(i,100) == 0
            disp(i);
        end
    end
end

