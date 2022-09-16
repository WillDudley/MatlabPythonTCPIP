% https://stackoverflow.com/a/55117914

server = tcpserver('localhost', 1234,"ConnectionChangedFcn",@connectionFcn)

function callbackFcn(src, ~)
    if src.Connected
       data = strtrim(read(src, 1024, "string"))
       disp(data)
       j = jsondecode(data)
       disp(j.counter)
       disp(j)
       j.counter = j.counter + 10;
       write(src, pad(jsonencode(j), 1024))
    end
end

function connectionFcn(src, ~)
    configureCallback(src,"byte",1024,@callbackFcn)
    %if src.Connected
    %   data = read(src, 11, "string")
    %   write(src, "Hello back!" + data)
    %end
end