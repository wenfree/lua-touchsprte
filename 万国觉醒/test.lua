require('tsp')
require('AWZ')
require('ZZBase64')
require("yzm")
require('api')
require('token')


sz = require('sz')
__game = {}
__game.imei = sz.system.serialnumber();
__game.phone_name = getDeviceName()

function update_token(token,idfa,qq)
    local RokToken = llsGameToken();
    local info ={}
    info['token']=token
    info['idfa']=idfa
    info['qq']=qq
    info['s']='Rok.Token'
    _api_rok(info)
end


local a = {
{'Kzj8COzXtK7eBfqhP3i328qvZ2f0aQib','[  {    "app_token" : "Kzj8COzXtK7eBfqhP3i328qvZ2f0aQib",    "user_password" : "",    "app_uid" : "7945433",    "player_id" : "EFA985C4DFEC5EA290DB0CE480B60B74",    "nickname" : "游客",    "user_type" : 2  }]','2442037157-aamsk04484'},
{'YoRYiropE9znQhy4C2NEjuYDPMNIxoOC','[  {    "app_token" : "YoRYiropE9znQhy4C2NEjuYDPMNIxoOC",    "user_password" : "",    "app_uid" : "7945445",    "player_id" : "992EEA4AF01AAA68FA2834FB36B5579D",    "nickname" : "游客",    "user_type" : 2  }]','230422094-usqgc46440'},
{'kymZn6CuwVUjXlorSR6DDrvdHpy72a6I','[  {    "app_token" : "kymZn6CuwVUjXlorSR6DDrvdHpy72a6I",    "user_password" : "",    "app_uid" : "6982853",    "player_id" : "DE507EA79C80D6CBF6C4DCD2093A6A8F",    "third_party_token" : "3EDAAA0FDCEFCB61E02BF55E08A61FB7",    "user_type" : 7  },  {    "app_token" : "E96oLXjSQFGUm1TfQevZKLXObnlDea2e",    "user_password" : "",    "app_uid" : "7929177",    "player_id" : "72D5B99E-86FB-446D-9305-9D3ACDD16D35",    "nickname" : "游客",    "user_type" : 1  }]','3277657798-rnydu54533'},
{'yCohimqAqUQ4aR6k3CKB1sJZcWrcxnbf','[  {    "app_token" : "yCohimqAqUQ4aR6k3CKB1sJZcWrcxnbf",    "user_password" : "",    "app_uid" : "7937425",    "player_id" : "217D9AC0C981D7762077343B61CE11ED",    "nickname" : "游客",    "user_type" : 2  }]','458903017-avusq47569'},
{'np9JpVCUeEfKoo7VpkbjXkfzmbWpeGMM','[  {    "app_token" : "np9JpVCUeEfKoo7VpkbjXkfzmbWpeGMM",    "user_password" : "",    "app_uid" : "7937523",    "player_id" : "20A8ED1B2685E080EDAE07A7083CE9EB",    "nickname" : "游客",    "user_type" : 2  }]','3233917820-tfvd7375 '},
{'eYrdwt4ljpTfFncoonqlGVhAogJzUXZM','[  {    "app_token" : "eYrdwt4ljpTfFncoonqlGVhAogJzUXZM",    "user_password" : "",    "app_uid" : "7937663",    "player_id" : "FC9DDE82CEDA12638F2A649EC0E6838B",    "nickname" : "游客",    "user_type" : 2  }]','2993390438-hwal26323'},
{'a4FO6hKnHNx5CuozvtTMfsjEWYd1AAxv','[  {    "app_token" : "a4FO6hKnHNx5CuozvtTMfsjEWYd1AAxv",    "user_password" : "",    "app_uid" : "7937782",    "player_id" : "6AF82346A09014CC54994D766F0C94EB",    "nickname" : "游客",    "user_type" : 2  }]','630749251-ayitd42910'},
{'bJ1ZBW0RWI1A75WMhuPrmqTeRU1l4e16','[  {    "app_token" : "bJ1ZBW0RWI1A75WMhuPrmqTeRU1l4e16",    "user_password" : "",    "app_uid" : "7938082",    "player_id" : "FD34AFA4CCE5B4DCF77DAAC5F993E922",    "nickname" : "游客",    "user_type" : 2  }]','753445385-acudb48156'},
{'on41Q6227EW11LvpxPIkjwip0QS1NAjq','[  {    "app_token" : "on41Q6227EW11LvpxPIkjwip0QS1NAjq",    "user_password" : "",    "app_uid" : "7938189",    "player_id" : "EC4A2FAB316303F70E209DB7FD3913F0",    "nickname" : "游客",    "user_type" : 2  }]','481294627-ys20180724'},
{'5i1GBlBhji24w5BouRK8D56qLGx28m9K','[  {    "app_token" : "5i1GBlBhji24w5BouRK8D56qLGx28m9K",    "user_password" : "",    "app_uid" : "7938290",    "player_id" : "35F6E15DE6D525EB2A45D65CE4B6A889",    "nickname" : "游客",    "user_type" : 2  }]','1923786128-Qiodrsdlc883376'},
{'NK22kmPXNUzkFh6Hp29NQEm7WwGJRykL','[  {    "app_token" : "NK22kmPXNUzkFh6Hp29NQEm7WwGJRykL",    "user_password" : "",    "app_uid" : "7938365",    "player_id" : "B14CF8A9D45911614109A75D13E6F628",    "nickname" : "游客",    "user_type" : 2  }]','3146130668-ekykm86062'},
{'Lpgkl4AyOYejDyhlxzHhNVOLozWxibNu','[  {    "app_token" : "Lpgkl4AyOYejDyhlxzHhNVOLozWxibNu",    "user_password" : "",    "app_uid" : "7938447",    "player_id" : "7E6FBA706F85B69B7B47A4AE7B7C3BB3",    "nickname" : "游客",    "user_type" : 2  }]','2948350760-jp95x3s068h'},
{'ON3NIojyJn4z74wQZkLAa3AZ1dRTI8ll','[  {    "app_token" : "ON3NIojyJn4z74wQZkLAa3AZ1dRTI8ll",    "user_password" : "",    "app_uid" : "7938913",    "player_id" : "893349FF4E81D901C86A3155013C173C",    "nickname" : "游客",    "user_type" : 2  }]','642595974-ayamb48496'},
{'IS8KTJ4VJ6cm11qReeiHSOT1bjAKZEq0','[  {    "app_token" : "IS8KTJ4VJ6cm11qReeiHSOT1bjAKZEq0",    "user_password" : "",    "app_uid" : "7939308",    "player_id" : "FAE92915FE60A416244BD8DFA2A894C5",    "nickname" : "游客",    "user_type" : 2  }]','3011857536-egsb7421 '},
{'eaDSqslOVyM6h7ndUhnUioBNNaNVpXim','[  {    "app_token" : "eaDSqslOVyM6h7ndUhnUioBNNaNVpXim",    "user_password" : "",    "app_uid" : "7939390",    "player_id" : "BD9DB346983B68CCFBB3147C3162395B",    "nickname" : "游客",    "user_type" : 2  }]','2729459716-Qioruxrcn897983'},
{'5cqEZnaPerrHmpDzqRNHrbohrgsxN5go','[  {    "app_token" : "5cqEZnaPerrHmpDzqRNHrbohrgsxN5go",    "user_password" : "",    "app_uid" : "7939478",    "player_id" : "0FFF603A410F070D313D9A1DA7BF8087",    "nickname" : "游客",    "user_type" : 2  }]','671019215-drtvf99915'},
{'S5tRYgawjXhhBm1eCjoWJSsA2K6volnp','[  {    "app_token" : "S5tRYgawjXhhBm1eCjoWJSsA2K6volnp",    "user_password" : "",    "app_uid" : "7939559",    "player_id" : "46C0640ABA667A03D8384E939104F248",    "nickname" : "游客",    "user_type" : 2  }]','2293248072-xm09x0ydtau'},
{'fBffKb6C1iByj2YxPFOtXM8JSxpDtHOd','[  {    "app_token" : "fBffKb6C1iByj2YxPFOtXM8JSxpDtHOd",    "user_password" : "",    "app_uid" : "7939633",    "player_id" : "85053728DB6F4BFE71724A10012FBBD6",    "nickname" : "游客",    "user_type" : 2  }]','3026703713-a12345678'},
{'gUMdJTsGfpszQpCh4xsXCHIBa87SRpFw','[  {    "app_token" : "gUMdJTsGfpszQpCh4xsXCHIBa87SRpFw",    "user_password" : "",    "app_uid" : "7939698",    "player_id" : "AD1D944F83BC06ECFCA449019283A767",    "nickname" : "游客",    "user_type" : 2  }]','852312024-tnhhv91755'},
{'veZrFxIyrrB9RgDmm5oBIY75iyLkpIv0','[  {    "app_token" : "veZrFxIyrrB9RgDmm5oBIY75iyLkpIv0",    "user_password" : "",    "app_uid" : "7939771",    "player_id" : "E9B1651C38BDEAEF34B1D5759430814C",    "nickname" : "游客",    "user_type" : 2  }]','766994870-ys20180724'},
{'oRxaayHLLMR0hU4L0JP1JBLBgbodqQRC','[  {    "app_token" : "oRxaayHLLMR0hU4L0JP1JBLBgbodqQRC",    "user_password" : "",    "app_uid" : "7939915",    "player_id" : "21166E70AC9502D00F4C63528A76A756",    "nickname" : "游客",    "user_type" : 2  }]','3072058304-ajue1110 '},
{'PksJf5aqmq6OeWfHqeubjtmN47FQte6x','[  {    "app_token" : "PksJf5aqmq6OeWfHqeubjtmN47FQte6x",    "user_password" : "",    "app_uid" : "7939974",    "player_id" : "28FD5B199DFA00FDA39B1C9E02B3C10C",    "nickname" : "游客",    "user_type" : 2  }]','1258007587-tnvlq42707'},
{'ibrFZanbtb52O6stTaNsOMp0FSfH8j9w','[  {    "app_token" : "ibrFZanbtb52O6stTaNsOMp0FSfH8j9w",    "user_password" : "",    "app_uid" : "7940041",    "player_id" : "2AFAB63644C60C7A1FFB59DDE0ECF223",    "nickname" : "游客",    "user_type" : 2  }]','1635972838-shabi002 '},
{'B1uFbYGW5bc7Uny1bn2LbEHIC5hebRlk','[  {    "app_token" : "B1uFbYGW5bc7Uny1bn2LbEHIC5hebRlk",    "user_password" : "",    "app_uid" : "7940173",    "player_id" : "AFD1ED9A10EE91B164AF96DCE10154A5",    "nickname" : "游客",    "user_type" : 2  }]','1216448521-zxegevsu1793'},
{'Jj1gmbboJFcornPK5wMCEPiZIul00kdM','[  {    "app_token" : "Jj1gmbboJFcornPK5wMCEPiZIul00kdM",    "user_password" : "",    "app_uid" : "7940293",    "player_id" : "04AE0DE9D1F626AFBEF3EA33B9C3A660",    "nickname" : "游客",    "user_type" : 2  }]','1794340897-yypi35661'},
{'DICuOodOUFNA5wTGdSnTQ7BDoKIbtbYo','[  {    "app_token" : "DICuOodOUFNA5wTGdSnTQ7BDoKIbtbYo",    "user_password" : "",    "app_uid" : "7940426",    "player_id" : "36EE264A052C3DBC46609AF75040B790",    "nickname" : "游客",    "user_type" : 2  }]','341827415-aikbu40992'},
{'SYhvOaGhdAG8WIVd04TJvp0D2EwnChcD','[  {    "app_token" : "SYhvOaGhdAG8WIVd04TJvp0D2EwnChcD",    "user_password" : "",    "app_uid" : "7940616",    "player_id" : "13AC736204012AB4EE1F4CC7E94BF0B9",    "nickname" : "游客",    "user_type" : 2  }]','3334647156-houle1234'},
{'ajrrH6bJIAVZE9LLZDIBk0wadTpEcehF','[  {    "app_token" : "ajrrH6bJIAVZE9LLZDIBk0wadTpEcehF",    "user_password" : "",    "app_uid" : "7940725",    "player_id" : "85ECF926F7CC9C74E84B9977ECC0C383",    "nickname" : "游客",    "user_type" : 2  }]','3380630156-wowx0707 '},
{'66SsmR2gh3XnlrAIXzjyjoe0YiD9GxEf','[  {    "app_token" : "66SsmR2gh3XnlrAIXzjyjoe0YiD9GxEf",    "user_password" : "",    "app_uid" : "7940815",    "player_id" : "8FEF9AC2F2B7B8B1B9A0443A74EB64E0",    "nickname" : "游客",    "user_type" : 2  }]','2787223798-uwox0142 '},
{'gwdW47MYamkhR8yQRS3qkTRqrfvQ0LpN','[  {    "app_token" : "gwdW47MYamkhR8yQRS3qkTRqrfvQ0LpN",    "user_password" : "",    "app_uid" : "7940884",    "player_id" : "16C34CD06E02AA3AB5B32DC7D9F67EDF",    "nickname" : "游客",    "user_type" : 2  }]','3125685884-hebc86914'},
{'LQA5q7CbZVN03kT2eX5eFjHwIruj6gnw','[  {    "app_token" : "LQA5q7CbZVN03kT2eX5eFjHwIruj6gnw",    "user_password" : "",    "app_uid" : "7940967",    "player_id" : "3EF28114F5DE10AD8D39CF7579556015",    "nickname" : "游客",    "user_type" : 2  }]','3450277029-poja7460 '},
{'tnSlIWC5AO9LpSPJpWq5j5L6G7o3ZVED','[  {    "app_token" : "tnSlIWC5AO9LpSPJpWq5j5L6G7o3ZVED",    "user_password" : "",    "app_uid" : "7941127",    "player_id" : "922A8DF6EC2092C53E27360176CDDD7A",    "nickname" : "游客",    "user_type" : 2  }]','2672682269-mdafo4449'},
{'GhKyeeKjfIMFBXZvlncjtzomQrqMJDgp','[  {    "app_token" : "GhKyeeKjfIMFBXZvlncjtzomQrqMJDgp",    "user_password" : "",    "app_uid" : "7941486",    "player_id" : "152049DF36CFEB8A6AE5CA839315A38C",    "nickname" : "游客",    "user_type" : 2  }]','478611683-aswoj45119'},
{'VxEF7375Vuyak6VWbvXRst39FEzzAPy9','[  {    "app_token" : "VxEF7375Vuyak6VWbvXRst39FEzzAPy9",    "user_password" : "",    "app_uid" : "7941534",    "player_id" : "FD6DAA5FB6248A3306A91BEB809F20FE",    "nickname" : "游客",    "user_type" : 2  }]','3304893008-oios26660'},
{'cN28e7nKpUdsOJGrKucIts3EwCo49mE3','[  {    "app_token" : "cN28e7nKpUdsOJGrKucIts3EwCo49mE3",    "user_password" : "",    "app_uid" : "7941604",    "player_id" : "CDEC89F8B560DEC21386B3F5B4592CD7",    "nickname" : "游客",    "user_type" : 2  }]','974108154-aeezb48332'},
{'ZHApyBGqlz38V9KYWDHMy4q5QJJLuQbO','[  {    "app_token" : "ZHApyBGqlz38V9KYWDHMy4q5QJJLuQbO",    "user_password" : "",    "app_uid" : "7941683",    "player_id" : "0CC4C28557506BCD0BF8B6F84A7186E4",    "nickname" : "游客",    "user_type" : 2  }]','467209391-ajfdb41395'},
{'HKUt4YD95Dx2jgYLBnXN5wh3q5aYpEJH','[  {    "app_token" : "HKUt4YD95Dx2jgYLBnXN5wh3q5aYpEJH",    "user_password" : "",    "app_uid" : "7941827",    "player_id" : "5D32B0E99FB634769B0AAA218CEB378C",    "nickname" : "游客",    "user_type" : 2  }]','1972105721-pwxm8119 '},
{'9KZwoqbkT6uiArkijRFl56ydQjK5g2B4','[  {    "app_token" : "9KZwoqbkT6uiArkijRFl56ydQjK5g2B4",    "user_password" : "",    "app_uid" : "7941939",    "player_id" : "CC4F8E65D8378A8268E6EC063BBA1880",    "nickname" : "游客",    "user_type" : 2  }]','461965286-aarqs44657'},
{'5Eqaug25PhYsielCrbKBbMgOCOU8oYuN','[  {    "app_token" : "5Eqaug25PhYsielCrbKBbMgOCOU8oYuN",    "user_password" : "",    "app_uid" : "7942040",    "player_id" : "1BF7BB8E9ACBAFD7946A28F7DE3F0D3A",    "nickname" : "游客",    "user_type" : 2  }]','3275249095-docp3116 '},
{'2ekN0NQNMundRtln2zgqZgnBE8tfgfrc','[  {    "app_token" : "2ekN0NQNMundRtln2zgqZgnBE8tfgfrc",    "user_password" : "",    "app_uid" : "7942100",    "player_id" : "6B090DC579B880868954F30B87C5D5BF",    "nickname" : "游客",    "user_type" : 2  }]','197948124-btjpb53531'},
{'RaMpv9Xv6gz0Rn6n9su7jida2QxZqPXb','[  {    "app_token" : "RaMpv9Xv6gz0Rn6n9su7jida2QxZqPXb",    "user_password" : "",    "app_uid" : "7942201",    "player_id" : "0E28BF9973D395EBD6D37506364C361F",    "nickname" : "游客",    "user_type" : 2  }]','663308031-avybg44073'},
{'lgivWH0m1BtBAWgrUIjIQ1hNzqa5MJjk','[  {    "app_token" : "lgivWH0m1BtBAWgrUIjIQ1hNzqa5MJjk",    "user_password" : "",    "app_uid" : "7942240",    "player_id" : "0DA92B61AA15A806E2603C64B95F8C1A",    "nickname" : "游客",    "user_type" : 2  }]','2947227315-pnld33377'},
{'ojAyUNwAKQdHLuH1tO6cvu4nRkjXHX4m','[  {    "app_token" : "ojAyUNwAKQdHLuH1tO6cvu4nRkjXHX4m",    "user_password" : "",    "app_uid" : "7942308",    "player_id" : "DEDC0A06317240098FD1BBFA6CEAB44C",    "nickname" : "游客",    "user_type" : 2  }]','971468583-yytot92624'},
{'VocT5RQU4KSum786wq8juu3JqsQC1Zk1','[  {    "app_token" : "VocT5RQU4KSum786wq8juu3JqsQC1Zk1",    "user_password" : "",    "app_uid" : "7942502",    "player_id" : "0369EC85B040B82CBC0BEC43824224A4",    "nickname" : "游客",    "user_type" : 2  }]','2481748558-ykmf3984 '},
{'9PuWXKE5Fzqbb7JhBerHtJRygOEH4tqZ','[  {    "app_token" : "9PuWXKE5Fzqbb7JhBerHtJRygOEH4tqZ",    "user_password" : "",    "app_uid" : "7942585",    "player_id" : "33030024432B5BDCEC8BFD9F2AE30249",    "nickname" : "游客",    "user_type" : 2  }]','822873797-yoyyq22660'},
{'YUWRqGKK9ASW6u3ZvgLghIXbAjJhAILY','[  {    "app_token" : "YUWRqGKK9ASW6u3ZvgLghIXbAjJhAILY",    "user_password" : "",    "app_uid" : "7942677",    "player_id" : "9AF4C2B2579E7A2E675DBFF485B3DE81",    "nickname" : "游客",    "user_type" : 2  }]','3379887832-wifyg4160'},
{'vk5CQT9yVZcSUG7fT4Kw0tHSBNi0DhYp','[  {    "app_token" : "vk5CQT9yVZcSUG7fT4Kw0tHSBNi0DhYp",    "user_password" : "",    "app_uid" : "7942739",    "player_id" : "975A55360AA88C7613E481A128269B50",    "nickname" : "游客",    "user_type" : 2  }]','3099134787-kpnr08415'},
{'uJ5cbAAqOEzj6I3aluylBX4CHW4ySmeh','[  {    "app_token" : "uJ5cbAAqOEzj6I3aluylBX4CHW4ySmeh",    "user_password" : "",    "app_uid" : "7942844",    "player_id" : "D414FBABAECF72DBF8AD66F8C7D5503A",    "nickname" : "游客",    "user_type" : 2  }]','478737515-aamxk48705'},
{'tDF6G6Vn8Z5AeN2Hdu2P9ogrG4VzXxcs','[  {    "app_token" : "tDF6G6Vn8Z5AeN2Hdu2P9ogrG4VzXxcs",    "user_password" : "",    "app_uid" : "7942877",    "player_id" : "1327EC66E7C4D0C1B65E35499BD2B7C6",    "nickname" : "游客",    "user_type" : 2  }]','3171854217-gbrp5594 '},
{'DESkhde78tIoDau7lrlFoORG96Smxm8t','[  {    "app_token" : "DESkhde78tIoDau7lrlFoORG96Smxm8t",    "user_password" : "",    "app_uid" : "7942955",    "player_id" : "AAB22A1AB73C6EEEEE92A5A794BA8DD9",    "nickname" : "游客",    "user_type" : 2  }]','3458172750-gezr8867 '},
{'l1phe5Ko8KoF1yrKGScp9GTT115RhWYE','[  {    "app_token" : "l1phe5Ko8KoF1yrKGScp9GTT115RhWYE",    "user_password" : "",    "app_uid" : "7943000",    "player_id" : "866FF13235A10AF3DFC68BC51EECD9E3",    "nickname" : "游客",    "user_type" : 2  }]','3419702809-jswghy19 '},
{'dggtvRQLkLOXHLLPjPwRq8mot5tu4Xq0','[  {    "app_token" : "dggtvRQLkLOXHLLPjPwRq8mot5tu4Xq0",    "user_password" : "",    "app_uid" : "7943111",    "player_id" : "475CB64D9E41B8709445077096840BEF",    "nickname" : "游客",    "user_type" : 2  }]','341942203-adtsm40544'},
{'Hzi7u0ttCcHX1CwPc766t5gSVM31RXWn','[  {    "app_token" : "Hzi7u0ttCcHX1CwPc766t5gSVM31RXWn",    "user_password" : "",    "app_uid" : "7943150",    "player_id" : "BD9BFFAE5E9672A840DC7E7DFAF7E647",    "nickname" : "游客",    "user_type" : 2  }]','3485481404-fteb0175 '},
{'jvJxvYS79i85GfJhG2aks6dsplKUszdx','[  {    "app_token" : "jvJxvYS79i85GfJhG2aks6dsplKUszdx",    "user_password" : "",    "app_uid" : "7943221",    "player_id" : "AFAA6CC7A612167C5997FFFC4C099F2F",    "nickname" : "游客",    "user_type" : 2  }]','1487340698-houle1234'},
{'tgOanYhZ53hohkt4a6nQzLpyabAgfDOQ','[  {    "app_token" : "tgOanYhZ53hohkt4a6nQzLpyabAgfDOQ",    "user_password" : "",    "app_uid" : "7943325",    "player_id" : "07445531993C0046964E177877CBBD51",    "nickname" : "游客",    "user_type" : 2  }]','183557080-afisb40340'},
{'J2AOdrA6qmpYwlGDTMxZlXRLQn0bY1Kj','[  {    "app_token" : "J2AOdrA6qmpYwlGDTMxZlXRLQn0bY1Kj",    "user_password" : "",    "app_uid" : "7943526",    "player_id" : "43C6B89DA667C9547980A6227276AE37",    "nickname" : "游客",    "user_type" : 2  }]','2992534287-vlbb96403'},
{'4eP1Yv4KqOiOb3Hp33O5qzkPJpEz1cWU','[  {    "app_token" : "4eP1Yv4KqOiOb3Hp33O5qzkPJpEz1cWU",    "user_password" : "",    "app_uid" : "7943568",    "player_id" : "D4A41441C281C04D77DA0C6AB0CB82E3",    "nickname" : "游客",    "user_type" : 2  }]','3179775481-a1234567 '},
{'QFLn7MKl974XoWKeFEKgt7we5WYHN3Ul','[  {    "app_token" : "QFLn7MKl974XoWKeFEKgt7we5WYHN3Ul",    "user_password" : "",    "app_uid" : "7943592",    "player_id" : "C7CB3570D5286D865B0F900BA11EB8A1",    "nickname" : "游客",    "user_type" : 2  }]','3504727695-nxnx1156 '},
{'3hH8oO2WEMhVRoe6WeHq3LSiogzsgeP2','[  {    "app_token" : "3hH8oO2WEMhVRoe6WeHq3LSiogzsgeP2",    "user_password" : "",    "app_uid" : "7943649",    "player_id" : "59183BBD696C39817059B5A219C05D49",    "nickname" : "游客",    "user_type" : 2  }]','2280571487-nedes41246'},
{'aQWUKTwtfN0a90f65U4noJuMhNkgNfSQ','[  {    "app_token" : "aQWUKTwtfN0a90f65U4noJuMhNkgNfSQ",    "user_password" : "",    "app_uid" : "7943682",    "player_id" : "BDF633D813A386CF38F589E4083F0CEB",    "nickname" : "游客",    "user_type" : 2  }]','2974808233-krgg38918'},
{'tsGY9UN0ufeVblnBfmr42p1C0DuuqFr7','[  {    "app_token" : "tsGY9UN0ufeVblnBfmr42p1C0DuuqFr7",    "user_password" : "",    "app_uid" : "7943753",    "player_id" : "D6F97D83F9CE139FE59EBF2862AF2D76",    "nickname" : "游客",    "user_type" : 2  }]','3165537861-fhln13331'},
{'gs67CJ4BZpZACaonHGHqyvBvA2y0wFOY','[  {    "app_token" : "gs67CJ4BZpZACaonHGHqyvBvA2y0wFOY",    "user_password" : "",    "app_uid" : "7943812",    "player_id" : "EBFF5726B160218AE954AF4B56A46B2F",    "nickname" : "游客",    "user_type" : 2  }]','2034771249-brh83634 '},
{'JRXCjJ6BFaWZHQuzVQZb8D2VDR5oVT7o','[  {    "app_token" : "JRXCjJ6BFaWZHQuzVQZb8D2VDR5oVT7o",    "user_password" : "",    "app_uid" : "7943927",    "player_id" : "B355CECAB005220DDEA6C4730D3E05B9",    "nickname" : "游客",    "user_type" : 2  }]','1523588453-vgka8677 '},
{'R7KAL08XS3qLxO6kKqYPDokt4rhKVVQH','[  {    "app_token" : "R7KAL08XS3qLxO6kKqYPDokt4rhKVVQH",    "user_password" : "",    "app_uid" : "7943985",    "player_id" : "11DA6FFD78498E4D0EA9EB5CAD5DE255",    "nickname" : "游客",    "user_type" : 2  }]','3083428670-jgkq4140 '},
{'boyTxy9kUnR3OXdAnGzcMwdv0ANS183o','[  {    "app_token" : "boyTxy9kUnR3OXdAnGzcMwdv0ANS183o",    "user_password" : "",    "app_uid" : "7944013",    "player_id" : "9C4A6787CA7AE981546E82EF01FB51B4",    "nickname" : "游客",    "user_type" : 2  }]','208730770-amhfk45379'},
{'ojSfGWmehWmeW6Zei6SqoZtKDXatG8nM','[  {    "app_token" : "ojSfGWmehWmeW6Zei6SqoZtKDXatG8nM",    "user_password" : "",    "app_uid" : "7944050",    "player_id" : "3ACBB5717DE93D257B6DFBB0B0F6C7FA",    "nickname" : "游客",    "user_type" : 2  }]','1795732152-hdzr29335'},
{'SXT5kUsx4YruxjjnPOBQj2oystOGXbUl','[  {    "app_token" : "SXT5kUsx4YruxjjnPOBQj2oystOGXbUl",    "user_password" : "",    "app_uid" : "7944206",    "player_id" : "1B1808D809495AF3E0999B745A1A617F",    "nickname" : "游客",    "user_type" : 2  }]','3139307004-zp11665o3jw'},
{'4ImACHbhHqfBOoEivJKQ5rPUGRHcgnPj','[  {    "app_token" : "4ImACHbhHqfBOoEivJKQ5rPUGRHcgnPj",    "user_password" : "",    "app_uid" : "7944250",    "player_id" : "A1E1D10D6EAD5107C15A7F67554922DF",    "nickname" : "游客",    "user_type" : 2  }]','242332050-zjbhp73313'},
{'7IeuuFVPhJWUWucM5pj2ru65E2EcXIYL','[  {    "app_token" : "7IeuuFVPhJWUWucM5pj2ru65E2EcXIYL",    "user_password" : "",    "app_uid" : "7944301",    "player_id" : "8EDAC67C08A4F32E92CE15AC451A7370",    "nickname" : "游客",    "user_type" : 2  }]','2961831335-tazp8605 '},
{'X28VW6DIsafnt4Xq3wAJRhroe9kqw9U1','[  {    "app_token" : "X28VW6DIsafnt4Xq3wAJRhroe9kqw9U1",    "user_password" : "",    "app_uid" : "7944342",    "player_id" : "4072F0F362DEBE431869AF77F200EFB3",    "nickname" : "游客",    "user_type" : 2  }]','2868653072-hugz3301 '},
{'hEQqQa3lV3TJVdKarn9nlXUQ9LohNLH8','[  {    "app_token" : "hEQqQa3lV3TJVdKarn9nlXUQ9LohNLH8",    "user_password" : "",    "app_uid" : "7944398",    "player_id" : "116B53AFF9AA5A28BC1206348EA95C29",    "nickname" : "游客",    "user_type" : 2  }]','550751502-aduiz47857'},
{'4EPbibgI1ESbnrlCTvGmsmlTp66Zlzdi','[  {    "app_token" : "4EPbibgI1ESbnrlCTvGmsmlTp66Zlzdi",    "user_password" : "",    "app_uid" : "7944496",    "player_id" : "D69CF7960F540B283C07151C48216277",    "nickname" : "游客",    "user_type" : 2  }]','2377270046-ubrg0863 '},
{'6zdTdgQhDXV7f5A3MYxmJQcSvBLIVPni','[  {    "app_token" : "6zdTdgQhDXV7f5A3MYxmJQcSvBLIVPni",    "user_password" : "",    "app_uid" : "7944517",    "player_id" : "A9E96788059AB05EE54C18DA1F603D35",    "nickname" : "游客",    "user_type" : 2  }]','3457201941-hkei5628 '},
{'dIol3hTeRnydKUG4MrxJbjeR2uBRNH6c','[  {    "app_token" : "dIol3hTeRnydKUG4MrxJbjeR2uBRNH6c",    "user_password" : "",    "app_uid" : "7944539",    "player_id" : "F56E6FAF87DFFE645A9C394BEAF977C2",    "nickname" : "游客",    "user_type" : 2  }]','435107535-aenjv43454'},
{'LP0IduVN2UKY47LPouAIWQ46wN1L7eg9','[  {    "app_token" : "LP0IduVN2UKY47LPouAIWQ46wN1L7eg9",    "user_password" : "",    "app_uid" : "7944557",    "player_id" : "C6AAEFF50E6A7D6BD74A99152C7BAEB1",    "nickname" : "游客",    "user_type" : 2  }]','1296496133-qv79h7s2m21'},
{'PAz4lNH8WXQqLOiNP6AYxJmhijV80A9a','[  {    "app_token" : "PAz4lNH8WXQqLOiNP6AYxJmhijV80A9a",    "user_password" : "",    "app_uid" : "7944574",    "player_id" : "A8A39431E3DC1AE8BAB1085E209BAC42",    "nickname" : "游客",    "user_type" : 2  }]','3025902214-gbpf1699 '},
{'oqFy5k5nScU5FGZhk6aG6JagxKKrs4Sp','[  {    "app_token" : "oqFy5k5nScU5FGZhk6aG6JagxKKrs4Sp",    "user_password" : "",    "app_uid" : "7944622",    "player_id" : "FB70C44E4BA8B8E0EEF0C2FDCA1FF8CD",    "nickname" : "游客",    "user_type" : 2  }]','3331747503-cjrn6263 '},
{'E3E9z92PNrBOiVmjB6dbs1gmaR3p8jJs','[  {    "app_token" : "E3E9z92PNrBOiVmjB6dbs1gmaR3p8jJs",    "user_password" : "",    "app_uid" : "7944697",    "player_id" : "C7E0EC796917157B4722592AF72B36F5",    "nickname" : "游客",    "user_type" : 2  }]','2980473636-ebop20474'},
{'Ec0xHlr3W8fqWpNBiof2nHLXTzSICwy4','[  {    "app_token" : "Ec0xHlr3W8fqWpNBiof2nHLXTzSICwy4",    "user_password" : "",    "app_uid" : "7944752",    "player_id" : "ACA2225F00AD74962BBC81833C0E6730",    "nickname" : "游客",    "user_type" : 2  }]','2919361971-rqlr2231 '},
{'S9B3qyuHjZ6QOnOnsgWo0MKWUkgSJ0Xe','[  {    "app_token" : "S9B3qyuHjZ6QOnOnsgWo0MKWUkgSJ0Xe",    "user_password" : "",    "app_uid" : "7944766",    "player_id" : "9A27EA0D818B28B7D0A7F94383BEAD47",    "nickname" : "游客",    "user_type" : 2  }]','3136509087-sqpd3059 '},
{'z33zENKVjGg3TYL6g3dAgzbXJf3eGrYG','[  {    "app_token" : "z33zENKVjGg3TYL6g3dAgzbXJf3eGrYG",    "user_password" : "",    "app_uid" : "7944790",    "player_id" : "065C3199EB9BC5CC792134D1A63FD313",    "nickname" : "游客",    "user_type" : 2  }]','430692213-amtsf44516'},
{'PW406HBIvUy4rWjd01c5E3kJeVPvZvWw','[  {    "app_token" : "PW406HBIvUy4rWjd01c5E3kJeVPvZvWw",    "user_password" : "",    "app_uid" : "7944811",    "player_id" : "397DE85857F881E287F6895D37965675",    "nickname" : "游客",    "user_type" : 2  }]','457290047-adyfb46027'},
{'HdaUcH7FnXX8tKlZIZCNyR0UBdG7tdQl','[  {    "app_token" : "HdaUcH7FnXX8tKlZIZCNyR0UBdG7tdQl",    "user_password" : "",    "app_uid" : "7944829",    "player_id" : "C98AE6751F889C61A2D23016767E27D9",    "nickname" : "游客",    "user_type" : 2  }]','2849225021-puop1775 '},
{'BEaTgIgA6Jk70DiFlcmLUg95yc65G2O3','[  {    "app_token" : "BEaTgIgA6Jk70DiFlcmLUg95yc65G2O3",    "user_password" : "",    "app_uid" : "7944857",    "player_id" : "12649F6A9E879FC533B7639841C36FDC",    "nickname" : "游客",    "user_type" : 2  }]','3595849615-gujld8053'},
{'ZwC3wuNFUlxQp6IBJinSbDY3GPUID9eT','[  {    "app_token" : "ZwC3wuNFUlxQp6IBJinSbDY3GPUID9eT",    "user_password" : "",    "app_uid" : "7944903",    "player_id" : "5F8A20DE0BF425DC5D47553AB2A0A7BD",    "nickname" : "游客",    "user_type" : 2  }]','1700929477-qnxu6537 '},
{'hlpkI0eBOvUdwMCRN1HCtZc2b0YM9Ayc','[  {    "app_token" : "hlpkI0eBOvUdwMCRN1HCtZc2b0YM9Ayc",    "user_password" : "",    "app_uid" : "7944945",    "player_id" : "DF6BC364D7851293553914D127F7CE34",    "nickname" : "游客",    "user_type" : 2  }]','2269498153-Qioejlmky852487'},
{'ninXKIwsAwp0yIlYPoeDlKicEJXLzwz9','[  {    "app_token" : "ninXKIwsAwp0yIlYPoeDlKicEJXLzwz9",    "user_password" : "",    "app_uid" : "7944981",    "player_id" : "7E0459760099EC0A3DCBB0727C52368C",    "nickname" : "游客",    "user_type" : 2  }]','3336792569-ybzo85870'},
{'d3NsGy4MVzpT5F7h8pe7vk2kTJew7IDQ','[  {    "app_token" : "d3NsGy4MVzpT5F7h8pe7vk2kTJew7IDQ",    "user_password" : "",    "app_uid" : "7944996",    "player_id" : "BCA3A221E5462C7822B1EAC3324F7E60",    "nickname" : "游客",    "user_type" : 2  }]','439678087-agswb42939'},
{'FDmLZMDwqpQ1xwtlKGOTiUYqshm7N5PR','[  {    "app_token" : "FDmLZMDwqpQ1xwtlKGOTiUYqshm7N5PR",    "user_password" : "",    "app_uid" : "7945040",    "player_id" : "4A98D9B08420727CC97BD8DC471CF117",    "nickname" : "游客",    "user_type" : 2  }]','1689289748-pe660czmdlc'},
{'5YppmQD5ejYQMzsosSEhQ005pPPFkMj1','[  {    "app_token" : "5YppmQD5ejYQMzsosSEhQ005pPPFkMj1",    "user_password" : "",    "app_uid" : "7945071",    "player_id" : "6209E071B01B6DC4A4B6A0083FC8B9DD",    "nickname" : "游客",    "user_type" : 2  }]','1938803340-si084ygzrt5'},
{'Bc0mGs8zmnm2ShrCJj3vfUMEoda8Mgsd','[  {    "app_token" : "Bc0mGs8zmnm2ShrCJj3vfUMEoda8Mgsd",    "user_password" : "",    "app_uid" : "7945115",    "player_id" : "1CE151AA54DC2AFE38090D8D199B915A",    "nickname" : "游客",    "user_type" : 2  }]','610124268-ys20180724'},
{'87ZdnNSsOoA507C49YYP7fUjFS5SU7du','[  {    "app_token" : "87ZdnNSsOoA507C49YYP7fUjFS5SU7du",    "user_password" : "",    "app_uid" : "7945156",    "player_id" : "C845F0F00BBD57E86F187A753A26C313",    "nickname" : "游客",    "user_type" : 2  }]','721261059-apyqe48808'},
{'Lhf0emtWhend6DHatABiNdKbuyVwUcac','[  {    "app_token" : "Lhf0emtWhend6DHatABiNdKbuyVwUcac",    "user_password" : "",    "app_uid" : "7945178",    "player_id" : "6D34974CB26314846BFA23A5ADDB77E6",    "nickname" : "游客",    "user_type" : 2  }]','939669650-gigyw42444'},
{'Osi9jJU6mPLcR81S8rXO13kf03sfCKb0','[  {    "app_token" : "Osi9jJU6mPLcR81S8rXO13kf03sfCKb0",    "user_password" : "",    "app_uid" : "7945209",    "player_id" : "11CB0AC383224B39E96634FFEFBC9CCE",    "nickname" : "游客",    "user_type" : 2  }]','351705323-aouho41929'},
{'BLtPYAIoQ6f3kB87CdnPCh3yRwCokEDS','[  {    "app_token" : "BLtPYAIoQ6f3kB87CdnPCh3yRwCokEDS",    "user_password" : "",    "app_uid" : "7945254",    "player_id" : "4369B071FCDFCB51E6F6688F047CE4F0",    "nickname" : "游客",    "user_type" : 2  }]','1448932692-mk09sv9xm99'},
{'XE26vuXKCkXHvDKgamXhOWWoDuiXAat0','[  {    "app_token" : "XE26vuXKCkXHvDKgamXhOWWoDuiXAat0",    "user_password" : "",    "app_uid" : "7945280",    "player_id" : "41C479524DBD27631C4F3BD262FED135",    "nickname" : "游客",    "user_type" : 2  }]','2730590742-knvwp4930'},
{'YVsJ1JCCAtwdhR2g6xQ1BpwbvNfEiAvJ','[  {    "app_token" : "YVsJ1JCCAtwdhR2g6xQ1BpwbvNfEiAvJ",    "user_password" : "",    "app_uid" : "7945294",    "player_id" : "35F7B3A829BD1B926CD2365712A2C004",    "nickname" : "游客",    "user_type" : 2  }]','768643971-ys20180724'},
{'Rwmc9EopcG8cnYuIWjBB1fuUxWIVJlnJ','[  {    "app_token" : "Rwmc9EopcG8cnYuIWjBB1fuUxWIVJlnJ",    "user_password" : "",    "app_uid" : "7945305",    "player_id" : "A5225A3DA0B80A5852ED751824CDA51F",    "nickname" : "游客",    "user_type" : 2  }]','2920334863-slyq3792 '},
{'7TS7AlIxZDHmIpKuOfJtM8ZDgeNgqURP','[  {    "app_token" : "7TS7AlIxZDHmIpKuOfJtM8ZDgeNgqURP",    "user_password" : "",    "app_uid" : "7945352",    "player_id" : "6E32AC7E768DDA89F36978534680EB82",    "nickname" : "游客",    "user_type" : 2  }]','3370673287-suub7311 '},
{'WnXlaAsfUMUsHfFAEwdmu4zqA4QQCd1B','[  {    "app_token" : "WnXlaAsfUMUsHfFAEwdmu4zqA4QQCd1B",    "user_password" : "",    "app_uid" : "7945373",    "player_id" : "EF628B7585B4E68769A8AF437F959738",    "nickname" : "游客",    "user_type" : 2  }]','2903621148-cmwg66666'},
{'yGLyVWBI0qWVMeYiZZcQNApf1uCVevIi','[  {    "app_token" : "yGLyVWBI0qWVMeYiZZcQNApf1uCVevIi",    "user_password" : "",    "app_uid" : "7945392",    "player_id" : "EB1A6335C32718FAA952DAC8BFD9B2A3",    "nickname" : "游客",    "user_type" : 2  }]','3307690646-jaad84157'},
{'F9tRjOXiV8yYDdDToGKR3xt14X0NYNzk','[  {    "app_token" : "F9tRjOXiV8yYDdDToGKR3xt14X0NYNzk",    "user_password" : "",    "app_uid" : "7945400",    "player_id" : "0AA9356DD82E235BE8AA4A8F17707BF5",    "nickname" : "游客",    "user_type" : 2  }]','674566631-fnjuj91557'},
{'rIA5Us3vwdA4LY486iYjfDLBxTtz7MH1','[  {    "app_token" : "rIA5Us3vwdA4LY486iYjfDLBxTtz7MH1",    "user_password" : "",    "app_uid" : "7945423",    "player_id" : "920CC082C434D2FF0D6C182BF7953663",    "nickname" : "游客",    "user_type" : 2  }]','3104267852-pdzb6427 '},

}

    
-- for k,v in ipairs( a )do
--     log(v)
--     update_token(v[1],v[2],v[3])
-- end

    init(1)

t={}
            t['英雄管理-天赋升级-升级']={0x1274ba, "0|0|0x1274ba,-57|-20|0x04d0fd,62|23|0x00abe8",90,109,115,934,745}
            t['英雄管理-天赋升级-强制升级']={0x980e0e, "0|0|0x980e0e,13|-1|0xdd3c33,148|1|0x00bcfb",90,65,102,879,703}
            
t['天赋-通用']={0xfefcf6, "0|0|0xfefcf6,13|0|0xfefdfb,0|12|0xfffffe,14|12|0xfdfbf6,6|17|0xdba400",90,406,374,498,467}
                        t['天赋-打野']={0xfdfbf7, "0|0|0xfdfbf7,-4|8|0xcf9700,-8|3|0xfefdfb,-12|11|0xfefdfa,-3|25|0x985e0b",90,423,374,495,461}
                        t['天赋-采集']={0xffffff, "0|0|0xffffff,-1|5|0xd7a000,5|-1|0xc78e00,10|10|0xfdfbf5,2|22|0x985e0b",90,413,352,504,475}
                        
                        local threeA = {'天赋-通用','天赋-打野','天赋-采集'}
                        local threeAs ={}
                        threeAs[1]={{416, 440, 0xfffff8},{408, 519, 0xfffff9},{404, 575, 0xfbf9ef},{359, 548, 0xfbf3d8},{281, 554, 0xfcf7eb},{267, 658, 0xfaefd8},{344, 408, 0x999888},{290, 383, 0x929292},{291, 439, 0x525252}}
                        threeAs[2]={{415, 440, 0x99987b},{352, 424, 0x565656},{391, 612, 0x969696},{342, 519, 0x949494},{309, 465, 0x6d6d6d},{260, 577, 0x818181},{225, 503, 0x717171},{189, 569, 0x676767}}
                        threeAs[3]={{304, 375, 0x787878},{329, 449, 0x979797},{365, 510, 0x969696},{158, 460, 0x949494},{158, 460, 0x949494},{158, 460, 0x949494},{413, 573, 0x6c6c6c},{315, 574, 0x7c7c7c}}
                        
                        for k,v in ipairs(threeA) do
                            if d( v )then
                                log(v..'->准备加点')
                                for k__,v__ in ipairs(threeAs[k])do
                                    log(v__)
                                    click(v__[1],v__[2],2)
                                    d('英雄管理-天赋升级-升级',true)
                                    d('英雄管理-天赋升级-强制升级',true)
                                end
                                d('酒馆-返回按钮',true,1,2)
                                break
                            end
                        end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
