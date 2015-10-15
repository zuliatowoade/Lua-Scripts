local schema = ARGV[1]
local query = ARGV[2]     #a dictionary of fields

data = {}
for  field in query:
    local idxkey =  schema["name"] .. ":" .. field .. ":idx"
    local value = query[field]
    table.insert(data, redis.call("ZRANGEBYLEX", idxkey, ("'[" .. value .. ":'"), ("'[" .. value .. ":'\xff")  0, id))
end 
  
local valueIdToDocKey = function (dataItem)
    dataItem = split(dataItem, ":")
    id = table.remove(dataItem)
    local docKey = schema["name"] .. ":" .. id
    return dockey
    
end


keys = {}
for item in data:
     table.insert(keys, valueIdToDockey(item))
     
     
local docs = redis.call('MGET', keys)
return cjson.encode(docs)
