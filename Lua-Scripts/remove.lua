local schema = cjson.decode(ARGV[1])
local doc    = cjson.decode(ARGV[2])
local id = doc["id"]
local docKey = schema["name"] .. ":" .. id
local idIdx = schema["name"] .. ":" .. "ids"
local docCount = redis.call("DEL", dockey)
local idxCount =  redis.call("ZREM", idIdx, id)
  
return cjson.encode(docCount)
