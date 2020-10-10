

require("tsp")



for i=6253,120000 do
    local url = 'http://nikeapi.honghongdesign.cn/'
    local arr ={}
    arr.s = 'App.IndexAddress.Id'
    arr.id = i
    post(url,arr)
end