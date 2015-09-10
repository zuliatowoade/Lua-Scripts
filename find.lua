local schema = cjson.decode(ARGV[1])
local id    = cjson.decode(ARGV[2])
local docKey = schema["name"] .. ":" .. id

local doc = redis.call("GET", dockey)
  
return cjson.encode(doc)