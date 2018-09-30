clear;

paths = {'course', 'department', 'faculty', 'other', 'project', 'staff', 'student'};
root = 'C:\Users\cechi\Desktop\webkb\#\*\*';
wC = {};
for p = 1:1:size(paths,2)   
    disp("Para a pasta: " + paths(1, p));
    
    str = "";
    
    rootTemp = replace(root,'#', strtrim(paths(1, p)));
    files = dir(fullfile(rootTemp));
    
    for i = 1:1:size(files,1)
        if files(i).isdir == false
            path = [files(i).folder '\' files(i).name];
            str = str + lower(extractFileText(path));
        end
        if mod(i,100) == 0
            disp(i);
        end
    end
    
    str = eraseTags(str);
    
    variável que contém os dicionários
    necessário matlab >= r2017b
    wC{p} = wordCloudCounts(str); 
    
    figure;
    (str);
    title(strtrim(paths(p,:)));
end

