local schema = cjson.decode(ARGV[1])
local id    = cjson.decode(ARGV[2])
local docKey = schema["name"] .. ":" .. id


local existingDoc = redis.call("GET", dockey)
local updatedDoc = 
redis.call("SET",key, encode(updatedDoc))


if (existingDoc[field] !== updatedDoc[field]) return;
    local key = schema["name"] .. ":" .. field .. "idx"
    local oldVal = existingDoc["field"] .. ":" .. id
    local newVal = updatedDoc["field"] .. ":" .. id
    --remove old data from secondary indexes
    multi = multi.zrem(key, oldVal)
    --add updated data to secondary indexes
    redis.call("ZADD", key, 0, newVal)
    
return cjson.encode(updatedDoc)


