% https://stackoverflow.com/a/55117914

server = tcpserver('localhost', 1234,"ConnectionChangedFcn",@connectionFcn)

function connectionFcn(src, ~)
    if src.Connected
       data = read(src, 11, "string")
       write(src, "Hello back!")
    end
end