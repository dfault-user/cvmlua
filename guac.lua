-- local str = string
-- guacamole = {
-- parse = function(string)
 
-- local pos,sect = -1,{};

-- while wait() do
-- local len=str.find(".",nil,pos+1)

-- if len == -1 then break

-- pos=

function decodeResponse(a)
    local pos = -1;
    local sections = {};
    local len = 1;
    while true do
        len = string.find(a, '.', pos+1, true);
        if (len == -1) then break end;
        pos = tonumber(string.sub(a, pos+1, len)) + len +1;
        local t = a:sub(len+1, pos-1):gsub("&#x27;", "'"):gsub("&quot;", '"'):gsub("&#x2F;", '/'):gsub("&lt;", '<'):gsub("&gt;", '>'):gsub("&amp;", '&');
        table.insert(sections,t)
        if (a:sub(pos, pos + 1) == ';') then break end;
    end
      return sections;
    end
    
    function encodeGuac(cypher)
    local command='';
    for i=1,#cypher,1 do
    local current=cypher[i];
    command = command .. #current .. '.' .. current;
    command = command .. (i<#cypher and ',' or ';');
    end
    return command;
    end
    
    return {
    decodeResponse = decodeResponse,
    encodeGuac = encodeGuac
    }