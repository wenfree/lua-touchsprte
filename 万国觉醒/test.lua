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
{'MhP8mAXN0tyK9sGKJn6M1DUcU7nwDw07',   '[  {    "app_token" : "MhP8mAXN0tyK9sGKJn6M1DUcU7nwDw07",    "user_password" : "",    "app_uid" : "8357211",    "player_id" : "CE5347058D392DA18708BBE074371E3F",    "third_party_token" : "283EDB7672F67128C5CC5E2DFA1CD6F1",    "user_type" : 7  },  {    "app_token" : "5jDu7oySjFmwRiGt43LHVvC1jiNCzDNk",    "user_password" : "",    "app_uid" : "8358455",    "player_id" : "100F52B9-81F7-4D25-AB5B-A6DE05439F13",    "nickname" : "游客",    "user_type" : 1  }]',   '327704506-ahecd10466'},
{'4RSqLUAbWrkWiuaFhyHq0UXqosni6Xoe',   '[  {    "app_token" : "4RSqLUAbWrkWiuaFhyHq0UXqosni6Xoe",    "user_password" : "",    "app_uid" : "8357295",    "player_id" : "EC1175F6DEED7C959C5E099D88F85D58",    "third_party_token" : "38A097276D0CBC9F03D0A4DB497C380B",    "user_type" : 7  },  {    "app_token" : "kOxRX2m8ib4DkphzZWcxWydAmSkXouBC",    "user_password" : "",    "app_uid" : "8358538",    "player_id" : "AB0B3C0D-338F-406C-951D-F9F8A29CD293",    "nickname" : "游客",    "user_type" : 1  }]',   '2060906913-luo16493kai'},
{'tKGte8ViEDDjjgT08PIsKoexRQAeRjdX',   '[  {    "app_token" : "tKGte8ViEDDjjgT08PIsKoexRQAeRjdX",    "user_password" : "",    "app_uid" : "8357380",    "player_id" : "7ADAC8A87151614E81EFCA4FB1CC7469",    "third_party_token" : "EACC834C34E018089B653D4F201BCE8B",    "user_type" : 7  },  {    "app_token" : "bX70afGU8Fedvl6gXYfzFTBN0R07YVO1",    "user_password" : "",    "app_uid" : "8358621",    "player_id" : "CCBB7B7C-607C-472D-BE78-A1C57A43F054",    "nickname" : "游客",    "user_type" : 1  }]',   '2793762912-wdlwrg3205'},
{'4RvQvok4i4jIquHQLrzBWIf577m3pKDe',   '[  {    "app_token" : "4RvQvok4i4jIquHQLrzBWIf577m3pKDe",    "user_password" : "",    "app_uid" : "8357931",    "player_id" : "91886783D419F340301470BE25DC4642",    "third_party_token" : "4E68997813960CC085C6D5C6C07AD1D2",    "user_type" : 7  },  {    "app_token" : "yKoyms9bU2IRk1gfv0cIzfTZdaR9d8XP",    "user_password" : "",    "app_uid" : "8358835",    "player_id" : "1CE2C197-47B1-4946-A015-FDEB0B6AA324",    "nickname" : "游客",    "user_type" : 1  }]',   '3127004139-y4269361'},
{'zufSzKL4tNj1m1ER6n2bbuXLaRSw36DP',   '[  {    "app_token" : "zufSzKL4tNj1m1ER6n2bbuXLaRSw36DP",    "user_password" : "",    "app_uid" : "8358081",    "player_id" : "E5F92810DE872518F18C2360227A68EE",    "third_party_token" : "1E946FB7E7DACBFB38DF142625DA57FB",    "user_type" : 7  },  {    "app_token" : "MtCXvarm3XfLN57z2OerhWg6ogYrgm9w",    "user_password" : "",    "app_uid" : "8358947",    "player_id" : "20C65638-51D3-426D-A45F-9D0D3E5DD927",    "nickname" : "游客",    "user_type" : 1  }]',   '3534865833-o8pljw98'},
{'OBuFDndquffxsZOkK6IfdVqH2vg52ci9',   '[  {    "app_token" : "OBuFDndquffxsZOkK6IfdVqH2vg52ci9",    "user_password" : "",    "app_uid" : "8358164",    "player_id" : "3D4E3311FCD0810968FCAB292C0842AA",    "third_party_token" : "6B5C3991BF4381D74B7F7739E7CF0CE4",    "user_type" : 7  },  {    "app_token" : "5hZrcwZ2zgadUO7MtgbVqvEOYP2cACGQ",    "user_password" : "",    "app_uid" : "8359015",    "player_id" : "80B3D578-ACCE-45BE-A307-AAB290D91693",    "nickname" : "游客",    "user_type" : 1  }]',   '2561403867-ssss1111'},
{'fzkuQY2L6eFiNuoL66zsx2hi5gWOEgqY',   '[  {    "app_token" : "fzkuQY2L6eFiNuoL66zsx2hi5gWOEgqY",    "user_password" : "",    "app_uid" : "8358303",    "player_id" : "B0D160B833A0180454D41D0B149ECA4E",    "third_party_token" : "0477B79DC43D3E88839E0685F3A02AE2",    "user_type" : 7  },  {    "app_token" : "IrqL1L1KuZaCdItX9Drdt19qVwXuaX0H",    "user_password" : "",    "app_uid" : "8359550",    "player_id" : "E5302E0D-6EE8-4C07-A88E-EEEAB50DF6B7",    "nickname" : "游客",    "user_type" : 1  }]',   '2584170019-cEbE97211'},
{'cUqbzT6EAVH5EqAftAQQqFRBfpe9IDOf',   '[  {    "app_token" : "cUqbzT6EAVH5EqAftAQQqFRBfpe9IDOf",    "user_password" : "",    "app_uid" : "8358681",    "player_id" : "E5A4CFA3FE9C20FA650402C2305D67B6",    "nickname" : "游客",    "user_type" : 2  }]',   '2879604553-tfllvn173'},
{'bVcKvHfIkPi7bB6btiYGJ0za3KakYZHD',   '[  {    "app_token" : "bVcKvHfIkPi7bB6btiYGJ0za3KakYZHD",    "user_password" : "",    "app_uid" : "8358876",    "player_id" : "051F4566E9534E844185240D623F2DE2",    "nickname" : "游客",    "user_type" : 2  }]',   '3306257706-kekq4750'},
{'SKuIOwxzxEyi4okGHNeQIgXA4OFwvQeK',   '[  {    "app_token" : "SKuIOwxzxEyi4okGHNeQIgXA4OFwvQeK",    "user_password" : "",    "app_uid" : "8359074",    "player_id" : "66D6334A42629416758175B584E097AF",    "nickname" : "游客",    "user_type" : 2  }]',   '1638067075-qq121212'},
{'Ay67QVB63NyX8TX7t3q4wQz1SenoRfsb',   '[  {    "app_token" : "Ay67QVB63NyX8TX7t3q4wQz1SenoRfsb",    "user_password" : "",    "app_uid" : "8359620",    "player_id" : "EC55EDD5D9E743CC4EEB43164FB276EB",    "nickname" : "游客",    "user_type" : 2  }]',   '1438192843-ragqe9823'},
{'1ISHSXbGvLLLtZug0K15UMN4f80D6BqH',   '[  {    "app_token" : "1ISHSXbGvLLLtZug0K15UMN4f80D6BqH",    "user_password" : "",    "app_uid" : "8359816",    "player_id" : "B296093905924D3CF84E24080DF93664",    "nickname" : "游客",    "user_type" : 2  }]',   '3498647429-qwe.005511'},
{'JgFadVbEzjvCQvotnYMrwFvyrM4VKQjf',   '[  {    "app_token" : "JgFadVbEzjvCQvotnYMrwFvyrM4VKQjf",    "user_password" : "",    "app_uid" : "8359964",    "player_id" : "F5008AD87F0EA2571819D1B6711C5068",    "nickname" : "游客",    "user_type" : 2  }]',   '2189150043-njhhu3730'},
{'3hnaN6CZv0tjushajAST289z0lGHRdCJ',   '[  {    "app_token" : "3hnaN6CZv0tjushajAST289z0lGHRdCJ",    "user_password" : "",    "app_uid" : "8360041",    "player_id" : "509B84831972AFE7654E9322227A9F2F",    "nickname" : "游客",    "user_type" : 2  }]',   '2455976136-asd.111'},
{'JIgVk656H6tQH40fpmGJqa5cxZLPHrXG',   '[  {    "app_token" : "JIgVk656H6tQH40fpmGJqa5cxZLPHrXG",    "user_password" : "",    "app_uid" : "8360129",    "player_id" : "143DF5930A57B2B6DFC87D5935ED8C11",    "nickname" : "游客",    "user_type" : 2  }]',   '2046242360-btjzs6218'},
{'bplSzCFkTTzYfO66jpTeRy9bBYAY9TgC',   '[  {    "app_token" : "bplSzCFkTTzYfO66jpTeRy9bBYAY9TgC",    "user_password" : "",    "app_uid" : "8360488",    "player_id" : "B6221D6A2C2D9378D6454109641C103F",    "nickname" : "游客",    "user_type" : 2  }]',   '2374126863-qqww.0001'},
{'lIktjTXVbXlOOsfikB1OxCbNI9fMkfWR',   '[  {    "app_token" : "lIktjTXVbXlOOsfikB1OxCbNI9fMkfWR",    "user_password" : "",    "app_uid" : "8360581",    "player_id" : "7389C11558CD6BBAA02BA9B216392689",    "third_party_token" : "07A071F5EE545CDDDAB408F66F96CA5F",    "user_type" : 7  },  {    "app_token" : "w6NRVedTGeqYm7wFTd44gshrWGfZ0Tcv",    "user_password" : "",    "app_uid" : "8360704",    "player_id" : "AF37DC9C-8B68-4FC2-B636-FBA64CA50DDD",    "nickname" : "游客",    "user_type" : 1  }]',   '2396721705-wf516160'},
{'dKKSkn4OKM9yeyqFtgvUqvRU0YLFSCwD',   '[  {    "app_token" : "dKKSkn4OKM9yeyqFtgvUqvRU0YLFSCwD",    "user_password" : "",    "app_uid" : "8360824",    "player_id" : "1372335183ABB072E46D22D443E6331A",    "nickname" : "游客",    "user_type" : 2  }]',   '3075187285-rcdibs9215'},
{'kUsTnZBOmyjTRgHgBHuoJpk138PBEDn2',   '[  {    "app_token" : "kUsTnZBOmyjTRgHgBHuoJpk138PBEDn2",    "user_password" : "",    "app_uid" : "8360985",    "player_id" : "9E103E968EDD7881816C8ECD33530254",    "nickname" : "游客",    "user_type" : 2  }]',   '2531636989-luo16493kai'},
{'qPRDxNfMOuJA7mHHam2PezxWIPJBtT6Y',   '[  {    "app_token" : "qPRDxNfMOuJA7mHHam2PezxWIPJBtT6Y",    "user_password" : "",    "app_uid" : "8361244",    "player_id" : "BEFAEF652C100F84D295384EE53D4ECC",    "nickname" : "游客",    "user_type" : 2  }]',   '1444757111-yy888999'},
{'ggxj1NNzRdArUgvIFPnoQE7hyyjwkOIw',   '[  {    "app_token" : "ggxj1NNzRdArUgvIFPnoQE7hyyjwkOIw",    "user_password" : "",    "app_uid" : "8361692",    "player_id" : "60D709555862A084DE28E64513E5B187",    "nickname" : "游客",    "user_type" : 2  }]',   '3448595801-nd592931'},
{'D2d25DWhluuZp1cyJmSHQzDobOP73tII',   '[  {    "app_token" : "D2d25DWhluuZp1cyJmSHQzDobOP73tII",    "user_password" : "",    "app_uid" : "8361755",    "player_id" : "0A7A19DCE6AAA7661036EBA56C269009",    "nickname" : "游客",    "user_type" : 2  }]',   '1742914148-a123123a..'},
{'WDLagcFN4OWjXhwWfW6fAC39nZxXS9rE',   '[  {    "app_token" : "WDLagcFN4OWjXhwWfW6fAC39nZxXS9rE",    "user_password" : "",    "app_uid" : "8361939",    "player_id" : "D3822BDEF082F35ED901B621E2F22794",    "nickname" : "游客",    "user_type" : 2  }]',   '3570891294-kpqpg447'},
{'4tEK4mOXVn0AagmxGeH3BJYrhCojgMeR',   '[  {    "app_token" : "4tEK4mOXVn0AagmxGeH3BJYrhCojgMeR",    "user_password" : "",    "app_uid" : "8361996",    "player_id" : "CCA053A8B547F81DB239AAB1B9074847",    "nickname" : "游客",    "user_type" : 2  }]',   '2637127998-ss520520'},
{'0o2VLlOcaMpodNUtpv15kCmAyaQazmJD',   '[  {    "app_token" : "0o2VLlOcaMpodNUtpv15kCmAyaQazmJD",    "user_password" : "",    "app_uid" : "8362096",    "player_id" : "2A1406936D7551A5ADFDB10F41C7D9FE",    "nickname" : "游客",    "user_type" : 2  }]',   '1184499956-z121214..'},
{'qaODSn8oTn8mfsjcGGAVvGBk92SFijAW',   '[  {    "app_token" : "qaODSn8oTn8mfsjcGGAVvGBk92SFijAW",    "user_password" : "",    "app_uid" : "8362204",    "player_id" : "828AE7A1E0CFA7C8ADB4669189429D81",    "nickname" : "游客",    "user_type" : 2  }]',   '2050277248-oGiI27312'},
{'FvrLa2ro7SfHSiaeMtQzxqZ8SruFTlcE',   '[  {    "app_token" : "FvrLa2ro7SfHSiaeMtQzxqZ8SruFTlcE",    "user_password" : "",    "app_uid" : "8362385",    "player_id" : "EC9BA629332F5E19725B40BB73EBD4A1",    "nickname" : "游客",    "user_type" : 2  }]',   '2542281560-fxljm5856'},
{'frSnffJXg3Q0sLA1GjiUfxaOLLYEDn7o',   '[  {    "app_token" : "frSnffJXg3Q0sLA1GjiUfxaOLLYEDn7o",    "user_password" : "",    "app_uid" : "8362466",    "player_id" : "5A35ECDCFCF910FCAF9CD3259C1A8D43",    "nickname" : "游客",    "user_type" : 2  }]',   '2693988769-SPZLC10870'},
{'R3nR3lQ2HpXkmkuX4i4UggvWcrAunWHt',   '[  {    "app_token" : "R3nR3lQ2HpXkmkuX4i4UggvWcrAunWHt",    "user_password" : "",    "app_uid" : "8362569",    "player_id" : "E85AC8F3290FE30B1CCCCAD5DC7D068E",    "nickname" : "游客",    "user_type" : 2  }]',   '1735086131-xiaolin500'},
{'1ixBguEvzNUkNl0FkOEAMn3P51vRcjSO',   '[  {    "app_token" : "1ixBguEvzNUkNl0FkOEAMn3P51vRcjSO",    "user_password" : "",    "app_uid" : "8362645",    "player_id" : "3DDC69243455682707B6533DA5D5DCCC",    "nickname" : "游客",    "user_type" : 2  }]',   '2627595827-o8989o9989'},
{'xzraidJprkDxBuZAdKd4eXpAdlFmBBNw',   '[  {    "app_token" : "xzraidJprkDxBuZAdKd4eXpAdlFmBBNw",    "user_password" : "",    "app_uid" : "8362734",    "player_id" : "398651100F656E6CC2A6B2EDAAC677B4",    "nickname" : "游客",    "user_type" : 2  }]',   '3409134655-ch20040202'},
{'dNCV08VKswZe1Nts0Zn5KLWLA9zdnVFz',   '[  {    "app_token" : "dNCV08VKswZe1Nts0Zn5KLWLA9zdnVFz",    "user_password" : "",    "app_uid" : "8362967",    "player_id" : "E09DF2E9A67020AB62F6E715AEE5F80C",    "nickname" : "游客",    "user_type" : 2  }]',   '2257692172-gald0027'},
{'1uz5SCLVxPSfZIb8oNDPcEkQHh1hXxiG',   '[  {    "app_token" : "1uz5SCLVxPSfZIb8oNDPcEkQHh1hXxiG",    "user_password" : "",    "app_uid" : "8363323",    "player_id" : "D5E6C9F15F1CC7111F4B872D41532A96",    "nickname" : "游客",    "user_type" : 2  }]',   '1751128433-eojfzs4654'},
{'biDo8GOqNQfC5zBcZe4cde5MP7sA04zk',   '[  {    "app_token" : "biDo8GOqNQfC5zBcZe4cde5MP7sA04zk",    "user_password" : "",    "app_uid" : "8363401",    "player_id" : "ACA66745D50A4B8FE159449A3A9671CA",    "nickname" : "游客",    "user_type" : 2  }]',   '2157433847-whd222222'},
{'kyc8QUDAc2ofXfqeqa1GpkwvLDatF7ax',   '[  {    "app_token" : "kyc8QUDAc2ofXfqeqa1GpkwvLDatF7ax",    "user_password" : "",    "app_uid" : "8363898",    "player_id" : "B631185834B35CD7FE2C88D9B1EB2A8F",    "nickname" : "游客",    "user_type" : 2  }]',   '1450940980-hcyad2275'},
{'VhIW0YbN0zQ4RZz5zRXx6A4h5kLhSePN',   '[  {    "app_token" : "VhIW0YbN0zQ4RZz5zRXx6A4h5kLhSePN",    "user_password" : "",    "app_uid" : "8363972",    "player_id" : "3511348562411250D9928A31A7A4025F",    "nickname" : "游客",    "user_type" : 2  }]',   '259802989-kang123..456'},
{'KXbcKFgemidvOzRV9CZf5LyFgjgdTavD',   '[  {    "app_token" : "KXbcKFgemidvOzRV9CZf5LyFgjgdTavD",    "user_password" : "",    "app_uid" : "8364338",    "player_id" : "FA51ADFF23E40F0919D22BAB1C5DE31B",    "nickname" : "游客",    "user_type" : 2  }]',   '2496264775-xiaolin500'},
{'x8cl9MEILJ5Lrc4in8AnWQbbLPvRMj6J',   '[  {    "app_token" : "x8cl9MEILJ5Lrc4in8AnWQbbLPvRMj6J",    "user_password" : "",    "app_uid" : "8364617",    "player_id" : "04B1E59A656DF3660E1220481BF7EB6E",    "nickname" : "游客",    "user_type" : 2  }]',   '3429586403-kklong191222'},
{'cGxD468VhCtwydHLtQncYiiVRxrmaqdk',   '[  {    "app_token" : "cGxD468VhCtwydHLtQncYiiVRxrmaqdk",    "user_password" : "",    "app_uid" : "8364693",    "player_id" : "FD1BA73275D3F5816E73CAE9703E8BFF",    "nickname" : "游客",    "user_type" : 2  }]',   '3078868257-ue769820'},
{'Soi61aoI8gAvYqxQkDvEZasqtATdGYPx',   '[  {    "app_token" : "Soi61aoI8gAvYqxQkDvEZasqtATdGYPx",    "user_password" : "",    "app_uid" : "8364784",    "player_id" : "98854EA6CF8F3B8B8D6E448C549D94A1",    "nickname" : "游客",    "user_type" : 2  }]',   '3437429379-qweqwe123'},
{'iXnAETCRsDDLM7W43qGmEslcYhD3F2H7',   '[  {    "app_token" : "iXnAETCRsDDLM7W43qGmEslcYhD3F2H7",    "user_password" : "",    "app_uid" : "8365174",    "player_id" : "9368468AF3D26FAFCA26612A59BB2DCA",    "nickname" : "游客",    "user_type" : 2  }]',   '2270989665-rjjwze130697'},
{'fRqw7Y1iHq7IXHqndTqv9ajSNZpru8L6',   '[  {    "app_token" : "fRqw7Y1iHq7IXHqndTqv9ajSNZpru8L6",    "user_password" : "",    "app_uid" : "8365860",    "player_id" : "1EADBBDF6FE15AC385DC95A82883CE5C",    "nickname" : "游客",    "user_type" : 2  }]',   '3624758401-fskch90395'},
{'R8lJvnt0xaiqtr4xyQzvCLmgKKcL8AXM',   '[  {    "app_token" : "R8lJvnt0xaiqtr4xyQzvCLmgKKcL8AXM",    "user_password" : "",    "app_uid" : "8366062",    "player_id" : "A1676295B044BC7DB35F870C83F045E7",    "nickname" : "游客",    "user_type" : 2  }]',   '64279220-ff121214..'},
{'TG7jmYeDD2FtER5lxgvo4aTubVAMCY7p',   '[  {    "app_token" : "TG7jmYeDD2FtER5lxgvo4aTubVAMCY7p",    "user_password" : "",    "app_uid" : "8366511",    "player_id" : "F5AA5863EAFA2A437F59545D90B2CC1E",    "nickname" : "游客",    "user_type" : 2  }]',   '2337343056-vnpa6403'},
{'WRJjfD59X6rwllLUohl8i5tLp7iyqEKW',   '[  {    "app_token" : "WRJjfD59X6rwllLUohl8i5tLp7iyqEKW",    "user_password" : "",    "app_uid" : "8366897",    "player_id" : "D3FC803BD045121CF52C9C7C33441DFF",    "nickname" : "游客",    "user_type" : 2  }]',   '3626211389-kOxYs12559'},
{'82PbGOJpD8TOH5C9AQaXyC1DO7UC8KNf',   '[  {    "app_token" : "82PbGOJpD8TOH5C9AQaXyC1DO7UC8KNf",    "user_password" : "",    "app_uid" : "8366976",    "player_id" : "26A6A5064CEAD7F4C37E150812CA9E3C",    "nickname" : "游客",    "user_type" : 2  }]',   '2669394753-nxrgf9022'},
{'8Bm0s6hbuyTa6IsBUOChDrrIOQEhZbdK',   '[  {    "app_token" : "8Bm0s6hbuyTa6IsBUOChDrrIOQEhZbdK",    "user_password" : "",    "app_uid" : "8367562",    "player_id" : "CB9719A2F99311A8DC218CD48F693505",    "nickname" : "游客",    "user_type" : 2  }]',   '2531242930-ty248m8q1bx'},
{'YHaaOmvHlh6lnI995HWwLiqmbHkNhGmS',   '[  {    "app_token" : "YHaaOmvHlh6lnI995HWwLiqmbHkNhGmS",    "user_password" : "",    "app_uid" : "8367690",    "player_id" : "542016194829BE170EA0515DE4E39A85",    "nickname" : "游客",    "user_type" : 2  }]',   '2495099312-vf279678'},
{'58wcKj8WADKJDa8RRiUDnzffgbCOQr2S',   '[  {    "app_token" : "58wcKj8WADKJDa8RRiUDnzffgbCOQr2S",    "user_password" : "",    "app_uid" : "8367768",    "player_id" : "39F9C3B54BAEF0FDB1B56DA2962AC6E8",    "nickname" : "游客",    "user_type" : 2  }]',   '3431097866-changqing81'},
{'6qzgg9WhGgGAisJ3WEmmE3oROxiosm96',   '[  {    "app_token" : "6qzgg9WhGgGAisJ3WEmmE3oROxiosm96",    "user_password" : "",    "app_uid" : "8367908",    "player_id" : "F90712864FD43F20AD03F5A71CEA541B",    "nickname" : "游客",    "user_type" : 2  }]',   '2146177018-qaz11111'},
{'yQ5Ys4dzM26qzMYBdJD2g3SdyUHsEIdz',   '[  {    "app_token" : "yQ5Ys4dzM26qzMYBdJD2g3SdyUHsEIdz",    "user_password" : "",    "app_uid" : "8368226",    "player_id" : "E11EF7F99518B90E34087064D492C628",    "nickname" : "游客",    "user_type" : 2  }]',   '2370295534-Mmueo38669'},
{'tR67IKauOHj9FlMiZm04AqFS37fYXkaV',   '[  {    "app_token" : "tR67IKauOHj9FlMiZm04AqFS37fYXkaV",    "user_password" : "",    "app_uid" : "8368298",    "player_id" : "6018E5168C9C7436A1F30891146A2F69",    "nickname" : "游客",    "user_type" : 2  }]',   '435221824-utkx3765'},
{'968WtiX0LZngbmFqMo0fOBUhIGh0rutc',   '[  {    "app_token" : "968WtiX0LZngbmFqMo0fOBUhIGh0rutc",    "user_password" : "",    "app_uid" : "8368436",    "player_id" : "1399B8259FF8B261FB80F3196044ED22",    "nickname" : "游客",    "user_type" : 2  }]',   '3383779614-dw3592moav7'},
{'grOkYfy9mW3ErtMS4E4UcZMr8AefxwsD',   '[  {    "app_token" : "grOkYfy9mW3ErtMS4E4UcZMr8AefxwsD",    "user_password" : "",    "app_uid" : "8368573",    "player_id" : "F2A1F3055D99737F93EF6A377ECC9E1E",    "nickname" : "游客",    "user_type" : 2  }]',   '3077096944-ykfk3454'},
{'APHzQbrblE0ofPREHoaY4xxZhW2ilKQI',   '[  {    "app_token" : "APHzQbrblE0ofPREHoaY4xxZhW2ilKQI",    "user_password" : "",    "app_uid" : "8368914",    "player_id" : "2586D4EA5329D397B7A364CDFA27F612",    "nickname" : "游客",    "user_type" : 2  }]',   '3365345171-fa711838'},
{'p4p9RaXAUzVMlBy8SHG9alV0L84YrKsV',   '[  {    "app_token" : "p4p9RaXAUzVMlBy8SHG9alV0L84YrKsV",    "user_password" : "",    "app_uid" : "8369584",    "player_id" : "244FA68603F4FB00FE5AF259C8E46A8A",    "nickname" : "游客",    "user_type" : 2  }]',   '2171915277-sundaydlovenot20'},
{'dRpxlol0onbFsSFTnEKZkS4ETwmriDaW',   '[  {    "app_token" : "dRpxlol0onbFsSFTnEKZkS4ETwmriDaW",    "user_password" : "",    "app_uid" : "8369941",    "player_id" : "8DF2B4092CA358D304BE590E19CFBF6A",    "nickname" : "游客",    "user_type" : 2  }]',   '348459105-sesfr466'},
{'ZOSUjgGHjPtRU907wRrpA9VZ3dJkHzVj',   '[  {    "app_token" : "ZOSUjgGHjPtRU907wRrpA9VZ3dJkHzVj",    "user_password" : "",    "app_uid" : "8370624",    "player_id" : "652FDB89792491E8398ABBBD38C7FCFB",    "nickname" : "游客",    "user_type" : 2  }]',   '2788971086-weiwei147'},
{'tV7gFs9WArcVNU294bLmsLUX103Y7yWz',   '[  {    "app_token" : "tV7gFs9WArcVNU294bLmsLUX103Y7yWz",    "user_password" : "",    "app_uid" : "8371360",    "player_id" : "292507F4B83C55B9A4E7056978BB1C05",    "nickname" : "游客",    "user_type" : 2  }]',   '3443964761-tBrE41404'},
{'F5xpML6rVgyEzemdTalGcqtj00zDPnAW',   '[  {    "app_token" : "F5xpML6rVgyEzemdTalGcqtj00zDPnAW",    "user_password" : "",    "app_uid" : "8371607",    "player_id" : "CDD30EA23936E122918A672D5ED09AC6",    "nickname" : "游客",    "user_type" : 2  }]',   '912459758-dq752792'},
{'ZFvSPQZ91gKzI2IKVLYNRQM9DtfxovE5',   '[  {    "app_token" : "ZFvSPQZ91gKzI2IKVLYNRQM9DtfxovE5",    "user_password" : "",    "app_uid" : "8371684",    "player_id" : "AE158BC4AE2ABEA27D9221C56EBB46DF",    "nickname" : "游客",    "user_type" : 2  }]',   '1283432440-edgf3810'},
{'zBfUItKL3eH6jYFl24i2CXTHqmL9dI8K',   '[  {    "app_token" : "zBfUItKL3eH6jYFl24i2CXTHqmL9dI8K",    "user_password" : "",    "app_uid" : "8371760",    "player_id" : "51B4BD93CD175FBBBC79F00576F0C937",    "nickname" : "游客",    "user_type" : 2  }]',   '2492760958-vv520520'},
{'QXNJbul2qFY4aWwj2j8cf3bjOFhygsNZ',   '[  {    "app_token" : "QXNJbul2qFY4aWwj2j8cf3bjOFhygsNZ",    "user_password" : "",    "app_uid" : "8372098",    "player_id" : "34D49605EA534AA1066951632132C803",    "nickname" : "游客",    "user_type" : 2  }]',   '2013361370-ssd373123'},
{'2djwVlAZNa5bNMDTpr9zT5J5Bc2Qliq9',   '[  {    "app_token" : "2djwVlAZNa5bNMDTpr9zT5J5Bc2Qliq9",    "user_password" : "",    "app_uid" : "8372334",    "player_id" : "7F021235EACD68DB3844EA7F01B99702",    "nickname" : "游客",    "user_type" : 2  }]',   '2860605641-aeim4062'},
{'LOQ9CjWpNWAbWnUUjHmKyv62KGXukZHa',   '[  {    "app_token" : "LOQ9CjWpNWAbWnUUjHmKyv62KGXukZHa",    "user_password" : "",    "app_uid" : "8372532",    "player_id" : "2BFDA4FBFD20ADCE712F1DDA9C3D836E",    "nickname" : "游客",    "user_type" : 2  }]',   '1592145793-13783363441'},
{'12HEZb3odL3OAjPn7hEqlapL6kpMHwKJ',   '[  {    "app_token" : "12HEZb3odL3OAjPn7hEqlapL6kpMHwKJ",    "user_password" : "",    "app_uid" : "8372656",    "player_id" : "6E1F6332903BD5CA22DC45B5BB83B78B",    "nickname" : "游客",    "user_type" : 2  }]',   '1825942841-xrzik3628'},
{'uwmf50tfTVV0EA6XEOeSGBtD4lTs758i',   '[  {    "app_token" : "uwmf50tfTVV0EA6XEOeSGBtD4lTs758i",    "user_password" : "",    "app_uid" : "8372919",    "player_id" : "562FFF4F4F65A052DE779B64E9377F94",    "nickname" : "游客",    "user_type" : 2  }]',   '3013675845-zzxx.1122'},
{'Jtpj50GOnQKg5QMPuPBSSNVtFoSdf8aW',   '[  {    "app_token" : "Jtpj50GOnQKg5QMPuPBSSNVtFoSdf8aW",    "user_password" : "",    "app_uid" : "8373160",    "player_id" : "3CCA96D5BD736C700810E4245880777A",    "nickname" : "游客",    "user_type" : 2  }]',   '3620323509-jfjhsi84742'},
{'Dr2lySNSSjX4xCqoHUWNrh5jKxFcs2hE',   '[  {    "app_token" : "Dr2lySNSSjX4xCqoHUWNrh5jKxFcs2hE",    "user_password" : "",    "app_uid" : "8373288",    "player_id" : "2B9A0881812EE5867ADEE95D2CBC4449",    "nickname" : "游客",    "user_type" : 2  }]',   '1831015992-qweqwe123'},
{'w2Ivpl59inXo8VAEgGVA90MvhUAYAwLe',   '[  {    "app_token" : "w2Ivpl59inXo8VAEgGVA90MvhUAYAwLe",    "user_password" : "",    "app_uid" : "8373436",    "player_id" : "131FDA0FC3DE47E0E2946FFF75D28221",    "nickname" : "游客",    "user_type" : 2  }]',   '1727360346-zuzuzu321q'},
{'aIoNOpebliE6OJGRJ1fydvccrDxcKTjk',   '[  {    "app_token" : "aIoNOpebliE6OJGRJ1fydvccrDxcKTjk",    "user_password" : "",    "app_uid" : "8373886",    "player_id" : "D6C0276ACFB889ACE2B57F57073B853D",    "nickname" : "游客",    "user_type" : 2  }]',   '1533123394-aaa.123'},
{'LM8e6aj7GweTBI8UWOSGXoOJVZon0y9z',   '[  {    "app_token" : "LM8e6aj7GweTBI8UWOSGXoOJVZon0y9z",    "user_password" : "",    "app_uid" : "8374545",    "player_id" : "FA0B7A322A6C642CD83340468D7ADABE",    "nickname" : "游客",    "user_type" : 2  }]',   '2509893937-ymcot5613'},
{'v02tvHStShBnDh1FDbqyhUeAshX2iP8m',   '[  {    "app_token" : "v02tvHStShBnDh1FDbqyhUeAshX2iP8m",    "user_password" : "",    "app_uid" : "8374619",    "player_id" : "0213676BFD41043FD04A7F3538D9BD6D",    "nickname" : "游客",    "user_type" : 2  }]',   '2810700550-qaz11111'},
{'gEuhZJUBuUCq5MUgsuIzMSfjk0FhTjYP',   '[  {    "app_token" : "gEuhZJUBuUCq5MUgsuIzMSfjk0FhTjYP",    "user_password" : "",    "app_uid" : "8374680",    "player_id" : "D8F18D23229A647439372CA763356859",    "nickname" : "游客",    "user_type" : 2  }]',   '2572794210-py41y5flf71'},
{'cOEWYAEPEFtFbjnFVoSpRa767BwttRAA',   '[  {    "app_token" : "cOEWYAEPEFtFbjnFVoSpRa767BwttRAA",    "user_password" : "",    "app_uid" : "8374871",    "player_id" : "176D949A651BCED3B1F113833398EC7E",    "nickname" : "游客",    "user_type" : 2  }]',   '3097611350-whd96651'},
{'D8ii1T3UOfI2DVej2hHcDpfA20qXKJw3',   '[  {    "app_token" : "D8ii1T3UOfI2DVej2hHcDpfA20qXKJw3",    "user_password" : "",    "app_uid" : "8375284",    "player_id" : "0D1D5651CC04823D54C3496FE1473C3E",    "nickname" : "游客",    "user_type" : 2  }]',   '3150108825-pkrqd9883'},
{'ANFruBgDCmu3AXaojTt33in13VH92Avz',   '[  {    "app_token" : "ANFruBgDCmu3AXaojTt33in13VH92Avz",    "user_password" : "",    "app_uid" : "8375673",    "player_id" : "B3EEDB8C23353EF600E5086F889D8777",    "nickname" : "游客",    "user_type" : 2  }]',   '3424765749-bRrT63337'},
{'Xoi3GIFZrGbEfxdHL3kYgZLdjDSeaIxp',   '[  {    "app_token" : "Xoi3GIFZrGbEfxdHL3kYgZLdjDSeaIxp",    "user_password" : "",    "app_uid" : "8375843",    "player_id" : "D4FBAA993660110C6C0C9E9F148C9806",    "nickname" : "游客",    "user_type" : 2  }]',   '2036222782-veazv9871'},
{'swWZEs4fdYANmE6V0ZXdwRvzz3ZUnHSW',   '[  {    "app_token" : "swWZEs4fdYANmE6V0ZXdwRvzz3ZUnHSW",    "user_password" : "",    "app_uid" : "8375919",    "player_id" : "FD4220552B550690D2CF605A7FC2AA71",    "nickname" : "游客",    "user_type" : 2  }]',   '3467879556-gvtvt70489'},
{'fbFcBrM1dPILSGsapzunIKMgQwaTueMe',   '[  {    "app_token" : "fbFcBrM1dPILSGsapzunIKMgQwaTueMe",    "user_password" : "",    "app_uid" : "8376004",    "player_id" : "551C5F131C381AE9D44B5D9224C29E5B",    "nickname" : "游客",    "user_type" : 2  }]',   '2497085348-whhhdbzzj2'},
{'DsCTs8UGWt9WXjbgvWlmxp5bXttAuyFO',   '[  {    "app_token" : "DsCTs8UGWt9WXjbgvWlmxp5bXttAuyFO",    "user_password" : "",    "app_uid" : "8376086",    "player_id" : "52C1FCDE3E3E312638745807920811A3",    "nickname" : "游客",    "user_type" : 2  }]',   '195285863-asd123456'},
{'D3AF3oJ4pf6NVjSJkSt34a7qZfTx36K9',   '[  {    "app_token" : "D3AF3oJ4pf6NVjSJkSt34a7qZfTx36K9",    "user_password" : "",    "app_uid" : "8376171",    "player_id" : "742CFA23BA1BA09ADE3067131D87FCB2",    "nickname" : "游客",    "user_type" : 2  }]',   '2157806225-mima0712'},
{'si6PgzH3BjTCXJYt7W5nHf26DjdIWLjW',   '[  {    "app_token" : "si6PgzH3BjTCXJYt7W5nHf26DjdIWLjW",    "user_password" : "",    "app_uid" : "8376422",    "player_id" : "293E1F16F184B4750FAD15FD5555AAB5",    "nickname" : "游客",    "user_type" : 2  }]',   '2606524478-qaz11111'},
{'U0oMaQs0sDt3WpPcWnbJIKQyaBiPDw8H',   '[  {    "app_token" : "U0oMaQs0sDt3WpPcWnbJIKQyaBiPDw8H",    "user_password" : "",    "app_uid" : "8376485",    "player_id" : "ECEB4F911D93D6E351D79833090232A1",    "nickname" : "游客",    "user_type" : 2  }]',   '1940969956-qwe11223'},
{'tPMDFOPuaR0I6sD7YHM9HxSEbVhip0Gg',   '[  {    "app_token" : "tPMDFOPuaR0I6sD7YHM9HxSEbVhip0Gg",    "user_password" : "",    "app_uid" : "8376582",    "player_id" : "53628562C8FF2542F8DE0E70E45443B4",    "nickname" : "游客",    "user_type" : 2  }]',   '1353115097-aOfC51138'},
{'e2ylOSzYtHTfC3Ilhgr0IBrgdx4DVnya',   '[  {    "app_token" : "e2ylOSzYtHTfC3Ilhgr0IBrgdx4DVnya",    "user_password" : "",    "app_uid" : "8376927",    "player_id" : "68835C25962FB39156AC28E696288CFA",    "nickname" : "游客",    "user_type" : 2  }]',   '1750807404-lRuC92719'},
{'U9ZpFC1CRTTdYDGm5B5HPuoepvXASFB4',   '[  {    "app_token" : "U9ZpFC1CRTTdYDGm5B5HPuoepvXASFB4",    "user_password" : "",    "app_uid" : "8376985",    "player_id" : "766FC8DAAFF13B9375A348A43A7ABEA7",    "nickname" : "游客",    "user_type" : 2  }]',   '3408083753-bbbb8888'},
{'mTsy9yeD6nLUerUis1u1kIAS0HHgQ6ss',   '[  {    "app_token" : "mTsy9yeD6nLUerUis1u1kIAS0HHgQ6ss",    "user_password" : "",    "app_uid" : "8377122",    "player_id" : "E3CACC5D6F734A25E5C74F570F7A8589",    "nickname" : "游客",    "user_type" : 2  }]',   '1127031995-xx110110'},
{'g89ThTsz86GGvmAolXXLmZMnwsIeR47l',   '[  {    "app_token" : "g89ThTsz86GGvmAolXXLmZMnwsIeR47l",    "user_password" : "",    "app_uid" : "8377234",    "player_id" : "3ECC23224B687E012E4226CCADC9AB47",    "nickname" : "游客",    "user_type" : 2  }]',   '2773233991-yaxqm8523'},
{'hn119dXstcPFun7I1W39XkYpKldUav2i',   '[  {    "app_token" : "hn119dXstcPFun7I1W39XkYpKldUav2i",    "user_password" : "",    "app_uid" : "8377572",    "player_id" : "9A22DFB871C943127F73E42BE9DBF66C",    "nickname" : "游客",    "user_type" : 2  }]',   '1933370472-aaa.123'},
{'vgVCG2NjKfaIP0ommv0FkWrUAJyo8jOW',   '[  {    "app_token" : "vgVCG2NjKfaIP0ommv0FkWrUAJyo8jOW",    "user_password" : "",    "app_uid" : "8377651",    "player_id" : "441E4F6BCD34C4224796ED4F727B250B",    "nickname" : "游客",    "user_type" : 2  }]',   '346411087-rjhu2769'},
{'pYEzbMS5bS9qRTRDpmXme76TA2GTISKZ',   '[  {    "app_token" : "pYEzbMS5bS9qRTRDpmXme76TA2GTISKZ",    "user_password" : "",    "app_uid" : "8378449",    "player_id" : "8C51B5DBC8681FC8B96B7C8096558F71",    "nickname" : "游客",    "user_type" : 2  }]',   '914984170-qqq789qqq'},
{'19gIyY0T8PvitLXhMPvmnUCMP8WoY7yk',   '[  {    "app_token" : "19gIyY0T8PvitLXhMPvmnUCMP8WoY7yk",    "user_password" : "",    "app_uid" : "8378654",    "player_id" : "C6C486EE116151ACEF0EA44DC55FDDCF",    "nickname" : "游客",    "user_type" : 2  }]',   '1763305603-meng99575682'},
{'ICMOgIMo5oNneWCKAbZaLOkba7faGtME',   '[  {    "app_token" : "ICMOgIMo5oNneWCKAbZaLOkba7faGtME",    "user_password" : "",    "app_uid" : "8379051",    "player_id" : "43445E8B33887BEB0D4FB49275C70108",    "nickname" : "游客",    "user_type" : 2  }]',   '3430313545-kq686977'},
{'WXz7e9OHWGOShD8ficB3xnjOrymhrED9',   '[  {    "app_token" : "WXz7e9OHWGOShD8ficB3xnjOrymhrED9",    "user_password" : "",    "app_uid" : "8379164",    "player_id" : "36B362CA0BCFE6F2AC7FD8653F0768AB",    "nickname" : "游客",    "user_type" : 2  }]',   '2874027508-qwe1234567a'},
{'5BPJ9pmz8990hfc5ex5mcky5v3kZxgVT',   '[  {    "app_token" : "5BPJ9pmz8990hfc5ex5mcky5v3kZxgVT",    "user_password" : "",    "app_uid" : "8379400",    "player_id" : "40126337E84E299DCAB7D2891791972F",    "nickname" : "游客",    "user_type" : 2  }]',   '3466640172-aaaa1018'},
{'cAh9iHXQxFZrH2yUAp5pHMlXY7LdakOs',   '[  {    "app_token" : "cAh9iHXQxFZrH2yUAp5pHMlXY7LdakOs",    "user_password" : "",    "app_uid" : "8379545",    "player_id" : "E1755A217D5BFEB1FD00CBEDCCA3F885",    "nickname" : "游客",    "user_type" : 2  }]',   '3536992622-dc711152'},
{'G08Wchn0nALrdLCXrZsU50cngiaccKFk',   '[  {    "app_token" : "G08Wchn0nALrdLCXrZsU50cngiaccKFk",    "user_password" : "",    "app_uid" : "8379869",    "player_id" : "3E46339DCF736FC66C069EFBFCE191F2",    "nickname" : "游客",    "user_type" : 2  }]',   '3340542331-kYeN97734'},
{'ue5G6ZCagu9WjGD2vrgm40ygVFzqSXzq',   '[  {    "app_token" : "ue5G6ZCagu9WjGD2vrgm40ygVFzqSXzq",    "user_password" : "",    "app_uid" : "8380018",    "player_id" : "B60A198D05B0EC4D45F256EDB9FDABBD",    "nickname" : "游客",    "user_type" : 2  }]',   '1164747703-yueyue611'},
{'OCsTWPIG51ZLswGtOe0pWWsEvMlNnexW',   '[  {    "app_token" : "OCsTWPIG51ZLswGtOe0pWWsEvMlNnexW",    "user_password" : "",    "app_uid" : "8380753",    "player_id" : "33ED2AAA89ABF61B5FC82B615629F879",    "nickname" : "游客",    "user_type" : 2  }]',   '3127800637-dddd5555'},

}

    
-- for k,v in ipairs( a )do
--     log(v)
--     update_token(v[1],v[2],v[3])
-- end

init(1)

t={}
    t['采集-已经有队伍-1']={0xfefefe, "0|0|0xfefefe,0|4|0xf3f3f3,0|11|0x000000,4|11|0x15180c",90,1262,166,1275,184}
    t['采集-已经有队伍-2']={0xffffff, "0|0|0xffffff,0|2|0x000000,5|2|0x020404,0|-8|0x121212,3|-8|0xf7f7f7",90,1262,166,1275,184}
    t['采集-已经有队伍-3']={0xffffff, "0|0|0xffffff,0|-3|0x040404,0|-5|0xfefefe,3|-8|0xffffff,0|-8|0x0a0a0a",90,1259,165,1274,185}
    t['采集-已经有队伍-4']={0xfafafa, "0|0|0xfafafa,1|-9|0xffffff,-5|-3|0xf9faf9",90,1261,167,1276,186}
    
    t['采集-已经有队伍-1-max']={0xfefefe, "0|0|0xfefefe,0|4|0xf3f3f3,0|11|0x000000,4|11|0x15180c",90,1280,169,1295,185}
    t['采集-已经有队伍-2-max']={0xffffff, "0|0|0xffffff,0|2|0x000000,5|2|0x020404,0|-8|0x121212,3|-8|0xf7f7f7",90,1280,169,1295,185}
    t['采集-已经有队伍-3-max']={0xffffff, "0|0|0xffffff,0|-3|0x040404,0|-5|0xfefefe,3|-8|0xffffff,0|-8|0x0a0a0a",90,1280,169,1295,185}
    t['采集-已经有队伍-4-max']={0xfafafa, "0|0|0xfafafa,1|-9|0xffffff,-5|-3|0xf9faf9",90,1280,169,1295,185}
    
    
    
a = 'E-Z7'
    
    log(#a)
    
    
    
    
    
    
    
