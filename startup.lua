local zeit = 0
local url = "https://timeapi.io/api/Time/current/zone?timeZone=Europe/Berlin"
 
side = {}
    side[1] = "right" --Stunden (Zehner)
    side[2] = "back" --Stunden (Einer)
    side[3] = "top" --Minuten (Zehner)
    side[4] = "left" --Minuten (Einer)
 
segment = {}
    segment[1] = colors.combine(colors.orange, colors.white)
    segment[2] = colors.combine(colors.blue, colors.white, colors.purple, colors.magenta, colors.yellow)
    segment[3] = colors.combine(colors.blue, colors.white, colors.purple, colors.orange, colors.yellow)
    segment[4] = colors.combine(colors.white, colors.purple, colors.gray, colors.orange)
    segment[5] = colors.combine(colors.blue, colors.gray, colors.purple, colors.orange, colors.yellow)
    segment[6] = colors.combine(colors.blue, colors.gray, colors.purple, colors.orange, colors.magenta, colors.yellow)
    segment[7] = colors.combine(colors.blue, colors.white, colors.orange)
    segment[8] = colors.combine(colors.blue, colors.white, colors.gray, colors.purple, colors.orange, colors.magenta, colors.yellow)
    segment[9] = colors.combine(colors.blue, colors.white, colors.gray, colors.purple, colors.orange, colors.yellow)
    segment[10] = colors.combine(colors.blue, colors.white, colors.gray, colors.orange, colors.magenta, colors.yellow)
 
function _side(side, i)
    return (side[i])
end
 
function _segment(segment, pos)
    return (segment[pos])
end
 
function _time(json)
    local hour = json.hour
    local minute = json.minute
    if minute < 10 then
        minute = "0" .. minute
    end
    stime = hour ..minute
    return stime
end
 
function _encode(zeit)
    local laenge = string.len(zeit)
    local seite = 1
    local seg = 0
    for i = 1, laenge, 1 do
        pos = tonumber(string.sub(zeit, i, i))
        if pos == 0 then pos = 10 end
        seg = _segment(segment, pos)
        seite = _side(side, i)
        rs.setBundledOutput(seite, 0)
        rs.setBundledOutput(seite, seg)
    end
end
        
s = 0
vzeit = 0
while s == 0 do
    local response = http.get(url)
    if response then
        local data = response.readAll()
        response.close()
        local json = textutils.unserializeJSON(data)
        if json then
             zeit = _time(json)
             if zeit ~= vzeit then
                print("Aktuelle Uhrzeit: " .. zeit)
                _encode(zeit)
                vzeit = zeit
             end            
        else
             print("Fehler: Zeit konnte nicht abgerufen werden!")   
        end
    else
        print("Fehler: HTTP-Anfrage fehlgeschlagen!")   
    end
    sleep(1)
end
